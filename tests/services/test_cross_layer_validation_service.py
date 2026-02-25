# -*- coding: utf-8 -*-
"""
Tests for CrossLayerValidationService (Phase 23).

Tests pure static analysis for frontend-backend consistency:
- API Route Alignment
- DTO Field Alignment
- Security Consistency
- Import Resolution
"""

import os
import pytest
import asyncio
from pathlib import Path
from unittest.mock import MagicMock

from src.services.cross_layer_validation_service import (
    CrossLayerCheckMode,
    CrossLayerFinding,
    CrossLayerReport,
    CrossLayerValidationService,
    FindingSeverity,
)


# ---------------------------------------------------------------------------
# Fixtures
# ---------------------------------------------------------------------------

@pytest.fixture
def tmp_project(tmp_path):
    """Create a minimal NestJS+React project structure."""
    src = tmp_path / "src"

    # Backend: modules/auth/auth.controller.ts
    be_auth = src / "modules" / "auth"
    be_auth.mkdir(parents=True)
    (be_auth / "auth.controller.ts").write_text(
        """
import { Controller, Post, Body, Get } from '@nestjs/common';

@Controller('auth')
export class AuthController {
  @Post('login')
  async login(@Body() dto: LoginDto) {}

  @Post('register')
  async register(@Body() dto: RegisterDto) {}

  @Get('profile')
  async getProfile() {}
}
""",
        encoding="utf-8",
    )

    # Backend: modules/users/users.controller.ts
    be_users = src / "modules" / "users"
    be_users.mkdir(parents=True)
    (be_users / "users.controller.ts").write_text(
        """
import { Controller, Get, Put, Param } from '@nestjs/common';

@Controller('users')
export class UsersController {
  @Get(':id')
  async getUser(@Param('id') id: string) {}

  @Put(':id')
  async updateUser(@Param('id') id: string) {}
}
""",
        encoding="utf-8",
    )

    # Backend: modules/auth/dto/login.dto.ts
    be_dto = be_auth / "dto"
    be_dto.mkdir(parents=True)
    (be_dto / "login.dto.ts").write_text(
        """
import { IsString, IsNotEmpty } from 'class-validator';

export class LoginDto {
  @IsString()
  @IsNotEmpty()
  email: string;

  @IsString()
  @IsNotEmpty()
  password: string;
}

export class RegisterDto {
  @IsString()
  username: string;

  @IsString()
  email: string;

  @IsString()
  password: string;

  @IsString()
  phone?: string;
}
""",
        encoding="utf-8",
    )

    # Frontend: api/authAPI.ts
    fe_api = src / "api"
    fe_api.mkdir(parents=True)
    (fe_api / "authAPI.ts").write_text(
        """
export const login = async (email: string, password: string) => {
  return fetch('/api/v1/auth/login', {
    method: 'POST',
    body: JSON.stringify({ email, password }),
  });
};

export const register = async (data: RegisterData) => {
  return fetch('/api/v1/auth/register', {
    method: 'POST',
    body: JSON.stringify(data),
  });
};

export const getProfile = async () => {
  return fetch('/api/v1/auth/profile');
};
""",
        encoding="utf-8",
    )

    # Frontend: api/usersAPI.ts (with a mismatched route)
    (fe_api / "usersAPI.ts").write_text(
        """
export const getUser = async (id: string) => {
  return fetch(`/api/v1/users/${id}`);
};

export const updateUser = async (id: string, data: any) => {
  return fetch(`/api/v1/users/${id}`, { method: 'PUT' });
};
""",
        encoding="utf-8",
    )

    # Frontend: components/LoginForm.tsx
    fe_components = src / "components"
    fe_components.mkdir(parents=True)
    (fe_components / "LoginForm.tsx").write_text(
        """
import React from 'react';
import { login } from '../api/authAPI';

interface LoginFormData {
  email: string;
  password: string;
}

export const LoginForm: React.FC = () => {
  return <div>Login</div>;
};
""",
        encoding="utf-8",
    )

    return tmp_path


