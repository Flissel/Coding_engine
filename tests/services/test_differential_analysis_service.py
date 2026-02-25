# -*- coding: utf-8 -*-
"""
Tests for DifferentialAnalysisService - Phase 20

Tests the documentation-vs-code differential analysis using MCMP simulation.
"""

import asyncio
import json
import os
import tempfile
from pathlib import Path
from unittest.mock import AsyncMock, MagicMock, patch

import pytest

# Guard: MCMPBackgroundSimulation depends on JAX which may fail on Windows
# when DLL initialization order conflicts with other test modules.
# The DLL crash is lazy (happens at retriever init, not import), so we probe.
try:
    from src.services.differential_analysis_service import (
        AnalysisMode,
        DifferentialAnalysisService,
        DifferentialReport,
        GapFinding,
        GapSeverity,
        ImplementationStatus,
    )
    from src.services.mcmp_background import MCMPBackgroundSimulation

    # Probe: trigger the lazy JAX DLL load via _init_retriever()
    _probe = MCMPBackgroundSimulation()
    _MCMP_AVAILABLE = _probe._init_retriever()
    del _probe
except (ImportError, OSError):
    _MCMP_AVAILABLE = False

pytestmark = pytest.mark.skipif(
    not _MCMP_AVAILABLE,
    reason="MCMP/JAX not available (Windows DLL conflict)",
)


# ---------------------------------------------------------------------------
# Fixtures
# ---------------------------------------------------------------------------


@pytest.fixture
def tmp_data_dir(tmp_path):
    """Create a temporary data directory with mock documentation."""
    data_dir = tmp_path / "whatsapp"
    data_dir.mkdir()

    # Create user_stories.json
    stories = [
        {
            "id": "US-001",
            "title": "User Registration",
            "priority": "MUST",
            "linked_requirement": "WA-AUTH-001",
            "as_a": "new user",
            "i_want": "to register with phone number",
            "so_that": "I can use the messaging app",
            "description": "User registration with OTP verification",
        },
        {
            "id": "US-002",
            "title": "Send Text Message",
            "priority": "MUST",
            "linked_requirement": "WA-MSG-001",
            "as_a": "registered user",
            "i_want": "to send a text message",
            "so_that": "I can communicate with contacts",
            "description": "Real-time text messaging between users",
        },
        {
            "id": "US-003",
            "title": "Profile Settings",
            "priority": "SHOULD",
            "linked_requirement": "WA-PROF-001",
            "as_a": "user",
            "i_want": "to edit my profile picture",
            "so_that": "others can recognize me",
            "description": "Profile management with avatar upload",
        },
        {
            "id": "US-004",
            "title": "Dark Mode",
            "priority": "COULD",
            "linked_requirement": "WA-UI-001",
            "as_a": "user",
            "i_want": "to enable dark mode",
            "so_that": "I can use the app at night",
            "description": "Theme toggle between light and dark modes",
        },
    ]
    (data_dir / "user_stories.json").write_text(
        json.dumps(stories), encoding="utf-8"
    )

    # Create tasks directory with epic tasks
    tasks_dir = data_dir / "tasks"
    tasks_dir.mkdir()
    tasks = {
        "epic_id": "EPIC-001",
        "epic_name": "Authentication",
        "tasks": [
            {
                "id": "EPIC-001-AUTH-register",
                "epic_id": "EPIC-001",
                "type": "api_endpoint",
                "title": "Register endpoint",
                "description": "POST /auth/register with phone OTP",
                "status": "completed",
                "dependencies": [],
                "output_files": ["src/auth/register.ts"],
                "related_requirements": ["WA-AUTH-001"],
                "related_user_stories": ["US-001"],
                "phase": "api",
            },
            {
                "id": "EPIC-001-MSG-send",
                "epic_id": "EPIC-001",
                "type": "api_endpoint",
                "title": "Send message endpoint",
                "description": "POST /messages/send with real-time delivery",
                "status": "pending",
                "dependencies": ["EPIC-001-AUTH-register"],
                "output_files": [],
                "related_requirements": ["WA-MSG-001"],
                "related_user_stories": ["US-002"],
                "phase": "api",
            },
        ],
    }
    (tasks_dir / "epic-001-tasks.json").write_text(
        json.dumps(tasks), encoding="utf-8"
    )

    # Create MASTER_DOCUMENT.md
    master_doc = """# WhatsApp Clone - Requirements Specification

## Executive Summary
Total Requirements: 4
Total Epics: 1

## User Authentication
Users must be able to register using phone number with OTP verification.

## Messaging
Real-time text messaging between registered users with delivery confirmations.

## Profile Management
Users should be able to manage their profile settings and avatar.

## Theme Settings
Optional dark mode support for nighttime use.
"""
    (data_dir / "MASTER_DOCUMENT.md").write_text(master_doc, encoding="utf-8")

    # Create output directory with some code
    output_dir = data_dir / "output"
    output_dir.mkdir()

    # Auth code (implements WA-AUTH-001)
    (output_dir / "register.ts").write_text(
        """
import { Hono } from 'hono';
import { prisma } from '../db';

const auth = new Hono();

// POST /auth/register - Register with phone OTP
auth.post('/register', async (c) => {
    const { phoneNumber, otp } = await c.req.json();
    const user = await prisma.user.create({
        data: { phoneNumber, verified: true }
    });
    return c.json({ userId: user.id, token: generateJWT(user) });
});

export default auth;
""",
        encoding="utf-8",
    )

    # Schema (partial - has User but no Message model)
    (output_dir / "schema.prisma").write_text(
        """
generator client {
    provider = "prisma-client-js"
}

model User {
    id          String   @id @default(uuid())
    phoneNumber String   @unique
    verified    Boolean  @default(false)
    profilePic  String?
    createdAt   DateTime @default(now())
}
""",
        encoding="utf-8",
    )

    return data_dir


