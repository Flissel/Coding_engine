# -*- coding: utf-8 -*-
"""
Unified Engine Entry Point — Phase 27

Single entry point that connects all 3 layers:
  Layer 1: Code Gen Pipeline (37+ agents, EventBus, convergence loop)
  Layer 2: MCP Orchestrator (55+ tools)
  Layer 3: MCP Plugin Agents (20+ servers)

Defaults:
  - SoM Bridge always-on (agents react to task events in real-time)
  - Differential + CrossLayer validation in convergence loop
  - Parallel pipeline (default 10)
  - Fail-forward execution

Usage:
    python run_engine.py                                   # Auto-detect project
    python run_engine.py requirements.json --json-progress # VibeMind IPC mode
    python run_engine.py --project-path Data/all_services/whatsapp
    python run_engine.py --parallel 10 --diff-fixes 5      # Fix top 5 gaps
    python run_engine.py --autonomous                       # Strict convergence
    python run_engine.py --fast                             # Minimal iterations
    python run_engine.py --no-som --no-diff                 # Legacy mode
"""
import argparse
import asyncio
import json
import logging
import os
import shutil
import sys
import time
import threading
from datetime import datetime
from pathlib import Path
from typing import Optional

# Ensure project root is on sys.path
sys.path.insert(0, str(Path(__file__).parent))
sys.path.insert(0, str(Path(__file__).parent / "mcp_plugins" / "servers" / "grpc_host"))

# Load .env file if present
try:
    from dotenv import load_dotenv
    load_dotenv()
except ImportError:
    pass

logger = logging.getLogger(__name__)


def find_latest_project() -> Path:
    """Find the most recently modified project in Data/all_services/."""
    data_dir = Path("Data/all_services")
    if not data_dir.exists():
        return Path("")

    candidates = []
    for project_dir in data_dir.iterdir():
        if project_dir.is_dir() and (project_dir / "tasks").exists():
            candidates.append(project_dir)

    if not candidates:
        return Path("")

    candidates.sort(key=lambda p: p.stat().st_mtime, reverse=True)
    return candidates[0]


def load_full_config() -> dict:
    """Load full config from society_defaults.json."""
    config_path = Path(__file__).parent / "config" / "society_defaults.json"
    if config_path.exists():
        try:
            return json.loads(config_path.read_text(encoding="utf-8"))
        except (json.JSONDecodeError, OSError):
            pass
    return {}


def _pct(count: int, total: int) -> str:
    """Format count as percentage."""
    if total == 0:
        return "0%"
    return f"{count / total * 100:.0f}%"


# =============================================================================
# JSON Progress Reporter (for VibeMind IPC via stdout)
# =============================================================================

class JsonProgressReporter:
    """Emits JSON progress lines to stdout for IPC with VibeMind/Electron.

    Also forwards log entries to the EventBus (if set) so the dashboard
    Logs tab shows real-time build output.
    """

    def __init__(self, enabled: bool = False):
        self.enabled = enabled
        self._event_bus = None

    def set_event_bus(self, event_bus):
        """Attach an EventBus so emit() also pushes log_entry events."""
        self._event_bus = event_bus

    def emit(self, status: str, progress: float, phase: str,
             error: str = None, **extra):
        if not self.enabled:
            return
        data = {
            "status": status,
            "progress": round(progress, 1),
            "phase": phase,
        }
        if error:
            data["error"] = error
        data.update(extra)
        print(json.dumps(data), flush=True)

        # Also push to EventBus for dashboard Logs tab
        self._emit_log_to_bus(f"[{status.upper()}] {phase}" + (f" — {error}" if error else ""))

    def _emit_log_to_bus(self, message: str):
        """Best-effort push of a log_entry event to the EventBus."""
        if not self._event_bus:
            return
        try:
            from src.mind.event_bus import Event as SoMEvent, EventType as SoMEventType
            import asyncio
            log_event = SoMEvent(
                type=SoMEventType.TASK_PROGRESS_UPDATE,
                source="run_engine",
                data={
                    "type": "task_progress_update",
                    "data": {
                        "type": "log_entry",
                        "message": message,
                        "timestamp": datetime.now().isoformat(),
                    },
                },
            )
            try:
                loop = asyncio.get_running_loop()
                loop.create_task(self._event_bus.publish(log_event))
            except RuntimeError:
                pass  # No event loop — skip
        except Exception:
            pass  # Best-effort