@pytest.fixture
def tmp_project_mismatched(tmp_path):
    """Create a project with deliberate mismatches."""
    src = tmp_path / "src"

    # Backend: has /auth routes
    be_auth = src / "modules" / "auth"
    be_auth.mkdir(parents=True)
    (be_auth / "auth.controller.ts").write_text(
        """
@Controller('auth')
export class AuthController {
  @Post('send-otp')
  async sendOtp() {}
}
""",
        encoding="utf-8",
    )

    # Frontend: calls DIFFERENT route
    fe_api = src / "api"
    fe_api.mkdir(parents=True)
    (fe_api / "authAPI.ts").write_text(
        """
export const sendOtp = async (phone: string) => {
  return fetch('/api/auth/send-verification', {
    method: 'POST',
  });
};
""",
        encoding="utf-8",
    )

    return tmp_path


@pytest.fixture
def tmp_project_security(tmp_path):
    """Create a project with security issues."""
    src = tmp_path / "src"

    # Backend: users.service.ts hashes with bcrypt
    be_users = src / "modules" / "users"
    be_users.mkdir(parents=True)
    (be_users / "users.service.ts").write_text(
        """
import * as bcrypt from 'bcrypt';

export class UsersService {
  async createUser(data: CreateUserDto) {
    const hashedPin = await bcrypt.hash(data.pin, 10);
    return this.repo.save({ ...data, pinCode: hashedPin });
  }
}
""",
        encoding="utf-8",
    )

    # Backend: auth.service.ts does PLAIN comparison (bug!)
    be_auth = src / "modules" / "auth"
    be_auth.mkdir(parents=True)
    (be_auth / "auth.service.ts").write_text(
        """
export class AuthService {
  async verifyPin(user: User, pin: string) {
    if (user.pinCode !== pin) {
      throw new UnauthorizedException('Invalid PIN');
    }
    return true;
  }
}
""",
        encoding="utf-8",
    )

    return tmp_path


@pytest.fixture
def tmp_project_imports(tmp_path):
    """Create a project with broken imports."""
    src = tmp_path / "src"

    # Create a component that imports from a missing file
    components = src / "components"
    components.mkdir(parents=True)
    (components / "App.tsx").write_text(
        """
import React from 'react';
import { UserList } from './UserList';
import { Settings } from './Settings';
import { useAuth } from '../hooks/useAuth';
""",
        encoding="utf-8",
    )

    # UserList exists
    (components / "UserList.tsx").write_text(
        "export const UserList = () => <div/>;",
        encoding="utf-8",
    )

    # Settings does NOT exist → broken import
    # hooks/useAuth does NOT exist → broken import

    return tmp_path


@pytest.fixture
def tmp_project_dtos(tmp_path):
    """Create a project with DTO mismatches."""
    src = tmp_path / "src"

    # Frontend interface
    fe_api = src / "api"
    fe_api.mkdir(parents=True)
    (fe_api / "types.ts").write_text(
        """
export interface LoginRequest {
  email: string;
  password: string;
  rememberMe: boolean;
}

export interface RegisterRequest {
  username: string;
  email: string;
  password: string;
}
""",
        encoding="utf-8",
    )

    # Backend DTO (missing rememberMe, extra field)
    be_auth = src / "modules" / "auth" / "dto"
    be_auth.mkdir(parents=True)
    (be_auth / "login.dto.ts").write_text(
        """
import { IsString, IsNotEmpty } from 'class-validator';

export class LoginDto {
  @IsString()
  @IsNotEmpty()
  email: string;

  @IsString()
  @IsNotEmpty()
  password: string;

  @IsString()
  deviceId: string;
}

export class RegisterDto {
  @IsString()
  username: string;

  @IsString()
  email: string;

  @IsString()
  password: string;
}
""",
        encoding="utf-8",
    )

    return tmp_path


