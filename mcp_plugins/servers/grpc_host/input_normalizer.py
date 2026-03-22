"""
InputNormalizer — Deterministic pre-processor for Requirements Engineer output.

Detects the pipeline output format and converts it to the canonical format
expected by EpicParser and EpicOrchestrator. Runs once, <1s, no LLM calls.

New pipeline format:
  user_stories/epics/epics.json     — structured epic metadata
  user_stories/epics/EPIC-*.md      — individual epic markdown files
  tasks/task_list.json              — feature-grouped task list

Canonical format (expected by engine):
  user_stories/user_stories.md      — contains # EPIC-XXX: headers
  tasks/epic-001-tasks.json         — per-epic task files
"""
import json
import logging
import re
from datetime import datetime
from pathlib import Path
from typing import Any, Dict, List, Optional

logger = logging.getLogger(__name__)


# Map new pipeline task_type values to engine TaskType values
_TASK_TYPE_MAP = {
    "development": "api",
    "devops": "setup_project",
    "testing": "test_unit",
    "documentation": "api",
    "security": "api_guard",
    "design": "fe_component",
    "research": "api",
}

# Map new pipeline phase names to engine TaskPhase values
_PHASE_MAP = {
    "FOUNDATION": "setup",
    "CORE": "api",
    "INTEGRATION": "api",
    "TESTING": "test",
    "DEPLOYMENT": "deploy",
}

# Map new pipeline status to engine TaskStatus values
_STATUS_MAP = {
    "todo": "pending",
    "in_progress": "running",
    "completed": "completed",
    "blocked": "pending",
    "failed": "failed",
}