@pytest.fixture
def service(tmp_data_dir):
    """Create a service with the test data directory."""
    return DifferentialAnalysisService(
        data_dir=str(tmp_data_dir),
        code_dir=str(tmp_data_dir / "output"),
        job_id="test",
        enable_supermemory=False,
    )


# ---------------------------------------------------------------------------
# Initialization Tests
# ---------------------------------------------------------------------------


class TestInitialization:
    """Tests for service initialization."""

    def test_initial_state(self, service):
        """Service should start in clean state."""
        assert service.running is False
        assert service.user_story_count == 0
        assert service.task_count == 0
        assert service.requirement_count == 0
        assert service.reports == []

    @pytest.mark.asyncio
    async def test_start_loads_documentation(self, service):
        """Start should load all documentation files."""
        started = await service.start()
        assert started is True
        assert service.running is True
        assert service.user_story_count == 4
        assert service.task_count == 2
        assert service.requirement_count == 4

    @pytest.mark.asyncio
    async def test_start_with_empty_dir(self, tmp_path):
        """Start should fail with empty data directory."""
        empty_dir = tmp_path / "empty"
        empty_dir.mkdir()
        svc = DifferentialAnalysisService(
            data_dir=str(empty_dir),
            enable_supermemory=False,
        )
        started = await svc.start()
        assert started is False

    @pytest.mark.asyncio
    async def test_double_start(self, service):
        """Starting twice should return False."""
        await service.start()
        result = await service.start()
        assert result is False

    @pytest.mark.asyncio
    async def test_stop(self, service):
        """Stop should clean up state."""
        await service.start()
        await service.stop()
        assert service.running is False


# ---------------------------------------------------------------------------
# Documentation Loading Tests
# ---------------------------------------------------------------------------


