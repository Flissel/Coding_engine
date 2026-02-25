# -*- coding: utf-8 -*-
"""
Tests for FungusMemoryService - Phase 18

Tests the memory-augmented MCMP service that searches Supermemory alongside
code files to discover code<->memory correlations.
"""

import asyncio
import json
import os
from pathlib import Path
from unittest.mock import AsyncMock, MagicMock, patch

import pytest

from src.services.fungus_memory_service import (
    FungusMemoryService,
    MemoryCorrelation,
    MemoryJudgeMode,
    MemoryReport,
)


@pytest.fixture
def temp_project(tmp_path):
    """Create a temporary project with test files."""
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
        '\n'
        'export class AuthService {\n'
        '  static async login(body: { email: string; password: string }) {\n'
        '    const prisma = new PrismaClient();\n'
        '    return { token: "jwt-token" };\n'
        '  }\n'
        '}\n',
        encoding="utf-8",
    )

    prisma_dir = tmp_path / "prisma"
    prisma_dir.mkdir()
    (prisma_dir / "schema.prisma").write_text(
        'model User {\n'
        '  id    String @id @default(cuid())\n'
        '  email String @unique\n'
        '}\n',
        encoding="utf-8",
    )

    (tmp_path / "package.json").write_text(
        json.dumps({
            "name": "test-project",
            "dependencies": {
                "hono": "^4.0.0",
                "@prisma/client": "^5.0.0",
            },
        }),
        encoding="utf-8",
    )

    return tmp_path


@pytest.fixture
def empty_project(tmp_path):
    """Create an empty temporary project."""
    return tmp_path


class TestFungusMemoryServiceInit:
    """Test service initialization."""

    def test_init_creates_service(self, temp_project):
        """Service initializes with correct parameters."""
        service = FungusMemoryService(
            working_dir=str(temp_project),
            event_bus=None,
            job_id="test_init",
        )
        assert service.working_dir == temp_project
        assert service._job_id == "test_init"
        assert service.is_running is False
        assert service.indexed_count == 0
        assert service.memory_count == 0

    def test_init_with_custom_config(self, temp_project):
        """Service accepts custom SimulationConfig."""
        from src.services.mcmp_background import SimulationConfig

        config = SimulationConfig(num_agents=50, max_iterations=10)
        service = FungusMemoryService(
            working_dir=str(temp_project),
            config=config,
        )
        assert service._config.num_agents == 50
        assert service._config.max_iterations == 10


class TestFungusMemoryServiceIndexing:
    """Test project indexing."""

    @pytest.mark.asyncio
    async def test_start_indexes_code_files(self, temp_project):
        """start() indexes all matching code files."""
        service = FungusMemoryService(working_dir=str(temp_project))

        service._simulation.add_documents = MagicMock(return_value=4)
        service._simulation._init_retriever = MagicMock(return_value=True)

        started = await service.start()
        assert started is True
        assert service.indexed_count == 4  # 2 .ts + 1 .prisma + 1 .json
        assert service.is_running is True

    @pytest.mark.asyncio
    async def test_empty_project_returns_false(self, empty_project):
        """start() returns False for empty project without memories."""
        service = FungusMemoryService(working_dir=str(empty_project))
        started = await service.start()
        assert started is False

    @pytest.mark.asyncio
    async def test_reindex_file_incremental(self, temp_project):
        """reindex_file() detects changed files."""
        service = FungusMemoryService(working_dir=str(temp_project))

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
    async def test_reindex_file_skips_non_indexed(self, temp_project):
        """reindex_file() ignores files with non-indexed extensions."""
        (temp_project / "README.md").write_text("# Test", encoding="utf-8")
        service = FungusMemoryService(working_dir=str(temp_project))
        result = await service.reindex_file("README.md")
        assert result is False

    @pytest.mark.asyncio
    async def test_reindex_file_nonexistent(self, temp_project):
        """reindex_file() returns False for missing files."""
        service = FungusMemoryService(working_dir=str(temp_project))
        result = await service.reindex_file("does/not/exist.ts")
        assert result is False