class InputNormalizer:
    """Normalizes Requirements Engineer output to EpicParser canonical format."""

    def __init__(self, project_path: Path):
        self.project_path = Path(project_path)

    def normalize(self) -> bool:
        """
        Detect format and normalize if needed.

        Returns True if normalization was performed, False if already canonical
        or no new-format data found.
        """
        # Skip if already normalized (canonical per-epic task files exist)
        if (self.project_path / "tasks" / "epic-001-tasks.json").exists():
            logger.info("Input already in canonical format, skipping normalization")
            return False

        # Detect new pipeline format
        epics_json_path = self.project_path / "user_stories" / "epics" / "epics.json"
        task_list_path = self.project_path / "tasks" / "task_list.json"

        if not epics_json_path.exists():
            logger.info("No epics.json found, assuming legacy format")
            return False

        # Load epic metadata
        try:
            epics_data = json.loads(epics_json_path.read_text(encoding="utf-8"))
        except Exception as e:
            logger.error(f"Failed to read epics.json: {e}")
            return False

        if not epics_data:
            logger.warning("epics.json is empty")
            return False

        logger.info(f"Detected new pipeline format: {len(epics_data)} epics")

        # Step 1: Inject epic headers into user_stories.md
        self._inject_epic_headers(epics_data)

        # Step 2: Generate per-epic task files
        if task_list_path.exists():
            self._generate_per_epic_tasks(epics_data, task_list_path)
        else:
            logger.warning("No task_list.json found, skipping task normalization")

        return True

    def _inject_epic_headers(self, epics_data: List[Dict[str, Any]]) -> None:
        """
        Prepend epic sections to user_stories.md so EpicParser can find them.

        Reads individual EPIC-*.md files if available, otherwise generates
        sections from epics.json metadata.
        """
        user_stories_path = self.project_path / "user_stories" / "user_stories.md"
        epics_dir = self.project_path / "user_stories" / "epics"

        # Read existing content
        existing_content = ""
        if user_stories_path.exists():
            existing_content = user_stories_path.read_text(encoding="utf-8")

        # Skip if already has epic headers
        if re.search(r"^# EPIC-\d{3}:", existing_content, re.MULTILINE):
            logger.info("user_stories.md already has EPIC headers, skipping injection")
            return

        # Build epic sections
        epic_sections = []
        for epic in epics_data:
            epic_id = epic.get("id", "")
            epic_md_path = epics_dir / f"{epic_id}.md"

            if epic_md_path.exists():
                # Use the individual MD file content directly
                epic_sections.append(epic_md_path.read_text(encoding="utf-8"))
            else:
                # Generate from JSON metadata
                section = self._epic_json_to_markdown(epic)
                epic_sections.append(section)

        # Prepend epic sections before user stories
        combined = "\n\n---\n\n".join(epic_sections)
        new_content = combined + "\n\n---\n\n" + existing_content

        user_stories_path.write_text(new_content, encoding="utf-8")
        logger.info(f"Injected {len(epic_sections)} epic headers into user_stories.md")

    def _epic_json_to_markdown(self, epic: Dict[str, Any]) -> str:
        """Convert a single epic JSON object to the markdown format EpicParser expects."""
        epic_id = epic.get("id", "EPIC-000")
        title = epic.get("title", "Unknown")
        description = epic.get("description", "")
        status = epic.get("status", "draft")

        lines = [
            f"# {epic_id}: {title}",
            "",
            f"**Status:** {status}",
            "",
            "## Description",
            "",
            description,
            "",
            "## Linked Requirements",
            "",
        ]

        # Requirements — handle both field names
        requirements = epic.get("parent_requirements", epic.get("requirements", []))
        for req in requirements:
            lines.append(f"- {req}")

        lines.extend(["", "## User Stories", ""])

        user_stories = epic.get("user_stories", [])
        for us in user_stories:
            lines.append(f"- {us}")

        return "\n".join(lines)

    def _generate_per_epic_tasks(
        self,
        epics_data: List[Dict[str, Any]],
        task_list_path: Path,
    ) -> None:
        """
        Split task_list.json into per-epic task files in canonical format.

        Mapping strategy:
        1. Tasks in EPIC-XXX groups → direct assignment
        2. Tasks in FEAT-XXX groups → FEAT-001→EPIC-001 (positional mapping)
        3. ungrouped/DATABASE/API tasks → assign to EPIC-001 (setup)
        """
        try:
            task_data = json.loads(task_list_path.read_text(encoding="utf-8"))
        except Exception as e:
            logger.error(f"Failed to read task_list.json: {e}")
            return

        features = task_data.get("features", {})

        # Build US→epic mapping from epics_data
        us_to_epic: Dict[str, str] = {}
        epic_names: Dict[str, str] = {}
        for epic in epics_data:
            eid = epic.get("id", "")
            epic_names[eid] = epic.get("title", "")
            for us in epic.get("user_stories", []):
                us_to_epic[us] = eid

        # Build FEAT→EPIC positional mapping (FEAT-001→EPIC-001 etc.)
        feat_to_epic: Dict[str, str] = {}
        epic_ids = sorted(epic_names.keys())
        for i, eid in enumerate(epic_ids):
            feat_id = f"FEAT-{i + 1:03d}"
            feat_to_epic[feat_id] = eid

        # Collect tasks per epic
        epic_tasks: Dict[str, List[Dict[str, Any]]] = {eid: [] for eid in epic_ids}
        task_counter: Dict[str, int] = {eid: 0 for eid in epic_ids}

        for group_key, tasks in features.items():
            if not isinstance(tasks, list):
                continue

            for task in tasks:
                # Determine target epic
                target_epic = None

                # Direct EPIC-XXX group
                if group_key.startswith("EPIC-") and group_key in epic_tasks:
                    target_epic = group_key

                # FEAT-XXX → EPIC-XXX mapping
                elif group_key.startswith("FEAT-"):
                    target_epic = feat_to_epic.get(group_key)

                # Try user story reference
                elif not target_epic:
                    us_ref = task.get("parent_user_story_id", "")
                    if us_ref and us_ref in us_to_epic:
                        target_epic = us_to_epic[us_ref]

                # Fallback: first epic
                if not target_epic:
                    target_epic = epic_ids[0] if epic_ids else "EPIC-001"

                # Normalize task to canonical format
                canonical = self._normalize_task(task, target_epic)
                if target_epic in epic_tasks:
                    epic_tasks[target_epic].append(canonical)
                    task_counter[target_epic] += 1

        # Write per-epic task files
        tasks_dir = self.project_path / "tasks"
        tasks_dir.mkdir(parents=True, exist_ok=True)

        for epic_id in epic_ids:
            tasks = epic_tasks.get(epic_id, [])
            if not tasks:
                continue

            # Renumber task IDs to be unique per epic
            epic_prefix = epic_id.replace("EPIC-", "")
            for i, t in enumerate(tasks):
                original_id = t["id"]
                new_id = f"{epic_id}-TASK-{i + 1:03d}"
                # Update dependencies to use new IDs
                t["_original_id"] = original_id
                t["id"] = new_id

            # Resolve dependency references
            id_map = {t["_original_id"]: t["id"] for t in tasks}
            for t in tasks:
                t["dependencies"] = [
                    id_map.get(dep, dep) for dep in t.get("dependencies", [])
                ]
                t.pop("_original_id", None)

            output = {
                "epic_id": epic_id,
                "epic_name": epic_names.get(epic_id, ""),
                "tasks": tasks,
                "total_tasks": len(tasks),
                "completed_tasks": 0,
                "failed_tasks": 0,
                "progress_percent": 0.0,
                "run_count": 0,
                "last_run_at": None,
                "created_at": datetime.now().isoformat(),
                "estimated_total_minutes": sum(
                    t.get("estimated_minutes", 5) for t in tasks
                ),
            }

            file_path = tasks_dir / f"{epic_id.lower()}-tasks.json"
            file_path.write_text(json.dumps(output, indent=2, ensure_ascii=False), encoding="utf-8")
            logger.info(f"Generated {file_path.name}: {len(tasks)} tasks")

        total = sum(task_counter.values())
        logger.info(f"Task normalization complete: {total} tasks across {len(epic_ids)} epics")

    def _normalize_task(self, task: Dict[str, Any], epic_id: str) -> Dict[str, Any]:
        """Convert a single task from pipeline format to canonical Task format."""
        raw_status = task.get("status", "todo")
        raw_type = task.get("task_type", "development")
        raw_phase = task.get("phase", "CORE")

        # Estimate minutes from hours
        hours = task.get("estimated_hours", 1)
        estimated_minutes = max(5, int(hours * 60))
        # Cap at reasonable engine execution time
        estimated_minutes = min(estimated_minutes, 30)

        return {
            "id": task.get("id", "TASK-000"),
            "epic_id": epic_id,
            "type": _TASK_TYPE_MAP.get(raw_type, raw_type),
            "title": task.get("title", ""),
            "description": task.get("description", ""),
            "status": _STATUS_MAP.get(raw_status, "pending"),
            "dependencies": task.get("depends_on", []),
            "estimated_minutes": estimated_minutes,
            "actual_minutes": None,
            "error_message": None,
            "output_files": [],
            "related_requirements": (
                [task["parent_requirement_id"]]
                if task.get("parent_requirement_id")
                else []
            ),
            "related_user_stories": (
                [task["parent_user_story_id"]]
                if task.get("parent_user_story_id")
                else []
            ),
            "requires_user_input": False,
            "user_prompt": None,
            "user_response": None,
            "checkpoint": False,
            "auto_retry": True,
            "max_retries": 3,
            "retry_count": 0,
            "timeout_seconds": 300,
            "phase": _PHASE_MAP.get(raw_phase, "code"),
            "command": None,
            "success_criteria": "; ".join(task.get("acceptance_criteria", [])) or None,
            "tested": False,
            "user_fix_instructions": None,
        }