class TestDocumentationLoading:
    """Tests for loading documentation files."""

    @pytest.mark.asyncio
    async def test_load_user_stories(self, service):
        """Should load all user stories."""
        docs = await service._load_user_stories()
        assert len(docs) == 4
        assert "US-001" in docs[0]
        assert "WA-AUTH-001" in docs[0]
        assert "MUST" in docs[0]

    @pytest.mark.asyncio
    async def test_load_tasks(self, service):
        """Should load all tasks from epic JSON files."""
        docs = await service._load_tasks()
        assert len(docs) == 2
        assert "EPIC-001-AUTH-register" in docs[0]
        assert "api_endpoint" in docs[0]

    @pytest.mark.asyncio
    async def test_load_master_document(self, service):
        """Should split MASTER_DOCUMENT.md into sections."""
        docs = await service._load_master_document()
        assert len(docs) >= 1  # At least some sections

    @pytest.mark.asyncio
    async def test_load_missing_user_stories(self, tmp_path):
        """Should return empty list when user_stories.json missing."""
        svc = DifferentialAnalysisService(
            data_dir=str(tmp_path),
            enable_supermemory=False,
        )
        docs = await svc._load_user_stories()
        assert docs == []

    @pytest.mark.asyncio
    async def test_load_missing_tasks_dir(self, tmp_path):
        """Should return empty list when tasks directory missing."""
        svc = DifferentialAnalysisService(
            data_dir=str(tmp_path),
            enable_supermemory=False,
        )
        docs = await svc._load_tasks()
        assert docs == []

    @pytest.mark.asyncio
    async def test_load_journal(self, tmp_data_dir):
        """Should load journal.json if present."""
        journal = {
            "nodes": {
                "node-WA-AUTH-001": {
                    "requirement_id": "WA-AUTH-001",
                    "title": "Auth",
                    "description": "Authentication requirement",
                    "type": "functional",
                    "priority": "must",
                    "acceptance_criteria": ["User can register", "OTP verified"],
                    "stage_name": "implemented",
                }
            }
        }
        (tmp_data_dir / "journal.json").write_text(
            json.dumps(journal), encoding="utf-8"
        )
        svc = DifferentialAnalysisService(
            data_dir=str(tmp_data_dir),
            enable_supermemory=False,
        )
        docs = await svc._load_journal()
        assert len(docs) == 1
        assert "WA-AUTH-001" in docs[0]


# ---------------------------------------------------------------------------
# Code Loading Tests
# ---------------------------------------------------------------------------


class TestCodeLoading:
    """Tests for loading generated code."""

    @pytest.mark.asyncio
    async def test_load_code(self, service):
        """Should load code files from output directory."""
        count = await service._load_code()
        assert count >= 2  # register.ts + schema.prisma

    @pytest.mark.asyncio
    async def test_load_code_missing_dir(self, tmp_path):
        """Should return 0 when code directory missing."""
        svc = DifferentialAnalysisService(
            data_dir=str(tmp_path),
            code_dir=str(tmp_path / "nonexistent"),
            enable_supermemory=False,
        )
        count = await svc._load_code()
        assert count == 0


# ---------------------------------------------------------------------------
# Heuristic Evaluation Tests
# ---------------------------------------------------------------------------


class TestHeuristicEvaluation:
    """Tests for heuristic keyword-based evaluation."""

    @pytest.mark.asyncio
    async def test_heuristic_with_matching_code(self, service):
        """Requirements with matching keywords should be marked implemented/partial."""
        requirements = [
            {
                "id": "WA-AUTH-001",
                "title": "User Registration with phone OTP",
                "description": "Register users with phone number and OTP verification",
                "priority": "MUST",
                "user_story_id": "US-001",
            }
        ]

        # Mock top results with auth-related code
        top_results = [
            {
                "id": "doc1",
                "content": "auth register phoneNumber otp user create verified token",
            }
        ]

        findings = service._heuristic_evaluate(requirements, top_results)
        assert len(findings) == 1
        # Should find some keyword overlap
        assert findings[0].requirement_id == "WA-AUTH-001"
        assert findings[0].status in (
            ImplementationStatus.IMPLEMENTED,
            ImplementationStatus.PARTIAL,
        )

    @pytest.mark.asyncio
    async def test_heuristic_no_matching_code(self, service):
        """Requirements with no matching keywords should be marked missing."""
        requirements = [
            {
                "id": "WA-VIDEO-001",
                "title": "Video calling with WebRTC",
                "description": "Real-time video calls between users using WebRTC",
                "priority": "MUST",
                "user_story_id": "US-099",
            }
        ]

        # No relevant code
        top_results = [
            {"id": "doc1", "content": "database schema user model prisma"}
        ]

        findings = service._heuristic_evaluate(requirements, top_results)
        assert len(findings) == 1
        assert findings[0].status == ImplementationStatus.MISSING

    def test_heuristic_empty_requirements(self, service):
        """Empty requirements should return empty findings."""
        findings = service._heuristic_evaluate([], [])
        assert findings == []


