# -*- coding: utf-8 -*-
"""
Tests for FungusValidationService - Phase 17

Tests the core validation service that composes MCMPBackgroundSimulation
with validation-oriented Judge prompts.
"""

import asyncio
import json
import os
import tempfile
from pathlib import Path
from unittest.mock import AsyncMock, MagicMock, patch

import pytest

from src.services.fungus_validation_service import (
    FungusValidationService,
    ValidationFinding,
    ValidationJudgeMode,
    ValidationReport,
)


@pytest.fixture
def temp_project(tmp_path):
    """Create a temporary project with test files."""
    # Create source files
    src_dir = tmp_path / "src" / "modules" / "auth"
    src_dir.mkdir(parents=True)

    (src_dir / "auth.controller.ts").write_text(
        '// File: src/modules/auth/auth.controller.ts\n'
        'import { Hono } from "hono";\n'
        'import { AuthService } from "./auth.service";\n'
        '\n'
        'const app = new Hono();\n'
        '\n'
        'app.post("/api/v1/auth/login", async (c) => {\n'
        '  const body = await c.req.json();\n'
        '  const result = await AuthService.login(body);\n'
        '  return c.json(result);\n'
        '});\n'
        '\n'
        'export default app;\n',
        encoding="utf-8",
    )

    (src_dir / "auth.service.ts").write_text(
        '// File: src/modules/auth/auth.service.ts\n'
        'import { PrismaClient } from "@prisma/client";\n'
        'import { sign } from "jose";\n'
        '\n'
        'export class AuthService {\n'
        '  static async login(body: { email: string; password: string }) {\n'
        '    const prisma = new PrismaClient();\n'
        '    const user = await prisma.user.findUnique({ where: { email: body.email } });\n'
        '    if (!user) throw new Error("User not found");\n'
        '    // TODO: verify password hash\n'
        '    return { token: "jwt-token", user };\n'
        '  }\n'
        '}\n',
        encoding="utf-8",
    )

    # Prisma schema
    prisma_dir = tmp_path / "prisma"
    prisma_dir.mkdir()
    (prisma_dir / "schema.prisma").write_text(
        'model User {\n'
        '  id    String @id @default(cuid())\n'
        '  email String @unique\n'
        '  name  String?\n'
        '}\n',
        encoding="utf-8",
    )

    # Package.json
    (tmp_path / "package.json").write_text(
        json.dumps({
            "name": "test-project",
            "dependencies": {
                "hono": "^4.0.0",
                "@prisma/client": "^5.0.0",
                "jose": "^5.0.0",
            },
        }),
        encoding="utf-8",
    )

    return tmp_path


@pytest.fixture
def empty_project(tmp_path):
    """Create an empty temporary project."""
    return tmp_path


class TestFungusValidationServiceInit:
    """Test service initialization."""

    def test_init_creates_service(self, temp_project):
        """Service initializes with correct parameters."""
        service = FungusValidationService(
            working_dir=str(temp_project),
            event_bus=None,
            job_id="test_init",
        )
        assert service.working_dir == temp_project
        assert service._job_id == "test_init"
        assert service.is_running is False
        assert service.indexed_count == 0

    def test_init_with_custom_config(self, temp_project):
        """Service accepts custom SimulationConfig."""
        from src.services.mcmp_background import SimulationConfig

        config = SimulationConfig(num_agents=50, max_iterations=10)
        service = FungusValidationService(
            working_dir=str(temp_project),
            config=config,
        )
        assert service._config.num_agents == 50
        assert service._config.max_iterations == 10


class TestFungusValidationServiceIndexing:
    """Test project indexing."""

    @pytest.mark.asyncio
    async def test_index_project_indexes_all_files(self, temp_project):
        """reindex_project() indexes all matching files."""
        service = FungusValidationService(working_dir=str(temp_project))

        # Mock the simulation's add_documents to avoid actual embedding
        service._simulation.add_documents = MagicMock(return_value=4)
        service._simulation._init_retriever = MagicMock(return_value=True)

        count = await service.reindex_project()
        assert count == 4  # 2 .ts + 1 .prisma + 1 .json

    @pytest.mark.asyncio
    async def test_index_empty_project(self, empty_project):
        """reindex_project() returns 0 for empty project."""
        service = FungusValidationService(working_dir=str(empty_project))
        count = await service.reindex_project()
        assert count == 0

    @pytest.mark.asyncio
    async def test_reindex_file_incremental(self, temp_project):
        """reindex_file() detects changed files."""
        service = FungusValidationService(working_dir=str(temp_project))

        # First index
        result = await service.reindex_file("src/modules/auth/auth.controller.ts")
        assert result is True

        # Same content = no change
        result = await service.reindex_file("src/modules/auth/auth.controller.ts")
        assert result is False

        # Modify file
        ctrl_path = temp_project / "src" / "modules" / "auth" / "auth.controller.ts"
        ctrl_path.write_text(ctrl_path.read_text(encoding="utf-8") + "\n// modified\n", encoding="utf-8")
        result = await service.reindex_file("src/modules/auth/auth.controller.ts")
        assert result is True

    @pytest.mark.asyncio
    async def test_reindex_file_skips_non_indexed_extensions(self, temp_project):
        """reindex_file() ignores files with non-indexed extensions."""
        (temp_project / "README.md").write_text("# Test", encoding="utf-8")
        service = FungusValidationService(working_dir=str(temp_project))
        result = await service.reindex_file("README.md")
        assert result is False

    @pytest.mark.asyncio
    async def test_reindex_file_nonexistent(self, temp_project):
        """reindex_file() returns False for missing files."""
        service = FungusValidationService(working_dir=str(temp_project))
        result = await service.reindex_file("does/not/exist.ts")
        assert result is False


