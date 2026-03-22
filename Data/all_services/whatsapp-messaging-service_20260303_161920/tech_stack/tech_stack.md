# Technology Stack - whatsapp-messaging-service

## Overview

| Category | Technology |
|----------|------------|
| Architecture | Microservices |
| Deployment | Cloud-native |

---

## Frontend

| Component | Technology |
|-----------|------------|
| Framework | **React Native 0.74.1** |
| Languages | TypeScript 5.7.2, JavaScript 2024.1 |
| UI Library | React Native Paper 5.12.3 |
| State Management | Zustand 4.5.2 |

**Rationale:** React Native ermoeglicht Mobile-First (iOS/Android) mit hoher Wiederverwendbarkeit, nativer Performance und guter WebRTC/biometrischer SDK-Unterstuetzung.

---

## Backend

| Component | Technology |
|-----------|------------|
| Language | **Node.js 20.11.1** |
| Framework | **NestJS 10.3.2** |
| API Style | REST |

**Rationale:** NestJS bietet modulare Microservices, starke TypeScript-Typisierung, integrierte WebSocket-Unterstuetzung und gute Skalierung fuer Echtzeit-Messaging.

---

## Data Layer

| Component | Technology |
|-----------|------------|
| Primary Database | **PostgreSQL 16.2** |
| Cache | Redis 7.2.4 |
| Search Engine | Elasticsearch 8.12.2 |

**Rationale:** PostgreSQL bietet ACID-Transaktionen, starke Konsistenz fuer Chats/Profiles/Devices und DSGVO-konforme Self-Hosting-Optionen.

---

## Infrastructure

| Component | Technology |
|-----------|------------|
| Cloud Provider | **AWS 2024.02** |
| Container Runtime | Docker 25.0.3 |
| Orchestration | Kubernetes 1.29.2 |
| CI/CD | GitHub Actions 2024.02 |

---

## Integration

| Component | Technology |
|-----------|------------|
| Message Queue | Kafka 3.6.1 |
| API Gateway | Kong 3.6.0 |

---

## Alternatives Considered

### Frontend Framework
- Flutter 3.19.0
- Kotlin Multiplatform 1.9.22

### Backend Framework
- Fastify 4.26.2
- Spring Boot 3.2.3

---

## Pinned Versions

| Technology | Version | Package Name |
|------------|---------|--------------|
| AWS | `2024.02` | `` |
| Docker | `25.0.3` | `` |
| Elasticsearch | `8.12.2` | `@elastic/elasticsearch` |
| GitHub Actions | `2024.02` | `` |
| JavaScript | `2024.1` | `` |
| Kafka | `3.6.1` | `kafkajs` |
| Keycloak | `24.0.4` | `` |
| Kong | `3.6.0` | `` |
| Kubernetes | `1.29.2` | `` |
| MinIO | `2024-02-29T20-00-00Z` | `` |
| NestJS | `10.3.2` | `@nestjs/core` |
| Node.js | `20.11.1` | `` |
| OpenTelemetry | `1.23.0` | `@opentelemetry/sdk-node` |
| PostHog | `1.115.0` | `` |
| PostgreSQL | `16.2` | `pg` |
| React Native | `0.74.1` | `react-native` |
| React Native Paper | `5.12.3` | `react-native-paper` |
| Redis | `7.2.4` | `ioredis` |
| Signal Protocol (libsignal) | `0.50.0` | `libsignal-protocol` |
| Socket.IO | `4.7.5` | `socket.io` |
| TypeScript | `5.7.2` | `typescript` |
| WebAuthn | `3.2.1` | `@simplewebauthn/server` |
| Zustand | `4.5.2` | `zustand` |

---

## Architecture Diagram

See `architecture_diagram.mmd` for the C4 Context diagram.