# ---------------------------------------------------------------------------
# Severity Computation Tests
# ---------------------------------------------------------------------------


class TestSeverity:
    """Tests for severity computation logic."""

    def test_missing_must_is_critical(self, service):
        """Missing MUST requirement should be CRITICAL."""
        severity = service._compute_severity(ImplementationStatus.MISSING, "MUST")
        assert severity == GapSeverity.CRITICAL

    def test_missing_should_is_high(self, service):
        """Missing SHOULD requirement should be HIGH."""
        severity = service._compute_severity(ImplementationStatus.MISSING, "SHOULD")
        assert severity == GapSeverity.HIGH

    def test_missing_could_is_medium(self, service):
        """Missing COULD requirement should be MEDIUM."""
        severity = service._compute_severity(ImplementationStatus.MISSING, "COULD")
        assert severity == GapSeverity.MEDIUM

    def test_partial_must_is_high(self, service):
        """Partial MUST requirement should be HIGH."""
        severity = service._compute_severity(ImplementationStatus.PARTIAL, "MUST")
        assert severity == GapSeverity.HIGH

    def test_implemented_is_low(self, service):
        """Implemented requirement should be LOW severity."""
        severity = service._compute_severity(ImplementationStatus.IMPLEMENTED, "MUST")
        assert severity == GapSeverity.LOW


# ---------------------------------------------------------------------------
# Task Linking Tests
# ---------------------------------------------------------------------------


class TestTaskLinking:
    """Tests for linking requirements to tasks."""

    @pytest.mark.asyncio
    async def test_find_related_tasks(self, service):
        """Should find tasks related to a requirement."""
        await service.start()
        tasks = service._find_related_tasks("WA-AUTH-001")
        assert "EPIC-001-AUTH-register" in tasks

    @pytest.mark.asyncio
    async def test_find_no_related_tasks(self, service):
        """Should return empty list for unknown requirement."""
        await service.start()
        tasks = service._find_related_tasks("NONEXISTENT-001")
        assert tasks == []


# ---------------------------------------------------------------------------
# Full Analysis Tests
# ---------------------------------------------------------------------------


class TestAnalysis:
    """Tests for the full analysis pipeline."""

    @pytest.mark.asyncio
    async def test_run_analysis_not_started(self, service):
        """Should return empty report when not started."""
        report = await service.run_analysis()
        assert report.total_requirements == 0

    @pytest.mark.asyncio
    async def test_run_analysis_heuristic(self, service):
        """Should run full analysis with heuristic fallback."""
        # Remove API key to force heuristic mode
        with patch.dict(os.environ, {}, clear=False):
            env = dict(os.environ)
            env.pop("OPENROUTER_API_KEY", None)
            with patch.dict(os.environ, env, clear=True):
                await service.start()
                report = await service.run_analysis(
                    mode=AnalysisMode.FULL_DIFFERENTIAL,
                )

                assert report.total_requirements == 4
                assert report.project_name == service.data_dir.name
                assert report.analysis_mode == "full_differential"
                assert report.doc_files_loaded > 0
                assert report.code_files_loaded >= 2
                assert len(report.findings) == 4
                assert report.timestamp != ""

    @pytest.mark.asyncio
    async def test_run_analysis_with_focus(self, service):
        """Should filter to focused requirements only."""
        with patch.dict(os.environ, {}, clear=False):
            env = dict(os.environ)
            env.pop("OPENROUTER_API_KEY", None)
            with patch.dict(os.environ, env, clear=True):
                await service.start()
                report = await service.run_analysis(
                    focus_requirements=["WA-AUTH-001"],
                )
                assert report.total_requirements == 1
                assert report.findings[0].requirement_id == "WA-AUTH-001"


# ---------------------------------------------------------------------------
# Report Tests
# ---------------------------------------------------------------------------