# =============================================================================
# Bootstrap: Convert VibeMind requirements.json to Epic project structure
# =============================================================================

def _is_vibemind_requirements(req_path: Path) -> bool:
    """Check if a JSON file is in VibeMind requirements format."""
    try:
        data = json.loads(req_path.read_text(encoding="utf-8"))
        return "project" in data and "requirements" in data
    except (json.JSONDecodeError, OSError):
        return False


async def bootstrap_from_requirements(
    req_path: Path,
    output_dir: Path,
    reporter: JsonProgressReporter,
    no_scaffold: bool = False,
) -> Path:
    """
    Convert VibeMind requirements.json to a full Epic project structure.

    Creates project dir, generates tasks, and optionally scaffolds the project.
    Returns the project_path for the orchestrator.
    """
    req_data = json.loads(req_path.read_text(encoding="utf-8"))

    project_name = req_data.get("project", {}).get("name", "vibemind-project")
    project_dir = output_dir
    project_dir.mkdir(parents=True, exist_ok=True)

    reporter.emit("generating", 2, "Bootstrapping project structure")

    # Copy requirements into project
    dest_req = project_dir / "requirements.json"
    if dest_req != req_path:
        shutil.copy2(req_path, dest_req)

    # Create tasks/ directory with a minimal epic task list
    tasks_dir = project_dir / "tasks"
    tasks_dir.mkdir(exist_ok=True)

    requirements = req_data.get("requirements", [])
    tasks = []
    for i, req in enumerate(requirements):
        title = req.get("title", f"Requirement {i+1}") if isinstance(req, dict) else str(req)[:50]
        desc = req.get("description", title) if isinstance(req, dict) else str(req)
        tasks.append({
            "id": f"TASK-{i+1:03d}",
            "title": title,
            "description": desc,
            "type": "fe_page",
            "status": "pending",
            "phase": "phase_3",
            "dependencies": [],
            "estimated_minutes": 5,
        })

    task_data = {
        "epic_id": "EPIC-001",
        "epic_name": project_name,
        "tasks": tasks,
        "total_tasks": len(tasks),
        "completed_tasks": 0,
        "failed_tasks": 0,
        "progress_percent": 0,
        "run_count": 0,
        "created_at": datetime.now().isoformat(),
    }
    (tasks_dir / "epic-001-tasks.json").write_text(
        json.dumps(task_data, indent=2), encoding="utf-8"
    )

    # Create user_stories/user_stories.md (required by EpicParser validation)
    us_dir = project_dir / "user_stories"
    us_dir.mkdir(exist_ok=True)

    us_lines = [
        "# User Stories and Epics",
        "",
        f"Generated: {datetime.now().isoformat()}",
        "",
        "## Summary",
        "",
        f"- Total Epics: 1",
        f"- Total User Stories: {len(requirements)}",
        "",
        "---",
        "",
        "# Epics",
        "",
        f"# EPIC-001: {project_name}",
        "",
        "**Status:** draft",
        "",
        "## Description",
        "",
        req_data.get("project", {}).get("description", f"Auto-generated project: {project_name}"),
        "",
        "## Linked Requirements",
        "",
    ]
    # Build requirement IDs
    for i, req in enumerate(requirements):
        req_id = req.get("id", f"WA-REQ-{i+1:03d}") if isinstance(req, dict) else f"WA-REQ-{i+1:03d}"
        # Normalise to WA- prefix if not already
        if not req_id.startswith("WA-"):
            req_id = f"WA-REQ-{i+1:03d}"
        us_lines.append(f"- {req_id}")
    us_lines.append("")
    us_lines.append("## User Stories")
    us_lines.append("")
    for i in range(len(requirements)):
        us_lines.append(f"- US-{i+1:03d}")
    us_lines.append("")
    us_lines.append("---")
    us_lines.append("")
    us_lines.append("# User Stories (Detailed Definitions)")
    us_lines.append("")

    for i, req in enumerate(requirements):
        title = req.get("title", f"Requirement {i+1}") if isinstance(req, dict) else str(req)[:50]
        desc = req.get("description", title) if isinstance(req, dict) else str(req)
        req_id = req.get("id", f"WA-REQ-{i+1:03d}") if isinstance(req, dict) else f"WA-REQ-{i+1:03d}"
        if not req_id.startswith("WA-"):
            req_id = f"WA-REQ-{i+1:03d}"
        priority = req.get("priority", "MUST").upper() if isinstance(req, dict) else "MUST"
        if priority not in ("MUST", "SHOULD", "COULD", "WONT"):
            priority = "MUST" if priority == "HIGH" else "SHOULD"

        us_lines.extend([
            f"## US-{i+1:03d}: {title}",
            "",
            f"**Priority:** {priority}",
            f"**Linked Requirement:** {req_id}",
            "",
            "### User Story",
            "",
            f"> As a **user**",
            f"> I want to **{desc.lower()}**",
            f"> So that **the application meets this requirement**",
            "",
            "### Acceptance Criteria",
            "",
            "**AC-1:**",
            f"- Given: the application is running",
            f"- When: the user interacts with {title.lower()}",
            f"- Then: the expected behavior is achieved",
            "",
            "---",
            "",
        ])

    (us_dir / "user_stories.md").write_text(
        "\n".join(us_lines), encoding="utf-8"
    )

    logger.info(f"Bootstrapped project: {project_dir} ({len(tasks)} tasks, {len(requirements)} user stories)")
    reporter.emit("generating", 3, f"Created {len(tasks)} tasks from requirements")

    # Scaffolding
    if not no_scaffold:
        reporter.emit("generating", 4, "Scaffolding project")
        try:
            from src.scaffolding.project_initializer import initialize_project
            scaffold_result = await initialize_project(
                output_dir=str(project_dir / "output"),
                requirements=req_data,
                install_deps=True,
            )
            logger.info(f"Scaffolding complete: {scaffold_result.files_created} files created")
            reporter.emit("generating", 8, "Scaffolding complete")
        except Exception as e:
            logger.warning(f"Scaffolding failed (non-fatal): {e}")
            reporter.emit("generating", 8, f"Scaffolding skipped: {e}")

    return project_dir