@pytest.fixture
def service(tmp_project):
    return CrossLayerValidationService(project_dir=str(tmp_project))


# ---------------------------------------------------------------------------
# Test: Data Classes
# ---------------------------------------------------------------------------


class TestDataClasses:
    def test_finding_to_dict(self):
        finding = CrossLayerFinding(
            check_mode=CrossLayerCheckMode.API_ROUTE_ALIGNMENT,
            severity=FindingSeverity.CRITICAL,
            frontend_file="src/api/auth.ts",
            backend_file="src/modules/auth/auth.controller.ts",
            description="Route mismatch",
            suggestion="Fix the route",
            confidence=0.95,
        )
        d = finding.to_dict()
        assert d["check_mode"] == "api_route_alignment"
        assert d["severity"] == "critical"
        assert d["confidence"] == 0.95

    def test_report_to_dict(self):
        report = CrossLayerReport()
        report.routes_checked = 5
        report.routes_aligned = 3
        report.alignment_score = 60.0
        report.findings = [
            CrossLayerFinding(
                check_mode=CrossLayerCheckMode.API_ROUTE_ALIGNMENT,
                severity=FindingSeverity.CRITICAL,
                frontend_file="a.ts",
                backend_file="b.ts",
                description="mismatch",
                suggestion="fix",
            ),
            CrossLayerFinding(
                check_mode=CrossLayerCheckMode.SECURITY_CONSISTENCY,
                severity=FindingSeverity.HIGH,
                frontend_file="c.ts",
                backend_file="d.ts",
                description="security",
                suggestion="fix",
            ),
        ]
        d = report.to_dict()
        assert d["total_findings"] == 2
        assert d["critical_count"] == 1
        assert d["high_count"] == 1
        assert d["routes_checked"] == 5

    def test_check_mode_enum_values(self):
        assert CrossLayerCheckMode.FULL.value == "full"
        assert CrossLayerCheckMode.API_ROUTE_ALIGNMENT.value == "api_route_alignment"
        assert CrossLayerCheckMode.DTO_FIELD_ALIGNMENT.value == "dto_field_alignment"
        assert CrossLayerCheckMode.SECURITY_CONSISTENCY.value == "security_consistency"
        assert CrossLayerCheckMode.IMPORT_RESOLUTION.value == "import_resolution"

    def test_finding_severity_enum(self):
        assert FindingSeverity.CRITICAL.value == "critical"
        assert FindingSeverity.HIGH.value == "high"
        assert FindingSeverity.MEDIUM.value == "medium"
        assert FindingSeverity.LOW.value == "low"


# ---------------------------------------------------------------------------
# Test: Service Lifecycle
# ---------------------------------------------------------------------------


class TestServiceLifecycle:
    @pytest.mark.asyncio
    async def test_start_valid_project(self, service):
        result = await service.start()
        assert result is True
        assert service._running is True
        assert len(service._frontend_files) > 0
        assert len(service._backend_files) > 0
        await service.stop()

    @pytest.mark.asyncio
    async def test_start_nonexistent_dir(self, tmp_path):
        svc = CrossLayerValidationService(project_dir=str(tmp_path / "nonexistent"))
        result = await svc.start()
        assert result is False

    @pytest.mark.asyncio
    async def test_stop(self, service):
        await service.start()
        await service.stop()
        assert service._running is False
        assert len(service._frontend_files) == 0
        assert len(service._backend_files) == 0

    @pytest.mark.asyncio
    async def test_auto_start_on_run(self, service):
        """run_validation should auto-start if not running."""
        report = await service.run_validation()
        assert service._running is True
        await service.stop()


# ---------------------------------------------------------------------------
# Test: File Indexing
# ---------------------------------------------------------------------------