class TestFungusMemoryServiceMemoryLoading:
    """Test Supermemory memory loading."""

    @pytest.mark.asyncio
    async def test_load_memories_adds_to_corpus(self, temp_project):
        """load_memories() fetches and adds memories to MCMP corpus."""
        service = FungusMemoryService(working_dir=str(temp_project))

        # Mock the corpus loader (Phase 19 refactor)
        mock_loader = MagicMock()
        mock_loader.available = True
        mock_loader.fetch_as_mcmp_documents = AsyncMock(return_value=[
            "// Memory: code_pattern/mem1\nHono route pattern with Zod validation",
            "// Memory: code_pattern/mem2\nJWT auth middleware pattern",
        ])
        service._corpus_loader = mock_loader
        service._simulation.add_documents = MagicMock(return_value=2)

        count = await service.load_memories(query="auth patterns")
        assert count == 2
        assert service.memory_count == 2
        mock_loader.fetch_as_mcmp_documents.assert_called_once()

    @pytest.mark.asyncio
    async def test_load_memories_dedup_by_id(self, temp_project):
        """load_memories() deduplicates by memory ID (handled by corpus loader)."""
        service = FungusMemoryService(working_dir=str(temp_project))

        # First call returns 1 doc, second returns 0 (dedup in loader)
        mock_loader = MagicMock()
        mock_loader.available = True
        mock_loader.fetch_as_mcmp_documents = AsyncMock(
            side_effect=[
                ["// Memory: code_pattern/mem1\npattern A"],
                [],  # Deduped by loader on second call
            ]
        )
        service._corpus_loader = mock_loader
        service._simulation.add_documents = MagicMock(return_value=1)

        await service.load_memories(query="test")
        count2 = await service.load_memories(query="test")
        assert count2 == 0  # Deduped
        assert service.memory_count == 1

    @pytest.mark.asyncio
    async def test_load_memories_without_supermemory(self, temp_project):
        """load_memories() returns 0 without Supermemory."""
        service = FungusMemoryService(working_dir=str(temp_project))
        count = await service.load_memories(query="test")
        assert count == 0

    @pytest.mark.asyncio
    async def test_mixed_corpus_format(self, temp_project):
        """Documents have correct prefix format."""
        service = FungusMemoryService(working_dir=str(temp_project))

        docs_added = []
        service._simulation.add_documents = MagicMock(side_effect=lambda docs: (docs_added.extend(docs), len(docs))[1])
        service._simulation._init_retriever = MagicMock(return_value=True)

        await service.reindex_project()

        # Code files should have // File: prefix
        assert any(d.startswith("// File:") for d in docs_added)

        # Now load a memory via corpus loader
        mock_loader = MagicMock()
        mock_loader.available = True
        mock_loader.fetch_as_mcmp_documents = AsyncMock(return_value=[
            "// Memory: code_pattern/mem1\ntest pattern",
        ])
        service._corpus_loader = mock_loader

        docs_added.clear()
        await service.load_memories(query="test")

        # Memory documents should have // Memory: prefix
        assert any(d.startswith("// Memory:") for d in docs_added)


class TestFungusMemoryServiceValidation:
    """Test memory round execution."""

    @pytest.mark.asyncio
    async def test_run_memory_round_produces_report(self, temp_project):
        """run_memory_round() produces a MemoryReport."""
        service = FungusMemoryService(working_dir=str(temp_project))

        service._simulation.start = AsyncMock(return_value=True)
        service._simulation.stop = AsyncMock(return_value={})
        type(service._simulation).is_running = property(lambda self: False)
        service._simulation.get_results = MagicMock(return_value={
            "steps_completed": 10,
            "top_results": [
                {"content": "// File: auth.ts\ntest code", "relevance_score": 0.8, "metadata": {}},
            ],
            "judge_evaluations": [{"confidence": 0.7}],
        })

        service._simulation.add_documents = MagicMock(return_value=3)
        service._simulation._init_retriever = MagicMock(return_value=True)
        await service.start()

        report = await service.run_memory_round(
            focus_query="recall auth patterns",
            mode=MemoryJudgeMode.PATTERN_RECALL,
        )

        assert isinstance(report, MemoryReport)
        assert report.round_number == 1
        assert report.focus_query == "recall auth patterns"

    @pytest.mark.asyncio
    async def test_stop_returns_reports(self, temp_project):
        """stop() returns accumulated reports."""
        service = FungusMemoryService(working_dir=str(temp_project))
        service._running = True
        service._reports = [
            MemoryReport(round_number=1),
            MemoryReport(round_number=2),
        ]

        reports = await service.stop()
        assert len(reports) == 2
        assert service.is_running is False