class TestReport:
    """Tests for report generation and export."""

    def test_report_to_dict(self):
        """Report should serialize to dict correctly."""
        report = DifferentialReport(
            project_name="test",
            analysis_mode="full_differential",
            timestamp="2026-02-10T12:00:00",
            total_requirements=10,
            implemented=5,
            partial=2,
            missing=3,
            coverage_percent=60.0,
            findings=[
                GapFinding(
                    requirement_id="REQ-001",
                    requirement_title="Test Feature",
                    priority="MUST",
                    status=ImplementationStatus.MISSING,
                    severity=GapSeverity.CRITICAL,
                    confidence=0.85,
                    gap_description="Not implemented",
                ),
            ],
        )

        d = report.to_dict()
        assert d["project_name"] == "test"
        assert d["summary"]["total_requirements"] == 10
        assert d["summary"]["coverage_percent"] == 60.0
        assert len(d["findings"]) == 1
        assert d["findings"][0]["status"] == "missing"
        assert d["findings"][0]["severity"] == "critical"

    @pytest.mark.asyncio
    async def test_export_report(self, service, tmp_path):
        """Should export report as JSON file."""
        with patch.dict(os.environ, {}, clear=False):
            env = dict(os.environ)
            env.pop("OPENROUTER_API_KEY", None)
            with patch.dict(os.environ, env, clear=True):
                await service.start()
                await service.run_analysis()

                output_path = str(tmp_path / "report.json")
                result = service.export_report(output_path)
                assert result == output_path
                assert Path(output_path).exists()

                data = json.loads(Path(output_path).read_text(encoding="utf-8"))
                assert "summary" in data
                assert "findings" in data

    def test_export_no_reports(self, service):
        """Should return empty string when no reports exist."""
        result = service.export_report()
        assert result == ""


# ---------------------------------------------------------------------------
# Helper Method Tests
# ---------------------------------------------------------------------------


class TestHelpers:
    """Tests for helper methods."""

    @pytest.mark.asyncio
    async def test_get_missing_requirements(self, service):
        """Should return only MISSING findings."""
        with patch.dict(os.environ, {}, clear=False):
            env = dict(os.environ)
            env.pop("OPENROUTER_API_KEY", None)
            with patch.dict(os.environ, env, clear=True):
                await service.start()
                await service.run_analysis()

                missing = service.get_missing_requirements()
                for f in missing:
                    assert f.status == ImplementationStatus.MISSING

    @pytest.mark.asyncio
    async def test_get_critical_gaps(self, service):
        """Should return only CRITICAL severity gaps."""
        with patch.dict(os.environ, {}, clear=False):
            env = dict(os.environ)
            env.pop("OPENROUTER_API_KEY", None)
            with patch.dict(os.environ, env, clear=True):
                await service.start()
                await service.run_analysis()

                critical = service.get_critical_gaps()
                for f in critical:
                    assert f.severity == GapSeverity.CRITICAL

    def test_build_analysis_query(self, service):
        """Should build appropriate query for mode."""
        reqs = [{"title": "Auth", "id": "R1"}, {"title": "Chat", "id": "R2"}]

        q = service._build_analysis_query(AnalysisMode.FULL_DIFFERENTIAL, reqs)
        assert "differential" in q.lower()

        q = service._build_analysis_query(AnalysisMode.API_COMPLETENESS, reqs)
        assert "api" in q.lower()

        q = service._build_analysis_query(AnalysisMode.SCHEMA_COVERAGE, reqs)
        assert "schema" in q.lower()

        q = service._build_analysis_query(AnalysisMode.REQUIREMENT_COVERAGE, reqs)
        assert "Auth" in q


# ---------------------------------------------------------------------------
# Supermemory Integration Tests
# ---------------------------------------------------------------------------