class TestFungusValidationServiceValidation:
    """Test validation round execution."""

    @pytest.mark.asyncio
    async def test_run_validation_round_produces_report(self, temp_project):
        """run_validation_round() produces a ValidationReport."""
        service = FungusValidationService(working_dir=str(temp_project))

        # Mock the simulation to avoid real MCMP execution
        service._simulation.start = AsyncMock(return_value=True)
        service._simulation.stop = AsyncMock(return_value={})
        type(service._simulation).is_running = property(lambda self: False)
        service._simulation.get_results = MagicMock(return_value={
            "steps_completed": 10,
            "top_results": [
                {"content": "test code", "relevance_score": 0.8, "metadata": {}},
            ],
            "judge_evaluations": [{"confidence": 0.7}],
        })

        # Mock add_documents for start()
        service._simulation.add_documents = MagicMock(return_value=3)
        service._simulation._init_retriever = MagicMock(return_value=True)
        await service.start()

        report = await service.run_validation_round(
            focus_query="validate auth patterns",
            mode=ValidationJudgeMode.PATTERN_CHECK,
        )

        assert isinstance(report, ValidationReport)
        assert report.round_number == 1
        assert report.focus_query == "validate auth patterns"

    @pytest.mark.asyncio
    async def test_stop_returns_reports(self, temp_project):
        """stop() returns accumulated reports."""
        service = FungusValidationService(working_dir=str(temp_project))
        service._running = True
        service._reports = [
            ValidationReport(round_number=1, findings=[]),
            ValidationReport(round_number=2, findings=[]),
        ]

        reports = await service.stop()
        assert len(reports) == 2
        assert service.is_running is False


class TestFungusValidationServiceHeuristics:
    """Test heuristic validation (fallback without LLM)."""

    def test_heuristic_detects_todo_markers(self, temp_project):
        """Heuristic validation detects TODO/FIXME markers."""
        service = FungusValidationService(working_dir=str(temp_project))

        results = [
            {
                "content": "// File: src/auth.ts\nfunction login() {\n  // TODO: implement\n}\n",
                "relevance_score": 0.8,
                "metadata": {},
            },
        ]

        findings = service._heuristic_validation(results)
        assert len(findings) >= 1
        assert any(f.finding_type == "incomplete_implementation" for f in findings)

    def test_heuristic_detects_hardcoded_secrets(self, temp_project):
        """Heuristic validation detects hardcoded secrets."""
        service = FungusValidationService(working_dir=str(temp_project))

        results = [
            {
                "content": '// File: src/config.ts\nconst password = "admin123";\n',
                "relevance_score": 0.8,
                "metadata": {},
            },
        ]

        findings = service._heuristic_validation(results)
        assert len(findings) >= 1
        assert any(f.finding_type == "pattern_violation" for f in findings)
        assert any(f.severity == "error" for f in findings)

    def test_heuristic_no_findings_for_clean_code(self, temp_project):
        """Heuristic validation produces no findings for clean code."""
        service = FungusValidationService(working_dir=str(temp_project))

        results = [
            {
                "content": '// File: src/app.ts\nexport function hello() {\n  return "world";\n}\n',
                "relevance_score": 0.9,
                "metadata": {},
            },
        ]

        findings = service._heuristic_validation(results)
        assert len(findings) == 0