# =============================================================================
# Post-Execution: Differential Validation + Auto-Fix
# =============================================================================

async def run_differential_validation(
    data_dir: str,
    code_dir: str,
    max_fixes: int = 0,
    verify: bool = False,
) -> dict:
    """
    Run differential analysis on the generated code vs documentation.

    Reused from run_epic001_live.py — measures coverage, identifies gaps,
    and optionally spawns claude-code agents to fix critical ones.
    """
    from src.services.differential_analysis_service import (
        AnalysisMode,
        DifferentialAnalysisService,
        ImplementationStatus,
        GapSeverity,
    )

    print(f"\n{'='*60}")
    print(f"  POST-RUN: Differential Validation")
    print(f"{'='*60}")
    print(f"  Data dir:    {data_dir}")
    print(f"  Code dir:    {code_dir}")
    print(f"  Auto-fix:    {max_fixes} gaps" if max_fixes > 0 else "  Auto-fix:    disabled")
    print(f"{'='*60}\n")

    print("[DIFF 1/3] Loading documentation and code...")

    service = DifferentialAnalysisService(
        data_dir=data_dir,
        code_dir=code_dir,
        job_id="unified_engine_validation",
        enable_supermemory=False,
    )

    start_time = time.time()
    started = await service.start()
    if not started:
        print("  WARNING: Could not start differential analysis (missing data?)")
        return {"error": "start_failed", "coverage": 0}

    print(f"      {service.user_story_count} user stories, "
          f"{service.task_count} tasks, "
          f"{service.requirement_count} requirements")

    print("\n[DIFF 2/3] Running differential analysis (LLM Judge)...")

    report = await service.run_analysis(mode=AnalysisMode.FULL_DIFFERENTIAL)

    elapsed = time.time() - start_time
    print(f"      Analysis complete in {elapsed:.0f}s")
    print(f"\n      Coverage Report:")
    print(f"        Total requirements:  {report.total_requirements}")
    print(f"        Implemented:         {report.implemented} ({_pct(report.implemented, report.total_requirements)})")
    print(f"        Partial:             {report.partial} ({_pct(report.partial, report.total_requirements)})")
    print(f"        Missing:             {report.missing} ({_pct(report.missing, report.total_requirements)})")
    print(f"        Coverage:            {report.coverage_percent:.1f}%")
    print(f"        Judge confidence:    {report.judge_confidence:.2f}")

    result = {
        "coverage_before": report.coverage_percent,
        "total_requirements": report.total_requirements,
        "implemented": report.implemented,
        "partial": report.partial,
        "missing": report.missing,
        "judge_confidence": report.judge_confidence,
        "fixes_attempted": 0,
        "fixes_succeeded": 0,
    }

    if max_fixes > 0:
        min_conf = 0.6
        critical_gaps = [
            f for f in report.findings
            if f.severity == GapSeverity.CRITICAL
            and f.confidence >= min_conf
            and f.status != ImplementationStatus.IMPLEMENTED
        ]

        if not critical_gaps:
            print(f"\n[DIFF 3/3] No critical gaps to fix.")
        else:
            from src.agents.differential_fix_agent import (
                DifferentialFixAgent,
                GAP_AGENT_ROUTING,
            )
            from src.mind.event_bus import Event, EventType

            gaps_to_fix = critical_gaps[:max_fixes]
            print(f"\n[DIFF 3/3] Auto-fixing {len(gaps_to_fix)} critical gaps via claude-code...")

            try:
                from src.mcp.agent_pool import MCPAgentPool

                pool = MCPAgentPool(working_dir=code_dir)
                available = pool.list_available()

                fix_results = []
                for i, gap in enumerate(gaps_to_fix, 1):
                    event = Event(
                        type=EventType.CODE_FIX_NEEDED,
                        source="pipeline",
                        data={
                            "gap_description": gap.gap_description or "",
                            "reason": gap.requirement_title or "",
                            "suggested_tasks": gap.suggested_tasks or [],
                        },
                    )
                    gap_type = DifferentialFixAgent._determine_gap_type(event)
                    agents = GAP_AGENT_ROUTING.get(gap_type, GAP_AGENT_ROUTING["default"])

                    agent_name = next((a for a in agents if a in available), None)
                    if not agent_name:
                        agent_name = "claude-code" if "claude-code" in available else None

                    if not agent_name:
                        print(f"  [{gap.requirement_id}] SKIP - no agents available")
                        continue

                    task_desc = DifferentialFixAgent._build_agent_task(
                        agent_name=agent_name,
                        requirement_id=gap.requirement_id,
                        description=gap.gap_description or gap.requirement_title,
                        suggested_tasks=gap.suggested_tasks or [],
                    )

                    print(f"\n  [{i}/{len(gaps_to_fix)}] {gap.requirement_id}: {gap.requirement_title}")
                    print(f"     Agent: {agent_name} | Type: {gap_type}")

                    spawn_result = await pool.spawn(agent_name, task_desc)
                    status = "OK" if spawn_result.success else "FAIL"
                    print(f"     Result: {status} ({spawn_result.duration:.0f}s)")

                    fix_results.append({
                        "requirement_id": gap.requirement_id,
                        "success": spawn_result.success,
                        "agent": agent_name,
                        "duration": spawn_result.duration,
                    })

                result["fixes_attempted"] = len(fix_results)
                result["fixes_succeeded"] = sum(1 for r in fix_results if r["success"])
                result["fix_details"] = fix_results

            except Exception as e:
                print(f"\n  ERROR: Auto-fix failed: {e}")
                result["fix_error"] = str(e)

        if verify and result.get("fixes_succeeded", 0) > 0:
            print(f"\n  Re-running analysis to verify improvements...")
            service2 = DifferentialAnalysisService(
                data_dir=data_dir,
                code_dir=code_dir,
                job_id="unified_engine_verify",
                enable_supermemory=False,
            )
            started2 = await service2.start()
            if started2:
                report2 = await service2.run_analysis(mode=AnalysisMode.FULL_DIFFERENTIAL)
                result["coverage_after"] = report2.coverage_percent
                delta = report2.coverage_percent - report.coverage_percent
                print(f"  Coverage: {report.coverage_percent:.1f}% -> {report2.coverage_percent:.1f}% ({'+' if delta >= 0 else ''}{delta:.1f}%)")
                await service2.stop()
    else:
        print(f"\n[DIFF 3/3] Auto-fix disabled (use --diff-fixes N to enable).")

    report_path = os.path.join(data_dir, "differential_report.json")
    service.export_report(report_path)
    print(f"\n  Report saved: {report_path}")

    await service.stop()
    return result