class TestSupermemoryIntegration:
    """Tests for Supermemory enrichment."""

    @pytest.mark.asyncio
    async def test_supermemory_disabled(self, tmp_data_dir):
        """When disabled, should not initialize loader."""
        svc = DifferentialAnalysisService(
            data_dir=str(tmp_data_dir),
            enable_supermemory=False,
        )
        await svc._init_supermemory()
        assert svc._corpus_loader is None

    @pytest.mark.asyncio
    async def test_supermemory_graceful_failure(self, tmp_data_dir):
        """Should handle missing API key gracefully."""
        svc = DifferentialAnalysisService(
            data_dir=str(tmp_data_dir),
            enable_supermemory=True,
        )
        with patch.dict(os.environ, {}, clear=False):
            env = dict(os.environ)
            env.pop("SUPERMEMORY_API_KEY", None)
            with patch.dict(os.environ, env, clear=True):
                await svc._init_supermemory()
                # Loader initialized but not available
                if svc._corpus_loader:
                    assert svc._corpus_loader.available is False

    @pytest.mark.asyncio
    async def test_store_significant_gaps(self, service):
        """Should attempt to store critical gaps to Supermemory."""
        # No loader available - should return 0
        findings = [
            GapFinding(
                requirement_id="R1",
                status=ImplementationStatus.MISSING,
                severity=GapSeverity.CRITICAL,
                confidence=0.9,
                gap_description="Missing auth",
            )
        ]
        stored = await service._store_significant_gaps(findings)
        assert stored == 0


# ---------------------------------------------------------------------------
# LLM Judge Tests
# ---------------------------------------------------------------------------


class TestLLMJudge:
    """Tests for LLM-based evaluation."""

    def test_build_judge_prompt(self, service):
        """Should build a well-structured prompt."""
        prompt = service._build_judge_prompt(
            req_text="--- Requirement R1 ---\nTitle: Auth\n",
            code_context="function login() {}",
            mode=AnalysisMode.FULL_DIFFERENTIAL,
        )
        assert "Differential Analysis Judge" in prompt
        assert "R1" in prompt
        assert "login" in prompt

    def test_parse_judge_response_valid_json(self, service):
        """Should parse valid JSON response."""
        content = """Here's the analysis:
```json
[
  {
    "requirement_id": "WA-AUTH-001",
    "status": "implemented",
    "confidence": 0.9,
    "matched_files": ["register.ts"],
    "evidence": ["Found register endpoint"],
    "gap_description": "",
    "suggested_tasks": []
  }
]
```"""
        requirements = [
            {
                "id": "WA-AUTH-001",
                "title": "Registration",
                "description": "Phone registration",
                "priority": "MUST",
                "user_story_id": "US-001",
            }
        ]

        findings = service._parse_judge_response(content, requirements)
        assert len(findings) == 1
        assert findings[0].requirement_id == "WA-AUTH-001"
        assert findings[0].status == ImplementationStatus.IMPLEMENTED
        assert findings[0].confidence == 0.9
        assert "register.ts" in findings[0].matched_files

    def test_parse_judge_response_invalid_json(self, service):
        """Should fall back when JSON is invalid."""
        requirements = [
            {
                "id": "R1",
                "title": "Test",
                "description": "desc",
                "priority": "MUST",
            }
        ]

        findings = service._parse_judge_response("not json at all", requirements)
        assert len(findings) == 1
        assert findings[0].status == ImplementationStatus.UNKNOWN

    def test_parse_judge_response_partial_status(self, service):
        """Should handle partial status correctly."""
        content = """[{"requirement_id": "R1", "status": "partial", "confidence": 0.6,
        "matched_files": [], "evidence": [], "gap_description": "half done", "suggested_tasks": ["finish it"]}]"""

        requirements = [{"id": "R1", "title": "T", "description": "d", "priority": "SHOULD"}]
        findings = service._parse_judge_response(content, requirements)
        assert findings[0].status == ImplementationStatus.PARTIAL
        assert findings[0].severity == GapSeverity.MEDIUM


# ---------------------------------------------------------------------------
# Data Class Tests
# ---------------------------------------------------------------------------