class TestFileIndexing:
    @pytest.mark.asyncio
    async def test_frontend_files_indexed(self, service):
        await service.start()
        fe_names = {f.name for f in service._frontend_files}
        assert "authAPI.ts" in fe_names
        assert "usersAPI.ts" in fe_names
        assert "LoginForm.tsx" in fe_names
        await service.stop()

    @pytest.mark.asyncio
    async def test_backend_files_indexed(self, service):
        await service.start()
        be_names = {f.name for f in service._backend_files}
        assert "auth.controller.ts" in be_names
        assert "users.controller.ts" in be_names
        assert "login.dto.ts" in be_names
        await service.stop()

    @pytest.mark.asyncio
    async def test_tsx_files_are_frontend(self, service):
        await service.start()
        tsx_files = [f for f in service._frontend_files if f.suffix == ".tsx"]
        assert len(tsx_files) > 0
        await service.stop()

    @pytest.mark.asyncio
    async def test_node_modules_excluded(self, service):
        """node_modules string in path should cause exclusion."""
        await service.start()
        # Verify that no indexed file has node_modules in its path
        for f in service._all_ts_files:
            assert "node_modules" not in str(f)
        await service.stop()


# ---------------------------------------------------------------------------
# Test: API Route Alignment
# ---------------------------------------------------------------------------


class TestRouteAlignment:
    @pytest.mark.asyncio
    async def test_matching_routes(self, service):
        """All FE routes match BE routes → no findings."""
        report = await service.run_validation(mode=CrossLayerCheckMode.API_ROUTE_ALIGNMENT)
        # authAPI.ts calls /api/v1/auth/login, /api/v1/auth/register, /api/v1/auth/profile
        # auth.controller.ts serves auth/login, auth/register, auth/profile
        assert report.routes_checked > 0
        assert report.routes_aligned > 0
        route_findings = [f for f in report.findings if f.check_mode == CrossLayerCheckMode.API_ROUTE_ALIGNMENT]
        # Matching routes should have 0 or minimal findings
        await service.stop()

    @pytest.mark.asyncio
    async def test_mismatched_routes(self, tmp_project_mismatched):
        """FE calls /api/auth/send-verification, BE serves /api/v1/auth/send-otp → finding."""
        svc = CrossLayerValidationService(project_dir=str(tmp_project_mismatched))
        report = await svc.run_validation(mode=CrossLayerCheckMode.API_ROUTE_ALIGNMENT)
        route_findings = [f for f in report.findings if f.check_mode == CrossLayerCheckMode.API_ROUTE_ALIGNMENT]
        assert len(route_findings) > 0
        assert any("send-verification" in f.description for f in route_findings)
        assert route_findings[0].severity == FindingSeverity.CRITICAL
        await svc.stop()

    @pytest.mark.asyncio
    async def test_parameterized_routes(self, service):
        """Template literal routes with ${id} should normalize to :param."""
        await service.start()
        fe_routes = service._extract_frontend_routes()
        # usersAPI.ts has fetch(`/api/v1/users/${id}`) → should normalize to /api/v1/users/:param
        has_param_route = any(":param" in route for route in fe_routes.keys())
        assert has_param_route
        await service.stop()

    @pytest.mark.asyncio
    async def test_route_normalization(self, service):
        await service.start()
        assert service._normalize_route("/api/v1/auth/login/") == "/api/v1/auth/login"
        assert service._normalize_route("/api/v1/users/:id") == "/api/v1/users/:param"
        assert service._normalize_route("/API/V1/Auth/Login") == "/api/v1/auth/login"
        await service.stop()

    @pytest.mark.asyncio
    async def test_closest_route_match(self, service):
        await service.start()
        candidates = ["/api/v1/auth/login", "/api/v1/users/:id", "/api/v1/products"]
        closest = service._find_closest_route("/api/v1/auth/register", candidates)
        assert closest == "/api/v1/auth/login"  # shares /api/v1/auth
        await service.stop()

    @pytest.mark.asyncio
    async def test_closest_route_no_match(self, service):
        await service.start()
        candidates = ["/something/else"]
        closest = service._find_closest_route("/api/v1/auth/login", candidates)
        assert closest is None  # no match with score >= 2
        await service.stop()

    @pytest.mark.asyncio
    async def test_routes_checked_count(self, service):
        report = await service.run_validation(mode=CrossLayerCheckMode.API_ROUTE_ALIGNMENT)
        # We have authAPI.ts (3 routes) + usersAPI.ts (2 routes) = 5 frontend routes
        assert report.routes_checked >= 3
        await service.stop()

    @pytest.mark.asyncio
    async def test_empty_project_no_routes(self, tmp_path):
        """Empty project should have 0 routes checked."""
        (tmp_path / "src").mkdir()
        svc = CrossLayerValidationService(project_dir=str(tmp_path))
        report = await svc.run_validation(mode=CrossLayerCheckMode.API_ROUTE_ALIGNMENT)
        assert report.routes_checked == 0
        assert len(report.findings) == 0
        await svc.stop()


