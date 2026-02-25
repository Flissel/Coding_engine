# 🧑‍💻 coding.space — Antoni's Coding Engine

> **VibeMind Space:** coding.space  
> **Voice Agent:** Antoni (Coding Worker)  
> **Projekt:** `C:\Users\User\Desktop\Coding_engine\dashboard-app`  
> **Rolle im VibeMind Multiverse:** Autonome Code-Generierung via Sprache

---

## Was ist coding.space?

coding.space ist der **Code-Generierungs-Space** innerhalb der VibeMind-Plattform. Gesteuert über den Voice Agent **Antoni**, können vollständige Full-Stack-Applikationen allein durch Sprachbefehle erzeugt werden.

> *"Build me a todo app with React"* → Antoni → Coding Engine → Fertiges Projekt

---

## Architektur

### Voice → Code Pipeline

```
User Voice ──► ElevenLabs SDK ──► Antoni (Coding Agent)
                                       │
                                       ▼
                              ClientToolsManager
                                       │
                    ┌──────────────────┼──────────────────┐
                    ▼                  ▼                  ▼
             generate_code()   get_generation_status()  start_preview()
                    │
                    ▼
           ┌───────────────────────────────────────────┐
           │         SOCIETY OF MIND ENGINE            │
           │                                           │
           │  Orchestrator ──► EventBus (Pub/Sub)      │
           │       │                                   │
           │       ├── Generator Agent                 │
           │       ├── Architect Agent                 │
           │       ├── Database Agent                  │
           │       ├── API Agent                       │
           │       ├── Auth Agent                      │
           │       ├── Builder Agent                   │
           │       ├── Tester Agent                    │
           │       ├── Fixer Agent                     │
           │       ├── Security Agent                  │
           │       ├── UX Design Agent                 │
           │       └── ... (40+ Agents)                │
           └───────────────────────────────────────────┘
                    │
                    ▼
           Docker Sandbox + VNC Live Preview
```

### Hybrid Pipeline (5 Phasen)

| Phase | Beschreibung |
|-------|-------------|
| **1. Architecture Analysis** | ArchitectAgent erstellt typisierte Contracts |
| **2. Parallel Code Generation** | 5+ Executors generieren gleichzeitig Code |
| **3. Merge & Integration** | CodeMerger kombiniert Slices, löst Konflikte |
| **4. Verification Loop** | Build → Test → Validate → Fix → Repeat bis Konvergenz |
| **5. Deployment Verification** | Docker Sandbox Testing + VNC Streaming |


### Konvergenz-Modi

| Modus | Test-Rate | Max Fehler | Timeout | Use Case |
|-------|-----------|-----------|---------|----------|
| `--autonomous` | 100% | 0 | 1h | Produktion |
| `--strict` | 100% | 0 | 10min | Qualität |
| `--relaxed` | 80% | 5 | 10min | MVP |
| `--fast` | 70% | 10 | 5min | Prototyping |

---

## Tech Stack

- **Backend:** Python 3.11+, FastAPI, AutoGen Framework
- **Frontend:** Electron + React + Vite + Tailwind CSS
- **LLM:** Anthropic Claude (via API)
- **Agents:** 40+ spezialisierte AutoGen Agents
- **Container:** Docker Sandbox mit VNC Streaming
- **Testing:** Playwright E2E, pytest
- **Skills:** 3-Tier Token Management (~200/~800/~1600 Tokens)

---

## Projektstruktur

```
Coding_engine/
├── src/
│   ├── mind/           # Society of Mind (EventBus, Orchestrator)
│   ├── engine/         # Hybrid Pipeline (Slicer, Merger, Contracts)
│   ├── agents/         # 40+ Autonome Agents
│   ├── api/            # FastAPI REST/WebSocket Server
│   ├── colony/         # Kubernetes Cell Colony System
│   ├── security/       # LLM & Runtime Security
│   ├── tools/          # Claude CLI, Test Runner, Vision
│   ├── validators/     # TypeScript, Build, Runtime Validation
│   ├── services/       # Fungus Memory, Dashboard, Differential Analysis
│   └── monitoring/     # Browser Error Detection, CLI Tracker
├── dashboard-app/      # Electron/React Dashboard (Antoni UI)
│   ├── src/main/       # Electron Main Process
│   ├── src/renderer/   # React Frontend
│   └── src/preload/    # IPC Bridge
├── la_fungus_search/   # RAG-basierte Semantic Search (Qdrant)
├── infra/
│   ├── docker/         # Dockerfile.sandbox, docker-compose configs
│   ├── k8s/            # Kubernetes CRDs & Templates
│   └── widget/         # Embeddable Widget (HTML/CSS/JS)
├── mcp_plugins/        # MCP Server Plugins (Git, Docker, Playwright...)
├── .claude/
│   ├── agents/         # 12 Claude Code Agent Personas
│   └── skills/         # 25+ Skills für Token-effiziente Prompts
├── config/             # LLM Models, Worker Config, Society Defaults
├── tests/              # Unit, Integration, E2E, Pipeline Tests
└── docs/               # Architektur, Event Flow, Sandbox, MCP Docs
```

---

## Schlüssel-Features

### 🔄 Review Gate
Generation pausieren → App im VNC testen → Chat-Feedback geben → Vision AI analysiert Screenshot → Generation fortsetzen mit Kontext.

### 🧠 Fungus Memory
Persistent Memory via `la_fungus_search/` — RAG-basierte semantische Suche über Qdrant für langfristiges Projekt-Wissen.

### 🐳 Docker Sandbox
Jedes generierte Projekt läuft isoliert in einem Docker Container mit VNC Streaming für Live-Preview.

### 🔐 Enterprise Security
LLM Security Scanning, mTLS Support, RBAC, Supply Chain Validation.

### 🏗️ Cell Colony
Kubernetes-basiertes Deployment-System für verteilte Agent-Ausführung.

---

## Quick Start

```bash
# Projekt generieren
python run_society_hybrid.py requirements.json --output-dir ./output

# Dashboard starten
cd dashboard-app && npm install && npm run dev

# API Server
uvicorn src.api.main:app --reload --port 8000
```

---

## VibeMind Integration

Antoni empfängt Sprachbefehle über ElevenLabs und übersetzt sie in Tool-Calls:

| Sprachbefehl | Tool Call | Ergebnis |
|---|---|---|
| *"Build me a todo app with React"* | `generate_code()` | Startet Society of Mind Pipeline |
| *"How's the build going?"* | `get_generation_status()` | Status-Update |
| *"Show me the preview"* | `start_preview()` | VNC Stream im Dashboard |

**Agent Transfer:** Alice (Hub) → Antoni (Coding) via ElevenLabs Agent Transfer System.

---

*Teil des VibeMind Multiverse — Conversational Control Plane*