class TestDataClasses:
    """Tests for data class defaults and behavior."""

    def test_gap_finding_defaults(self):
        """GapFinding should have sensible defaults."""
        finding = GapFinding()
        assert finding.requirement_id == ""
        assert finding.status == ImplementationStatus.UNKNOWN
        assert finding.severity == GapSeverity.MEDIUM
        assert finding.matched_files == []
        assert finding.evidence == []
        assert finding.suggested_tasks == []

    def test_implementation_status_values(self):
        """ImplementationStatus should have all expected values."""
        assert ImplementationStatus.IMPLEMENTED.value == "implemented"
        assert ImplementationStatus.PARTIAL.value == "partial"
        assert ImplementationStatus.MISSING.value == "missing"
        assert ImplementationStatus.UNKNOWN.value == "unknown"

    def test_gap_severity_values(self):
        """GapSeverity should have all expected values."""
        assert GapSeverity.CRITICAL.value == "critical"
        assert GapSeverity.HIGH.value == "high"
        assert GapSeverity.MEDIUM.value == "medium"
        assert GapSeverity.LOW.value == "low"

    def test_analysis_mode_values(self):
        """AnalysisMode should have all expected values."""
        assert AnalysisMode.FULL_DIFFERENTIAL.value == "full_differential"
        assert AnalysisMode.API_COMPLETENESS.value == "api_completeness"
        assert AnalysisMode.SCHEMA_COVERAGE.value == "schema_coverage"
        assert AnalysisMode.USER_STORY_TRACE.value == "user_story_trace"
        assert AnalysisMode.REQUIREMENT_COVERAGE.value == "requirement_coverage"

    def test_differential_report_empty(self):
        """Empty report should have zero values."""
        report = DifferentialReport()
        assert report.total_requirements == 0
        assert report.coverage_percent == 0.0
        assert report.findings == []


# ---------------------------------------------------------------------------
# Per-Epic Filtering Tests (Phase 20b)
# ---------------------------------------------------------------------------


@pytest.fixture
def multi_epic_dir(tmp_path):
    """Create a data directory with TWO epics and 4 user stories."""
    data_dir = tmp_path / "multi_epic"
    data_dir.mkdir()

    # User stories linked to two epics
    stories = [
        {
            "id": "US-001",
            "title": "User Registration",
            "priority": "MUST",
            "linked_requirement": "WA-AUTH-001",
            "as_a": "user",
            "i_want": "register",
            "so_that": "use app",
            "description": "Register with phone",
        },
        {
            "id": "US-002",
            "title": "Send Message",
            "priority": "MUST",
            "linked_requirement": "WA-MSG-001",
            "as_a": "user",
            "i_want": "send message",
            "so_that": "communicate",
            "description": "Send text message",
        },
        {
            "id": "US-003",
            "title": "Group Chat",
            "priority": "SHOULD",
            "linked_requirement": "WA-GRP-001",
            "as_a": "user",
            "i_want": "create group",
            "so_that": "chat with multiple",
            "description": "Group messaging",
        },
        {
            "id": "US-004",
            "title": "Profile Settings",
            "priority": "COULD",
            "linked_requirement": "WA-PROF-001",
            "as_a": "user",
            "i_want": "edit profile",
            "so_that": "be recognized",
            "description": "Profile management",
        },
    ]
    (data_dir / "user_stories.json").write_text(
        json.dumps(stories), encoding="utf-8"
    )

    tasks_dir = data_dir / "tasks"
    tasks_dir.mkdir()

    # Epic 001: Auth + Messaging
    epic1 = {
        "epic_id": "EPIC-001",
        "epic_name": "Authentication & Messaging",
        "tasks": [
            {
                "id": "E1-AUTH",
                "epic_id": "EPIC-001",
                "type": "api_endpoint",
                "title": "Auth endpoint",
                "description": "Register with phone",
                "status": "completed",
                "dependencies": [],
                "output_files": ["src/auth.ts"],
                "related_requirements": ["WA-AUTH-001"],
                "related_user_stories": ["US-001"],
                "phase": "api",
            },
            {
                "id": "E1-MSG",
                "epic_id": "EPIC-001",
                "type": "api_endpoint",
                "title": "Send message",
                "description": "Send text message",
                "status": "pending",
                "dependencies": [],
                "output_files": [],
                "related_requirements": ["WA-MSG-001"],
                "related_user_stories": ["US-002"],
                "phase": "api",
            },
        ],
    }
    (tasks_dir / "epic-001-tasks.json").write_text(
        json.dumps(epic1), encoding="utf-8"
    )

    # Epic 002: Groups + Profile
    epic2 = {
        "epic_id": "EPIC-002",
        "epic_name": "Groups & Profile",
        "tasks": [
            {
                "id": "E2-GRP",
                "epic_id": "EPIC-002",
                "type": "api_endpoint",
                "title": "Group chat",
                "description": "Create group chats",
                "status": "pending",
                "dependencies": [],
                "output_files": [],
                "related_requirements": ["WA-GRP-001"],
                "related_user_stories": ["US-003"],
                "phase": "api",
            },
            {
                "id": "E2-PROF",
                "epic_id": "EPIC-002",
                "type": "fe_component",
                "title": "Profile page",
                "description": "Edit profile settings",
                "status": "pending",
                "dependencies": [],
                "output_files": [],
                "related_requirements": ["WA-PROF-001"],
                "related_user_stories": ["US-004"],
                "phase": "frontend",
            },
        ],
    }
    (tasks_dir / "epic-002-tasks.json").write_text(
        json.dumps(epic2), encoding="utf-8"
    )

    # Output dir with minimal code
    output_dir = data_dir / "output"
    output_dir.mkdir()
    (output_dir / "auth.ts").write_text(
        "export const register = () => {};", encoding="utf-8"
    )

    return data_dir