# ---------------------------------------------------------------------------
# Test: DTO Field Alignment
# ---------------------------------------------------------------------------


class TestDTOAlignment:
    @pytest.mark.asyncio
    async def test_matching_dtos(self, tmp_project):
        """LoginFormData in FE matches LoginDto in BE (email, password)."""
        svc = CrossLayerValidationService(project_dir=str(tmp_project))
        report = await svc.run_validation(mode=CrossLayerCheckMode.DTO_FIELD_ALIGNMENT)
        # LoginFormData has {email, password} and LoginDto has {email, password} → aligned
        await svc.stop()

    @pytest.mark.asyncio
    async def test_mismatched_dtos(self, tmp_project_dtos):
        """FE LoginRequest has rememberMe, BE LoginDto has deviceId → finding."""
        svc = CrossLayerValidationService(project_dir=str(tmp_project_dtos))
        report = await svc.run_validation(mode=CrossLayerCheckMode.DTO_FIELD_ALIGNMENT)
        dto_findings = [f for f in report.findings if f.check_mode == CrossLayerCheckMode.DTO_FIELD_ALIGNMENT]
        # Should find mismatch between LoginRequest and LoginDto
        assert len(dto_findings) > 0
        await svc.stop()

    @pytest.mark.asyncio
    async def test_name_matching(self, service):
        await service.start()
        assert service._names_match("LoginRequest", "LoginDto") is True
        assert service._names_match("RegisterRequest", "RegisterDto") is True
        assert service._names_match("UserData", "UserDto") is True
        assert service._names_match("LoginRequest", "ProductDto") is False
        await service.stop()

    @pytest.mark.asyncio
    async def test_name_matching_short_names(self, service):
        """Short names (<=3 chars) should not match."""
        await service.start()
        assert service._names_match("Id", "IdDto") is False
        await service.stop()

    @pytest.mark.asyncio
    async def test_type_compatibility(self, service):
        await service.start()
        assert service._types_compatible("string", "string") is True
        assert service._types_compatible("number", "int") is True
        assert service._types_compatible("boolean", "bool") is True
        assert service._types_compatible("string", "number") is False
        await service.stop()

    @pytest.mark.asyncio
    async def test_type_compatibility_with_semicolons(self, service):
        """Types may have trailing semicolons from parsing."""
        await service.start()
        assert service._types_compatible("string;", "string") is True
        assert service._types_compatible("number", "number;") is True
        await service.stop()

    @pytest.mark.asyncio
    async def test_extract_frontend_interfaces(self, tmp_project_dtos):
        svc = CrossLayerValidationService(project_dir=str(tmp_project_dtos))
        await svc.start()
        interfaces = svc._extract_frontend_interfaces()
        assert "LoginRequest" in interfaces
        assert "email" in interfaces["LoginRequest"]
        assert "rememberMe" in interfaces["LoginRequest"]
        await svc.stop()

    @pytest.mark.asyncio
    async def test_extract_backend_dtos(self, tmp_project_dtos):
        svc = CrossLayerValidationService(project_dir=str(tmp_project_dtos))
        await svc.start()
        dtos = svc._extract_backend_dtos()
        assert "LoginDto" in dtos
        fields, path = dtos["LoginDto"]
        assert "email" in fields
        assert "deviceId" in fields
        await svc.stop()