class TestFungusValidationServiceJudgePrompt:
    """Test validation Judge prompt construction."""

    def test_build_validation_prompt_includes_query(self, temp_project):
        """Validation prompt includes the focus query."""
        service = FungusValidationService(working_dir=str(temp_project))

        prompt = service._build_validation_prompt(
            focus_query="validate auth module",
            mode=ValidationJudgeMode.PATTERN_CHECK,
            top_results=[{"content": "test", "relevance_score": 0.8}],
        )

        assert "validate auth module" in prompt
        assert "PATTERN CONSISTENCY" in prompt

    def test_build_validation_prompt_includes_seed_patterns(self, temp_project):
        """Validation prompt includes seeded patterns."""
        service = FungusValidationService(working_dir=str(temp_project))
        service._seed_patterns = {"framework": "Hono", "orm": "Prisma"}

        prompt = service._build_validation_prompt(
            focus_query="validate",
            mode=ValidationJudgeMode.PATTERN_CHECK,
            top_results=[{"content": "test", "relevance_score": 0.5}],
        )

        assert "Hono" in prompt
        assert "Prisma" in prompt

    def test_build_validation_prompt_includes_anti_patterns(self, temp_project):
        """Validation prompt includes anti-patterns from failed tasks."""
        service = FungusValidationService(working_dir=str(temp_project))
        service._failed_task_errors = ["Could not find Prisma Schema"]

        prompt = service._build_validation_prompt(
            focus_query="validate",
            mode=ValidationJudgeMode.DEPENDENCY_CHECK,
            top_results=[{"content": "test", "relevance_score": 0.5}],
        )

        assert "Could not find Prisma Schema" in prompt
        assert "DEPENDENCY INTEGRITY" in prompt

    def test_mode_specific_instructions(self, temp_project):
        """Each mode produces different analysis instructions."""
        service = FungusValidationService(working_dir=str(temp_project))
        results = [{"content": "test", "relevance_score": 0.5}]

        for mode, expected_text in [
            (ValidationJudgeMode.PATTERN_CHECK, "PATTERN CONSISTENCY"),
            (ValidationJudgeMode.DEPENDENCY_CHECK, "DEPENDENCY INTEGRITY"),
            (ValidationJudgeMode.SCHEMA_CONSISTENCY, "SCHEMA-CODE ALIGNMENT"),
            (ValidationJudgeMode.API_CONTRACT, "API CONTRACT COMPLIANCE"),
            (ValidationJudgeMode.CROSS_FILE, "CROSS-FILE REFERENCES"),
        ]:
            prompt = service._build_validation_prompt(
                focus_query="test", mode=mode, top_results=results,
            )
            assert expected_text in prompt, f"Missing {expected_text} for mode {mode}"


class TestFungusValidationServiceParsing:
    """Test response parsing."""

    def test_parse_json_response_valid(self, temp_project):
        """Valid JSON is parsed correctly."""
        service = FungusValidationService(working_dir=str(temp_project))

        response = json.dumps({
            "findings": [
                {
                    "finding_type": "missing_import",
                    "severity": "error",
                    "file_path": "src/auth.ts",
                    "description": "Missing import",
                    "confidence": 0.9,
                }
            ],
            "overall_health": 0.6,
        })

        parsed = service._parse_json_response(response)
        assert "findings" in parsed
        assert len(parsed["findings"]) == 1

    def test_parse_json_response_markdown_wrapped(self, temp_project):
        """JSON wrapped in markdown code blocks is parsed."""
        service = FungusValidationService(working_dir=str(temp_project))

        response = '```json\n{"findings": [], "overall_health": 1.0}\n```'
        parsed = service._parse_json_response(response)
        assert parsed.get("overall_health") == 1.0

    def test_parse_json_response_invalid(self, temp_project):
        """Invalid responses return empty dict."""
        service = FungusValidationService(working_dir=str(temp_project))
        parsed = service._parse_json_response("not json at all")
        assert parsed == {}

    def test_parse_validation_response_filters_low_confidence(self, temp_project):
        """Findings with confidence < 0.5 are filtered out."""
        service = FungusValidationService(working_dir=str(temp_project))

        response = json.dumps({
            "findings": [
                {"finding_type": "a", "severity": "error", "confidence": 0.9, "file_path": "x"},
                {"finding_type": "b", "severity": "warning", "confidence": 0.3, "file_path": "y"},
            ],
        })

        findings = service._parse_validation_response(response, [])
        assert len(findings) == 1
        assert findings[0].finding_type == "a"


class TestFungusValidationServiceTaskTracking:
    """Test task tracking for seed patterns."""

    def test_add_completed_task(self, temp_project):
        """Completed tasks are tracked."""
        service = FungusValidationService(working_dir=str(temp_project))
        service.add_completed_task({"id": "task1", "type": "schema_model"})
        assert len(service._completed_tasks) == 1

    def test_add_failed_error(self, temp_project):
        """Failed errors are tracked as anti-patterns."""
        service = FungusValidationService(working_dir=str(temp_project))
        service.add_failed_error("Could not find Prisma Schema")
        assert len(service._failed_task_errors) == 1
        assert "Prisma" in service._failed_task_errors[0]