class TestFungusMemoryServiceHeuristics:
    """Test heuristic correlation (fallback without LLM)."""

    def test_heuristic_finds_keyword_overlap(self, temp_project):
        """Heuristic correlation finds keyword overlap between memory and code."""
        service = FungusMemoryService(working_dir=str(temp_project))

        # Use content with many shared 4+ char words to ensure overlap >= 3
        results = [
            {
                "content": "// Memory: code_pattern/mem1\nThe Hono framework pattern uses PrismaClient for database access with authentication middleware and controller service architecture",
                "relevance_score": 0.8,
                "metadata": {},
            },
            {
                "content": "// File: src/auth.ts\nimport { Hono } from 'hono';\nimport { PrismaClient } from '@prisma/client';\nconst controller = new Hono();\nexport class AuthService { database access with authentication middleware }\n",
                "relevance_score": 0.7,
                "metadata": {},
            },
        ]

        correlations = service._heuristic_correlation(results)
        assert len(correlations) >= 1
        assert correlations[0].memory_id == "mem1"
        assert correlations[0].memory_category == "code_pattern"
        assert len(correlations[0].related_code_files) > 0

    def test_heuristic_no_correlations_unrelated(self, temp_project):
        """Heuristic returns empty for unrelated content."""
        service = FungusMemoryService(working_dir=str(temp_project))

        results = [
            {
                "content": "// Memory: code_pattern/mem1\nDjango REST framework serializer patterns",
                "relevance_score": 0.5,
                "metadata": {},
            },
            {
                "content": "// File: src/auth.ts\nimport { Hono } from 'hono';\n",
                "relevance_score": 0.5,
                "metadata": {},
            },
        ]

        correlations = service._heuristic_correlation(results)
        # Few keyword overlaps between Django and Hono code
        assert len(correlations) == 0


class TestFungusMemoryServiceJudgePrompt:
    """Test memory Judge prompt construction."""

    def test_build_prompt_includes_query(self, temp_project):
        """Memory prompt includes the focus query."""
        service = FungusMemoryService(working_dir=str(temp_project))

        prompt = service._build_memory_prompt(
            focus_query="recall auth patterns",
            mode=MemoryJudgeMode.PATTERN_RECALL,
            top_results=[{"content": "test", "relevance_score": 0.8}],
        )

        assert "recall auth patterns" in prompt
        assert "PATTERN RECALL" in prompt

    def test_build_prompt_includes_task_context(self, temp_project):
        """Memory prompt includes task context."""
        service = FungusMemoryService(working_dir=str(temp_project))

        prompt = service._build_memory_prompt(
            focus_query="test",
            mode=MemoryJudgeMode.ERROR_FIX_RECALL,
            top_results=[{"content": "test", "relevance_score": 0.5}],
            task_context={"title": "Create auth", "type": "api_route", "error_message": "build failed"},
        )

        assert "Create auth" in prompt
        assert "build failed" in prompt
        assert "ERROR FIX RECALL" in prompt

    def test_mode_specific_instructions(self, temp_project):
        """Each mode produces different analysis instructions."""
        service = FungusMemoryService(working_dir=str(temp_project))
        results = [{"content": "test", "relevance_score": 0.5}]

        for mode, expected_text in [
            (MemoryJudgeMode.PATTERN_RECALL, "PATTERN RECALL"),
            (MemoryJudgeMode.ERROR_FIX_RECALL, "ERROR FIX RECALL"),
            (MemoryJudgeMode.CONTEXT_ENRICHMENT, "CONTEXT ENRICHMENT"),
            (MemoryJudgeMode.LEARNING, "LEARNING"),
        ]:
            prompt = service._build_memory_prompt(
                focus_query="test", mode=mode, top_results=results,
            )
            assert expected_text in prompt, f"Missing {expected_text} for mode {mode}"

    def test_prompt_labels_doc_types(self, temp_project):
        """Prompt labels code vs memory documents."""
        service = FungusMemoryService(working_dir=str(temp_project))

        prompt = service._build_memory_prompt(
            focus_query="test",
            mode=MemoryJudgeMode.PATTERN_RECALL,
            top_results=[
                {"content": "// File: src/auth.ts\ncode", "relevance_score": 0.8},
                {"content": "// Memory: code_pattern/mem1\nmemory", "relevance_score": 0.7},
            ],
        )

        assert "(CODE)" in prompt
        assert "(MEMORY)" in prompt