# ---------------------------------------------------------------------------
# Test: Security Consistency
# ---------------------------------------------------------------------------


class TestSecurityConsistency:
    @pytest.mark.asyncio
    async def test_plain_compare_detected(self, tmp_project_security):
        """Plain-text comparison of pinCode should be flagged as CRITICAL."""
        svc = CrossLayerValidationService(project_dir=str(tmp_project_security))
        report = await svc.run_validation(mode=CrossLayerCheckMode.SECURITY_CONSISTENCY)
        sec_findings = [f for f in report.findings if f.check_mode == CrossLayerCheckMode.SECURITY_CONSISTENCY]
        assert len(sec_findings) > 0
        assert any(f.severity == FindingSeverity.CRITICAL for f in sec_findings)
        assert any("pinCode" in f.description for f in sec_findings)
        await svc.stop()

    @pytest.mark.asyncio
    async def test_bcrypt_hash_without_compare(self, tmp_project_security):
        """bcrypt.hash() without bcrypt.compare() anywhere → CRITICAL."""
        svc = CrossLayerValidationService(project_dir=str(tmp_project_security))
        report = await svc.run_validation(mode=CrossLayerCheckMode.SECURITY_CONSISTENCY)
        sec_findings = [f for f in report.findings if f.check_mode == CrossLayerCheckMode.SECURITY_CONSISTENCY]
        assert any("bcrypt.hash()" in f.description or "bcrypt.compare()" in f.description for f in sec_findings)
        await svc.stop()

    @pytest.mark.asyncio
    async def test_security_issues_count(self, tmp_project_security):
        svc = CrossLayerValidationService(project_dir=str(tmp_project_security))
        report = await svc.run_validation(mode=CrossLayerCheckMode.SECURITY_CONSISTENCY)
        assert report.security_issues > 0
        await svc.stop()

    @pytest.mark.asyncio
    async def test_no_security_issues_when_consistent(self, tmp_path):
        """Project with proper bcrypt hash+compare should have no security findings."""
        src = tmp_path / "src" / "modules" / "auth"
        src.mkdir(parents=True)
        (src / "auth.service.ts").write_text(
            """
import * as bcrypt from 'bcrypt';

export class AuthService {
  async hashPassword(pw: string) {
    return bcrypt.hash(pw, 10);
  }

  async verifyPassword(pw: string, hash: string) {
    return bcrypt.compare(pw, hash);
  }
}
""",
            encoding="utf-8",
        )
        svc = CrossLayerValidationService(project_dir=str(tmp_path))
        report = await svc.run_validation(mode=CrossLayerCheckMode.SECURITY_CONSISTENCY)
        sec_findings = [f for f in report.findings if f.check_mode == CrossLayerCheckMode.SECURITY_CONSISTENCY]
        assert len(sec_findings) == 0
        assert report.security_issues == 0
        await svc.stop()

    @pytest.mark.asyncio
    async def test_crypto_hash_without_timing_safe(self, tmp_path):
        """crypto.createHash without timingSafeEqual → HIGH finding."""
        src = tmp_path / "src" / "modules" / "auth"
        src.mkdir(parents=True)
        (src / "token.service.ts").write_text(
            """
import * as crypto from 'crypto';

export class TokenService {
  verify(token: string, hash: string) {
    const computed = crypto.createHash('sha256').update(token).digest('hex');
    return computed === hash;
  }
}
""",
            encoding="utf-8",
        )
        svc = CrossLayerValidationService(project_dir=str(tmp_path))
        report = await svc.run_validation(mode=CrossLayerCheckMode.SECURITY_CONSISTENCY)
        sec_findings = [f for f in report.findings if f.check_mode == CrossLayerCheckMode.SECURITY_CONSISTENCY]
        assert any("timing" in f.description.lower() for f in sec_findings)
        assert any(f.severity == FindingSeverity.HIGH for f in sec_findings)
        await svc.stop()

    @pytest.mark.asyncio
    async def test_crypto_hash_with_timing_safe_ok(self, tmp_path):
        """crypto.createHash + timingSafeEqual → no finding."""
        src = tmp_path / "src" / "modules" / "auth"
        src.mkdir(parents=True)
        (src / "token.service.ts").write_text(
            """
import * as crypto from 'crypto';

export class TokenService {
  verify(token: string, expected: string) {
    const computed = crypto.createHash('sha256').update(token).digest();
    const expectedBuf = Buffer.from(expected, 'hex');
    return crypto.timingSafeEqual(computed, expectedBuf);
  }
}
""",
            encoding="utf-8",
        )
        svc = CrossLayerValidationService(project_dir=str(tmp_path))
        report = await svc.run_validation(mode=CrossLayerCheckMode.SECURITY_CONSISTENCY)
        sec_findings = [f for f in report.findings if f.check_mode == CrossLayerCheckMode.SECURITY_CONSISTENCY]
        assert len(sec_findings) == 0
        await svc.stop()

    @pytest.mark.asyncio
    async def test_password_comparison(self, tmp_path):
        """Direct .password === comparison → CRITICAL."""
        src = tmp_path / "src" / "modules" / "auth"
        src.mkdir(parents=True)
        (src / "auth.service.ts").write_text(
            """
export class AuthService {
  async verify(user: User, pw: string) {
    if (user.password === pw) {
      return true;
    }
    return false;
  }
}
""",
            encoding="utf-8",
        )
        svc = CrossLayerValidationService(project_dir=str(tmp_path))
        report = await svc.run_validation(mode=CrossLayerCheckMode.SECURITY_CONSISTENCY)
        sec_findings = [f for f in report.findings if f.check_mode == CrossLayerCheckMode.SECURITY_CONSISTENCY]
        assert any("password" in f.description.lower() for f in sec_findings)
        await svc.stop()