# =============================================================================
# Main
# =============================================================================

async def main():
    parser = argparse.ArgumentParser(
        description="Unified Engine — 3-layer code generation with SoM agents + MCP tools",
    )
    parser.add_argument("requirements", nargs="?", default=None,
                        help="Requirements JSON file (positional, optional)")
    parser.add_argument("--project-path", default=None, help="Project directory")
    parser.add_argument("--output-dir", default=None, help="Output directory override")
    parser.add_argument("--parallel", type=int, default=10,
                        help="Max parallel tasks (default: 10)")

    # SoM / Diff flags (default: enabled)
    parser.add_argument("--no-som", action="store_true",
                        help="Disable SoM Bridge (agents won't react to events)")
    parser.add_argument("--no-diff", action="store_true",
                        help="Skip post-run differential validation")
    parser.add_argument("--diff-fixes", type=int, default=0,
                        help="Auto-fix N critical gaps after run (default: 0)")
    parser.add_argument("--diff-verify", action="store_true",
                        help="Re-run analysis after auto-fixes")

    # Convergence presets
    parser.add_argument("--autonomous", action="store_true",
                        help="Use AUTONOMOUS_CRITERIA (strict convergence)")
    parser.add_argument("--fast", action="store_true",
                        help="Use FAST_ITERATION_CRITERIA (minimal checks)")

    # Task selection
    parser.add_argument("--max-tasks", type=int, default=None,
                        help="Limit execution to N tasks")
    parser.add_argument("--phases", type=str, default=None,
                        help="Execute only these phases (comma-separated)")
    parser.add_argument("--block-on-fail", action="store_true",
                        help="Block downstream tasks on failed deps (default: fail-forward)")

    # VibeMind IPC flags (used by CodingEngineRunner subprocess)
    parser.add_argument("--json-progress", action="store_true",
                        help="Output JSON progress to stdout for IPC with Electron")
    parser.add_argument("--enable-vnc", action="store_true",
                        help="Enable VNC streaming for sandbox preview")
    parser.add_argument("--vnc-port", type=int, default=6080,
                        help="VNC port for sandbox preview (default: 6080)")
    parser.add_argument("--continuous-sandbox", action="store_true",
                        help="Enable continuous sandbox testing (maps to SoM Bridge)")
    parser.add_argument("--external-sandbox", action="store_true",
                        help="Sandbox container already managed externally (skip SoM Bridge Docker launch)")
    parser.add_argument("--enable-validation", action="store_true",
                        help="Enable validation team in SoM Bridge")
    parser.add_argument("--no-scaffold", action="store_true",
                        help="Skip project scaffolding when bootstrapping from requirements")

    args = parser.parse_args()

    # JSON progress reporter (stdout IPC for VibeMind/Electron)
    reporter = JsonProgressReporter(enabled=args.json_progress)
    _print = print if not args.json_progress else lambda *a, **kw: None

    # Load config
    full_config = load_full_config()
    som_config = full_config.get("som_bridge", {})
    engine_config = full_config.get("unified_engine", {})

    # Apply VNC/sandbox CLI flags to SoM config
    if args.enable_vnc:
        som_config["enable_vnc_preview"] = True
        som_config["vnc_port"] = args.vnc_port
    if args.continuous_sandbox:
        som_config["enable_autonomous_debug"] = True
        if args.external_sandbox:
            # Sandbox container already started by docker-manager.js — skip SoM Bridge launch
            som_config["enable_docker_sandbox"] = False
        else:
            som_config["enable_docker_sandbox"] = True
    if args.enable_validation:
        som_config["enable_validation_team"] = True

    # Resolve project path (with bootstrap from VibeMind requirements)
    bootstrap_mode = False
    if args.project_path:
        project_path = Path(args.project_path)
    elif args.requirements and _is_vibemind_requirements(Path(args.requirements)):
        # Bootstrap mode: create project structure from VibeMind requirements
        bootstrap_mode = True
        output_dir = Path(args.output_dir) if args.output_dir else Path(args.requirements).parent / "output"
        reporter.emit("generating", 1, "Bootstrap from requirements")
        project_path = await bootstrap_from_requirements(
            req_path=Path(args.requirements),
            output_dir=output_dir,
            reporter=reporter,
            no_scaffold=args.no_scaffold,
        )
    elif args.requirements:
        req = Path(args.requirements)
        # If the argument is a directory, use it directly as project path
        project_path = req if req.is_dir() else req.parent
    else:
        project_path = find_latest_project()

    if not project_path or not project_path.exists():
        _print("Error: No project found. Use --project-path or pass requirements JSON.")
        reporter.emit("failed", 0, "No project found", error="No project path")
        sys.exit(1)

    # Merge CLI with config defaults
    enable_som = not args.no_som and engine_config.get("enable_som", True)
    parallel = args.parallel
    if parallel == 10 and som_config.get("pipeline_max_parallel"):
        parallel = som_config["pipeline_max_parallel"]
    diff_fixes = args.diff_fixes or engine_config.get("diff_fixes", 0)
    skip_failed_deps = not args.block_on_fail
    phases = [p.strip() for p in args.phases.split(",")] if args.phases else None

    # Banner
    _print(f"\n{'='*70}")
    _print(f"  Unified Engine (Phase 27: 3-Layer Connected)")
    _print(f"{'='*70}")
    _print(f"  Project:       {project_path}")
    _print(f"  Parallel:      {parallel}")
    _print(f"  SoM Bridge:    {'enabled (agents react to events)' if enable_som else 'disabled'}")
    _print(f"  Fail-forward:  {'disabled' if args.block_on_fail else 'enabled'}")
    _print(f"  Diff analysis: {'enabled' if som_config.get('enable_differential_analysis') else 'disabled'} (in convergence loop)")
    _print(f"  Cross-layer:   {'enabled' if som_config.get('enable_cross_layer_validation') else 'disabled'} (in convergence loop)")
    if args.autonomous:
        _print(f"  Convergence:   AUTONOMOUS (strict)")
    elif args.fast:
        _print(f"  Convergence:   FAST (minimal)")
    else:
        _print(f"  Convergence:   DEFAULT")
    if phases:
        _print(f"  Phases:        {', '.join(phases)}")
    if args.max_tasks:
        _print(f"  Max tasks:     {args.max_tasks}")
    if not args.no_diff:
        _print(f"  Post-run diff: enabled (fixes: {diff_fixes})")
    _print(f"{'='*70}\n")
    reporter.emit("generating", 10, "Engine configured")

    # =========================================================================
    # Start FastAPI + WebSocket server in background thread
    # This allows the Electron dashboard to receive real-time events
    # even when the engine is started from CLI (not from Electron IPC).
    # =========================================================================
    from src.mind.event_bus import EventBus
    event_bus = EventBus()

    # Wire reporter to EventBus so progress also appears in dashboard Logs tab
    reporter.set_event_bus(event_bus)

    # Phase 31: Create a shared SharedState for vibe-coding file tracking
    from src.mind.shared_state import SharedState
    shared_state = SharedState()

    def _start_api_server(shared_event_bus, shared_state_instance):
        """Start FastAPI server in background thread for dashboard WebSocket."""
        try:
            import uvicorn
            from src.api.main import app, set_shared_event_bus, set_shared_state

            # Replace the module-level EventBus with our shared one
            # This must happen BEFORE uvicorn starts the lifespan
            set_shared_event_bus(shared_event_bus)

            # Phase 31: Inject SharedState so vibe.py can mark user-managed files
            set_shared_state(shared_state_instance)

            # Set up WebSocketBridge so EventBus events are forwarded to
            # all connected dashboard clients via /api/v1/ws.
            # uvicorn.run() manages its own event loop — the bridge.setup()
            # call registers an async handler on the EventBus that will
            # correctly run inside uvicorn's loop for WebSocket broadcasting.
            from src.api.websocket import WebSocketBridge, get_connection_manager
            ws_bridge = WebSocketBridge(
                event_bus=shared_event_bus,
                shared_state=shared_state_instance,
                connection_manager=get_connection_manager(),
            )
            ws_bridge.setup()

            # Try ports in order — 8000 is often taken by Docker Desktop on Windows
            import socket
            for port in (8321, 8000, 8001, 8002):
                # Quick check to avoid triggering uvicorn lifespan on occupied ports
                try:
                    with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as _s:
                        _s.bind(("0.0.0.0", port))
                except OSError:
                    _print(f"  [API] Port {port} in use, trying next...")
                    continue
                try:
                    _print(f"  [API] Starting FastAPI server on port {port} for dashboard WebSocket...")
                    uvicorn.run(app, host="0.0.0.0", port=port, log_level="warning")
                    break
                except (OSError, SystemExit):
                    _print(f"  [API] Port {port} failed, trying next...")
                    continue
        except Exception as e:
            _print(f"  [API] Warning: Could not start FastAPI server: {e}")
            _print(f"  [API] Dashboard WebSocket will not be available.")

    api_thread = threading.Thread(target=_start_api_server, args=(event_bus, shared_state), daemon=True)
    api_thread.start()
    time.sleep(2)  # Give server time to start

    # Import orchestrator
    from epic_orchestrator import EpicOrchestrator

    # Progress callback for real-time task updates
    def _on_task_progress(completed: int, total: int, failed: int, current_task: str):
        if total > 0:
            # Progress range: 10% (start) to 95% (all tasks done)
            pct = 10 + 85 * (completed / total)
            reporter.emit(
                "generating", pct,
                f"Task {completed}/{total}: {current_task}",
                completed_tasks=completed,
                total_tasks=total,
                failed_tasks=failed,
            )

    orchestrator = EpicOrchestrator(
        str(project_path),
        event_bus=event_bus,
        max_parallel_tasks=parallel,
        enable_som=enable_som,
        som_config=som_config,
        on_progress=_on_task_progress,
    )

    # Override output dir if specified
    if args.output_dir and not bootstrap_mode:
        orchestrator.output_dir = Path(args.output_dir)

    # =========================================================================
    # Step 1: Execute Epic (fail-forward, SoM always-on)
    # =========================================================================
    _print("=" * 70)
    _print("  STEP 1: Running Epic (unified pipeline, SoM agents active)...")
    _print("=" * 70)
    # Emit initial progress with task count so dashboard shows activity immediately
    total_tasks_estimate = 0
    try:
        import glob as _glob
        task_files = _glob.glob(str(project_path / "tasks" / "epic-*-tasks.json"))
        for tf in task_files:
            with open(tf, "r", encoding="utf-8") as f:
                td = json.load(f)
                total_tasks_estimate += len(td.get("tasks", []))
    except Exception:
        pass
    reporter.emit("generating", 10, "Starting Epic execution",
                  completed_tasks=0, total_tasks=total_tasks_estimate, failed_tasks=0)

    epic_start = time.time()

    result = await orchestrator.run_epic(
        "EPIC-001",
        max_tasks=args.max_tasks,
        phases=phases,
        skip_failed_deps=skip_failed_deps,
    )

    epic_duration = time.time() - epic_start

    _print()
    _print("=" * 70)
    status_label = "OK" if result.success else "PARTIAL"
    _print(f"  [{status_label}] Epic execution ended")
    _print(f"    Completed: {result.completed_tasks}/{result.total_tasks}")
    _print(f"    Failed:    {result.failed_tasks}")
    _print(f"    Skipped:   {result.skipped_tasks}")
    _print(f"    Duration:  {epic_duration:.0f}s")
    _print("=" * 70)
    reporter.emit(
        "converging" if result.failed_tasks > 0 else "testing",
        95, f"Epic done: {result.completed_tasks}/{result.total_tasks}",
        completed_tasks=result.completed_tasks,
        total_tasks=result.total_tasks,
        failed_tasks=result.failed_tasks,
    )

    # =========================================================================
    # Step 2: Post-Run Differential Validation
    # =========================================================================
    diff_result = None
    if not args.no_diff:
        reporter.emit("testing", 96, "Running differential validation")
        # Phase 28: Skip if convergence loop already ran differential analysis
        if getattr(orchestrator, '_convergence_ran_diff', False):
            _print(f"\n  SKIP post-run diff: already ran in convergence loop (SoM + diff enabled)")
        else:
            code_dir = str(project_path / "output")
            if args.output_dir:
                code_dir = args.output_dir
            if Path(code_dir).exists():
                diff_result = await run_differential_validation(
                    data_dir=str(project_path),
                    code_dir=code_dir,
                    max_fixes=diff_fixes,
                    verify=args.diff_verify,
                )
            else:
                _print(f"\n  SKIP differential validation: no output dir at {code_dir}")

    # =========================================================================
    # Final Summary
    # =========================================================================
    total_duration = time.time() - epic_start

    _print(f"\n{'='*70}")
    _print(f"  FINAL SUMMARY")
    _print(f"{'='*70}")
    _print(f"  Total duration:    {total_duration:.0f}s")
    _print(f"  Epic tasks:        {result.completed_tasks}/{result.total_tasks} completed, "
           f"{result.failed_tasks} failed, {result.skipped_tasks} skipped")

    if diff_result and "error" not in diff_result:
        cov = diff_result.get("coverage_before", 0)
        impl = diff_result.get("implemented", 0)
        total_req = diff_result.get("total_requirements", 0)
        _print(f"  Req coverage:      {cov:.1f}% ({impl}/{total_req} implemented)")
        if diff_result.get("fixes_attempted", 0) > 0:
            _print(f"  Auto-fixes:        {diff_result['fixes_succeeded']}/{diff_result['fixes_attempted']} succeeded")
        if diff_result.get("coverage_after") is not None:
            delta = diff_result["coverage_after"] - cov
            _print(f"  Coverage after fix: {diff_result['coverage_after']:.1f}% ({'+' if delta >= 0 else ''}{delta:.1f}%)")

    _print(f"{'='*70}\n")

    # Final JSON progress
    final_status = "completed" if result.success else "failed"
    reporter.emit(
        final_status, 100, "Generation complete" if result.success else "Generation failed",
        completed_tasks=result.completed_tasks,
        total_tasks=result.total_tasks,
        failed_tasks=result.failed_tasks,
    )


if __name__ == "__main__":
    logging.basicConfig(
        level=logging.INFO,
        format="%(asctime)s [%(levelname)s] %(name)s: %(message)s",
    )
    asyncio.run(main())