class TestFungusMemoryServiceParsing:
    """Test response parsing."""

    def test_parse_json_response_valid(self, temp_project):
        """Valid JSON is parsed correctly."""
        service = FungusMemoryService(working_dir=str(temp_project))

        response = json.dumps({
            "correlations": [
                {
                    "memory_id": "mem1",
                    "memory_category": "code_pattern",
                    "correlation_type": "similar_pattern",
                    "related_code_files": ["src/auth.ts"],
                    "relevance_score": 0.9,
                    "description": "Pattern match",
                    "suggested_action": "Apply pattern",
                }
            ],
            "new_patterns_to_store": [],
        })

        parsed = service._parse_json_response(response)
        assert "correlations" in parsed
        assert len(parsed["correlations"]) == 1

    def test_parse_json_response_markdown_wrapped(self, temp_project):
        """JSON wrapped in markdown code blocks is parsed."""
        service = FungusMemoryService(working_dir=str(temp_project))

        response = '```json\n{"correlations": [], "new_patterns_to_store": []}\n```'
        parsed = service._parse_json_response(response)
        assert "correlations" in parsed

    def test_parse_json_response_invalid(self, temp_project):
        """Invalid responses return empty dict."""
        service = FungusMemoryService(working_dir=str(temp_project))
        parsed = service._parse_json_response("not json at all")
        assert parsed == {}

    def test_parse_memory_response_filters_low_relevance(self, temp_project):
        """Correlations with relevance < 0.5 are filtered out."""
        service = FungusMemoryService(working_dir=str(temp_project))

        response = json.dumps({
            "correlations": [
                {"memory_id": "a", "relevance_score": 0.9, "correlation_type": "similar_pattern"},
                {"memory_id": "b", "relevance_score": 0.3, "correlation_type": "similar_pattern"},
            ],
            "new_patterns_to_store": [],
        })

        correlations, new_patterns = service._parse_memory_response(response, [])
        assert len(correlations) == 1
        assert correlations[0].memory_id == "a"

    def test_parse_memory_response_extracts_new_patterns(self, temp_project):
        """New patterns to store are extracted."""
        service = FungusMemoryService(working_dir=str(temp_project))

        response = json.dumps({
            "correlations": [],
            "new_patterns_to_store": [
                {"content": "Hono uses app.post() for routes", "category": "code_pattern"},
            ],
        })

        correlations, new_patterns = service._parse_memory_response(response, [])
        assert len(new_patterns) == 1
        assert new_patterns[0]["category"] == "code_pattern"


class TestFungusMemoryServicePatternStorage:
    """Test pattern storage to Supermemory."""

    @pytest.mark.asyncio
    async def test_store_pattern_to_supermemory(self, temp_project):
        """store_pattern() delegates to corpus loader."""
        service = FungusMemoryService(working_dir=str(temp_project))

        mock_loader = MagicMock()
        mock_loader.available = True
        mock_loader.store_pattern = AsyncMock(return_value=True)
        service._corpus_loader = mock_loader

        result = await service.store_pattern(
            content="Hono route pattern",
            category="code_pattern",
            metadata={"framework": "Hono"},
        )

        assert result is True
        mock_loader.store_pattern.assert_called_once()
        call_kwargs = mock_loader.store_pattern.call_args.kwargs
        assert call_kwargs["content"] == "Hono route pattern"
        assert call_kwargs["category"] == "code_pattern"
        assert call_kwargs["metadata"]["framework"] == "Hono"
        assert call_kwargs["metadata"]["source"] == "fungus_memory"

    @pytest.mark.asyncio
    async def test_store_pattern_without_supermemory(self, temp_project):
        """store_pattern() returns False without Supermemory."""
        service = FungusMemoryService(working_dir=str(temp_project))
        result = await service.store_pattern("test", "code_pattern")
        assert result is False

    @pytest.mark.asyncio
    async def test_store_pending_patterns(self, temp_project):
        """store_pending_patterns() stores all accumulated patterns."""
        service = FungusMemoryService(working_dir=str(temp_project))

        mock_loader = MagicMock()
        mock_loader.available = True
        mock_loader.store_pattern = AsyncMock(return_value=True)
        service._corpus_loader = mock_loader

        service._new_patterns = [
            {"content": "pattern A", "category": "code_pattern"},
            {"content": "pattern B", "category": "error_fix"},
        ]

        stored = await service.store_pending_patterns()
        assert stored == 2
        assert len(service._new_patterns) == 0


class TestFungusMemoryServiceGracefulDegradation:
    """Test graceful degradation."""

    @pytest.mark.asyncio
    async def test_graceful_without_supermemory_key(self, temp_project):
        """Service works without SUPERMEMORY_API_KEY (code-only mode)."""
        service = FungusMemoryService(working_dir=str(temp_project))

        service._simulation.add_documents = MagicMock(return_value=4)
        service._simulation._init_retriever = MagicMock(return_value=True)

        with patch.dict(os.environ, {"SUPERMEMORY_API_KEY": ""}, clear=False):
            started = await service.start()

        assert started is True
        assert service._supermemory_available is False
        assert service.memory_count == 0
        assert service.indexed_count == 4

    @pytest.mark.asyncio
    async def test_graceful_without_openrouter_key(self, temp_project):
        """Service falls back to heuristic without OPENROUTER_API_KEY."""
        service = FungusMemoryService(working_dir=str(temp_project))

        with patch.dict(os.environ, {"OPENROUTER_API_KEY": ""}, clear=False):
            result = await service._init_llm_client()

        assert result is False