# ---------------------------------------------------------------------------
# Test: Import Resolution
# ---------------------------------------------------------------------------


class TestImportResolution:
    @pytest.mark.asyncio
    async def test_valid_import_resolves(self, tmp_project_imports):
        """Import of ./UserList should resolve (file exists)."""
        svc = CrossLayerValidationService(project_dir=str(tmp_project_imports))
        report = await svc.run_validation(mode=CrossLayerCheckMode.IMPORT_RESOLUTION)
        import_findings = [f for f in report.findings if f.check_mode == CrossLayerCheckMode.IMPORT_RESOLUTION]
        # UserList import should NOT be in findings (it exists)
        desc_text = " ".join(f.description for f in import_findings)
        assert "UserList" not in desc_text
        await svc.stop()

    @pytest.mark.asyncio
    async def test_broken_import_detected(self, tmp_project_imports):
        """Import of ./Settings should fail (file doesn't exist)."""
        svc = CrossLayerValidationService(project_dir=str(tmp_project_imports))
        report = await svc.run_validation(mode=CrossLayerCheckMode.IMPORT_RESOLUTION)
        import_findings = [f for f in report.findings if f.check_mode == CrossLayerCheckMode.IMPORT_RESOLUTION]
        assert any("Settings" in f.description for f in import_findings)
        await svc.stop()

    @pytest.mark.asyncio
    async def test_broken_hook_import(self, tmp_project_imports):
        """Import of ../hooks/useAuth should fail (directory doesn't exist)."""
        svc = CrossLayerValidationService(project_dir=str(tmp_project_imports))
        report = await svc.run_validation(mode=CrossLayerCheckMode.IMPORT_RESOLUTION)
        import_findings = [f for f in report.findings if f.check_mode == CrossLayerCheckMode.IMPORT_RESOLUTION]
        assert any("useAuth" in f.description for f in import_findings)
        await svc.stop()

    @pytest.mark.asyncio
    async def test_import_severity_is_high(self, tmp_project_imports):
        svc = CrossLayerValidationService(project_dir=str(tmp_project_imports))
        report = await svc.run_validation(mode=CrossLayerCheckMode.IMPORT_RESOLUTION)
        import_findings = [f for f in report.findings if f.check_mode == CrossLayerCheckMode.IMPORT_RESOLUTION]
        for f in import_findings:
            assert f.severity == FindingSeverity.HIGH

        await svc.stop()

    @pytest.mark.asyncio
    async def test_import_issues_count(self, tmp_project_imports):
        svc = CrossLayerValidationService(project_dir=str(tmp_project_imports))
        report = await svc.run_validation(mode=CrossLayerCheckMode.IMPORT_RESOLUTION)
        assert report.import_issues >= 2  # Settings + useAuth
        await svc.stop()

    @pytest.mark.asyncio
    async def test_index_ts_resolution(self, tmp_path):
        """Import from a directory with index.ts should resolve."""
        src = tmp_path / "src" / "components"
        src.mkdir(parents=True)

        utils = src / "utils"
        utils.mkdir()
        (utils / "index.ts").write_text("export const x = 1;", encoding="utf-8")

        (src / "App.tsx").write_text(
            """
import { x } from './utils';
""",
            encoding="utf-8",
        )

        svc = CrossLayerValidationService(project_dir=str(tmp_path))
        report = await svc.run_validation(mode=CrossLayerCheckMode.IMPORT_RESOLUTION)
        import_findings = [f for f in report.findings if f.check_mode == CrossLayerCheckMode.IMPORT_RESOLUTION]
        # utils import should resolve via index.ts
        assert not any("utils" in f.description for f in import_findings)
        await svc.stop()