class TestPerEpicFiltering:
    """Tests for per-epic task and requirement filtering (Phase 20b)."""

    @pytest.mark.asyncio
    async def test_start_with_epic_id_loads_only_epic_tasks(self, multi_epic_dir):
        """When epic_id is set, only that epic's tasks should be loaded."""
        service = DifferentialAnalysisService(
            data_dir=str(multi_epic_dir),
            epic_id="EPIC-001",
        )
        await service.start()

        # Only EPIC-001 tasks loaded (2 tasks)
        assert service.task_count == 2
        task_ids = [t["id"] for t in service._tasks]
        assert "E1-AUTH" in task_ids
        assert "E1-MSG" in task_ids
        assert "E2-GRP" not in task_ids
        assert "E2-PROF" not in task_ids

        await service.stop()

    @pytest.mark.asyncio
    async def test_start_with_epic_id_filters_user_stories(self, multi_epic_dir):
        """When epic_id is set, only related user stories should be loaded."""
        service = DifferentialAnalysisService(
            data_dir=str(multi_epic_dir),
            epic_id="EPIC-001",
        )
        await service.start()

        # EPIC-001 references WA-AUTH-001, US-001, WA-MSG-001, US-002
        # So user stories US-001 and US-002 should be loaded
        story_ids = [s["id"] for s in service._user_stories]
        assert "US-001" in story_ids
        assert "US-002" in story_ids
        assert "US-003" not in story_ids
        assert "US-004" not in story_ids

        await service.stop()

    @pytest.mark.asyncio
    async def test_epic_requirements_extraction(self, multi_epic_dir):
        """Should extract requirement IDs from epic tasks."""
        service = DifferentialAnalysisService(
            data_dir=str(multi_epic_dir),
            epic_id="EPIC-002",
        )
        await service.start()

        # EPIC-002 tasks reference WA-GRP-001, US-003, WA-PROF-001, US-004
        assert "WA-GRP-001" in service._epic_requirements
        assert "US-003" in service._epic_requirements
        assert "WA-PROF-001" in service._epic_requirements
        assert "US-004" in service._epic_requirements
        assert "WA-AUTH-001" not in service._epic_requirements

        await service.stop()

    @pytest.mark.asyncio
    async def test_run_analysis_auto_focuses_on_epic(self, multi_epic_dir):
        """run_analysis() should auto-focus on epic requirements when epic_id is set."""
        service = DifferentialAnalysisService(
            data_dir=str(multi_epic_dir),
            epic_id="EPIC-001",
        )
        await service.start()
        report = await service.run_analysis(mode=AnalysisMode.REQUIREMENT_COVERAGE)

        # Only requirements from EPIC-001 should be analyzed
        req_ids = [f.requirement_id for f in report.findings]
        for req_id in req_ids:
            assert req_id in {"WA-AUTH-001", "WA-MSG-001", "US-001", "US-002", ""}, \
                f"Unexpected requirement in analysis: {req_id}"

        await service.stop()

    @pytest.mark.asyncio
    async def test_start_without_epic_id_loads_all(self, multi_epic_dir):
        """Without epic_id, all tasks and stories should be loaded."""
        service = DifferentialAnalysisService(
            data_dir=str(multi_epic_dir),
        )
        await service.start()

        # All 4 tasks and 4 stories
        assert service.task_count == 4
        assert len(service._user_stories) == 4

        await service.stop()
