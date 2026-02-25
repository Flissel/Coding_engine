# Coding Engine

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Python 3.11+](https://img.shields.io/badge/python-3.11+-blue.svg)](https://www.python.org/downloads/)
[![TypeScript](https://img.shields.io/badge/TypeScript-5.0+-blue.svg)](https://www.typescriptlang.org/)
[![Docker](https://img.shields.io/badge/Docker-Required-blue.svg)](https://www.docker.com/)

> **AI-Powered Autonomous Code Generation Platform**

Coding Engine is an open-source platform that transforms structured JSON requirements into fully functional software applications using a "Society of Mind" multi-agent architecture with 40+ specialized AI agents.

## Features

- **Autonomous Code Generation** - Generate complete full-stack applications from requirements
- **40+ Specialized AI Agents** - Parallel agents for code, tests, validation, deployment
- **Self-Correcting System** - Automatic build/test error fixing until convergence
- **Live Preview** - Real-time application preview during generation
- **VNC Streaming** - Watch Electron/GUI apps run in Docker containers
- **Review Gate** - Pause generation, provide feedback via chat, resume with context
- **Vision AI Feedback** - Claude Vision analyzes screenshots for UI issues
- **Electron Dashboard** - Modern UI for project management and monitoring
- **Multi-Tech Support** - React, Vue, Node.js, Python, FastAPI, Electron
- **Enterprise Security** - LLM security scanning, mTLS, RBAC support
- **Kubernetes Ready** - Cell Colony system for distributed deployment

## Quick Start

### Prerequisites

- Python 3.11+
- Node.js 20+
- Docker Desktop
- Anthropic API Key (Claude)

### Installation

```bash
# Clone the repository
git clone https://github.com/yourusername/coding-engine.git
cd coding-engine

# Create virtual environment
python -m venv venv
source venv/bin/activate  # On Windows: venv\Scripts\activate

# Install dependencies
pip install -r requirements.txt

# Copy environment template
cp .env.example .env
# Edit .env and add your ANTHROPIC_API_KEY
```

### Basic Usage

```bash
# Generate a project from requirements
python run_society_hybrid.py examples/todo-app.json --output-dir ./output

# Fast mode (quick prototyping)
python run_society_hybrid.py requirements.json --fast

# Autonomous mode (runs until 100% complete)
python run_society_hybrid.py requirements.json --autonomous

# With live preview at http://localhost:5173
python run_society_hybrid.py requirements.json --output-dir ./output
```

### Requirements JSON Format

```json
{
  "name": "my-app",
  "type": "react",
  "description": "A modern web application",
  "features": [
    {
      "id": "auth",
      "name": "User Authentication",
      "description": "JWT-based login with email/password",
      "priority": "high"
    },
    {
      "id": "dashboard",
      "name": "Dashboard",
      "description": "Main dashboard with statistics",
      "priority": "high"
    }
  ]
}
```

## Architecture

### Society of Mind

The system uses an event-driven multi-agent architecture where specialized agents communicate via an EventBus:

```
┌─────────────────────────────────────────────────┐
│                 ORCHESTRATOR                     │
│        (Coordinates agents, checks convergence) │
└─────────────────────────────────────────────────┘
                        │
                        ▼
┌─────────────────────────────────────────────────┐
│                   EVENT BUS                      │
│            (Pub/Sub, Push Architecture)          │
└─────────────────────────────────────────────────┘
        │           │           │           │
        ▼           ▼           ▼           ▼
   ┌────────┐  ┌────────┐  ┌────────┐  ┌────────┐
   │Generator│  │Builder │  │ Tester │  │ Fixer  │
   │ Agent   │  │ Agent  │  │ Agent  │  │ Agent  │
   └────────┘  └────────┘  └────────┘  └────────┘
```

### Agent Categories

| Category | Agents | Purpose |
|----------|--------|---------|
| **Generation** | Architect, Generator, Database, API, Auth | Code creation |
| **Validation** | Builder, Tester, Validator, TypeChecker | Quality assurance |
| **Fixing** | Fixer, BugFixer, ContinuousDebug | Auto-correction |
| **Deployment** | Deployment, Docker, Sandbox | Runtime verification |
| **Quality** | UXDesign, Security, Performance, Docs | Enhancement |

### Skills & Token Management

Agents use skills (`.claude/skills/{name}/SKILL.md`) with 3-tier progressive loading for token efficiency:
- **Minimal** (~200 tokens): Simple fixes
- **Standard** (~800 tokens): Multi-file changes
- **Full** (~1600 tokens): New features

See [.claude/skills/CLAUDE.md](.claude/skills/CLAUDE.md) for details.

### Hybrid Pipeline (5 Phases)

```
Phase 1: Architecture Analysis
    │   → ArchitectAgent creates typed contracts
    ▼
Phase 2: Parallel Code Generation
    │   → 5+ executors generate code simultaneously
    │   → Intelligent chunking by domain
    ▼
Phase 3: Merge & Integration
    │   → CodeMerger combines slices
    │   → Conflict resolution
    ▼
Phase 4: Verification Loop
    │   → Build → Test → Validate → Fix → Repeat
    │   → Until convergence criteria met
    ▼
Phase 5: Deployment Verification
        → Docker Sandbox Testing
        → VNC Streaming for GUI apps
```

## Dashboard

The Electron-based dashboard provides:

- **Project Management** - Create, monitor, manage projects
- **Generation Monitor** - Real-time progress with agent activity
- **Live Preview** - VNC-based application streaming with health checks
- **Review Gate** - Pause generation, chat-style feedback with Vision AI
- **Marketplace** - Cell component marketplace

### Review Gate Workflow

```text
Generation Running → Click "Pause" → Generation Halts
        ↓
Test App in VNC Preview
        ↓
Write Feedback → Vision AI Analyzes Screenshot
        ↓
Click "Continue" → Generation Resumes with Feedback
```

```bash
# Run the dashboard
cd dashboard-app
npm install
npm run build
npm run dev
```

## Docker Support

### Build Sandbox Image

```bash
cd infra/docker
docker build -t coding-engine/sandbox:latest -f Dockerfile.sandbox .
```

### Run with Docker Compose

```bash
# Full development environment
docker-compose -f infra/docker/docker-compose.dashboard.yml up

# Validation sandbox
docker-compose -f infra/docker/docker-compose.validation.yml up
```

## API Reference

### REST API (Port 8000)

```bash
# Start the API server
uvicorn src.api.main:app --reload
```

| Endpoint | Method | Description |
|----------|--------|-------------|
| `/api/v1/projects` | GET/POST | Project CRUD |
| `/api/v1/jobs` | POST | Submit generation job |
| `/api/v1/jobs/{id}` | GET | Get job status |
| `/api/v1/ws` | WS | Real-time updates |
| `/api/v1/dashboard/generation/{id}/pause` | POST | Pause for review |
| `/api/v1/dashboard/generation/{id}/resume` | POST | Resume generation |
| `/api/v1/vision/analyze-ui-feedback` | POST | Analyze UI screenshot |
| `/health` | GET | Health check |

### WebSocket Events

```javascript
const ws = new WebSocket('ws://localhost:8000/api/v1/ws');
ws.onmessage = (event) => {
  const data = JSON.parse(event.data);
  // Events: CONVERGENCE_UPDATE, BUILD_SUCCEEDED, TEST_PASSED, etc.
};
```

## Configuration

### Environment Variables

| Variable | Description | Required |
|----------|-------------|----------|
| `ANTHROPIC_API_KEY` | Claude API key | Yes |
| `DATABASE_URL` | PostgreSQL connection | No |
| `REDIS_URL` | Redis connection | No |
| `CODING_ENGINE_API_URL` | API server URL | No |

### Convergence Modes

| Mode | Test Rate | Errors | Timeout | Use Case |
|------|-----------|--------|---------|----------|
| `--autonomous` | 100% | 0 | 1h | Production |
| `--strict` | 100% | 0 | 10min | Quality |
| `--relaxed` | 80% | 5 | 10min | MVP |
| `--fast` | 70% | 10 | 5min | Prototyping |

## Project Structure

```
coding-engine/
├── src/
│   ├── mind/           # Society of Mind (EventBus, Orchestrator)
│   ├── engine/         # Hybrid Pipeline
│   ├── agents/         # 40+ Autonomous Agents
│   ├── api/            # FastAPI REST/WebSocket
│   ├── colony/         # Kubernetes Integration
│   ├── security/       # LLM & Runtime Security
│   ├── tools/          # Claude CLI, Test Runner
│   ├── validators/     # TypeScript, Build Validation
│   └── monitoring/     # Metrics, Logging
├── dashboard-app/      # Electron/React Dashboard
├── infra/
│   ├── docker/         # Docker configurations
│   └── k8s/            # Kubernetes manifests
├── examples/           # Example requirements
├── tests/              # Test suites
└── docs/               # Documentation
```

## Contributing

We welcome contributions! Please see our [Contributing Guide](CONTRIBUTING.md) for details.

### Development Setup

```bash
# Install dev dependencies
pip install -r requirements-dev.txt

# Run tests
pytest

# Run linting
flake8 src/
mypy src/
```

## Roadmap

- [ ] Visual Studio Code extension
- [ ] GitHub Actions integration
- [ ] Cloud deployment (AWS, GCP, Azure)
- [ ] Mobile app generation (React Native)
- [ ] Plugin system for custom agents
- [ ] Multi-language support (Go, Rust, Java)

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Acknowledgments

- [Anthropic](https://www.anthropic.com/) for Claude API
- [AutoGen](https://github.com/microsoft/autogen) for multi-agent patterns
- [Playwright](https://playwright.dev/) for E2E testing
- All our amazing contributors!

## Support

- [GitHub Issues](https://github.com/yourusername/coding-engine/issues)
- [Discussions](https://github.com/yourusername/coding-engine/discussions)

---

<p align="center">
  Made with AI by the Coding Engine Community
</p>