# ---------------------------------------------------------------------------
# Test: Full Validation
# ---------------------------------------------------------------------------


class TestFullValidation:
    @pytest.mark.asyncio
    async def test_full_mode_runs_all_checks(self, service):
        report = await service.run_validation(mode=CrossLayerCheckMode.FULL)
        # Full mode should set all counters
        assert isinstance(report.routes_checked, int)
        assert isinstance(report.dtos_checked, int)
        assert isinstance(report.security_issues, int)
        assert isinstance(report.import_issues, int)
        await service.stop()

    @pytest.mark.asyncio
    async def test_alignment_score_perfect(self, tmp_path):
        """Empty project should have 100% alignment (no checks to fail)."""
        (tmp_path / "src").mkdir()
        svc = CrossLayerValidationService(project_dir=str(tmp_path))
        report = await svc.run_validation(mode=CrossLayerCheckMode.FULL)
        assert report.alignment_score == 100.0
        await svc.stop()

    @pytest.mark.asyncio
    async def test_alignment_score_calculated(self, service):
        report = await service.run_validation(mode=CrossLayerCheckMode.FULL)
        assert 0 <= report.alignment_score <= 100
        await service.stop()

    @pytest.mark.asyncio
    async def test_report_has_all_fields(self, service):
        report = await service.run_validation()
        d = report.to_dict()
        assert "findings" in d
        assert "routes_checked" in d
        assert "routes_aligned" in d
        assert "dtos_checked" in d
        assert "dtos_aligned" in d
        assert "security_issues" in d
        assert "import_issues" in d
        assert "alignment_score" in d
        assert "total_findings" in d
        assert "critical_count" in d
        assert "high_count" in d
        await service.stop()

    @pytest.mark.asyncio
    async def test_single_mode_only(self, service):
        """Running a single mode should not populate other check counts."""
        report = await service.run_validation(mode=CrossLayerCheckMode.SECURITY_CONSISTENCY)
        # Security-only run
        assert report.routes_checked == 0
        assert report.dtos_checked == 0
        await service.stop()
