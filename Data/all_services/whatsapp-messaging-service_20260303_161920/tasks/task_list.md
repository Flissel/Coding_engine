# Task List - Project Tasks

## Summary

| Metric | Value |
|--------|-------|
| Total Tasks | 93 |
| Total Hours | 860h |
| Total Story Points | 549 |

---

## Critical Path

The following tasks are on the critical path:

1. `TASK-001`
2. `TASK-003`
3. `TASK-004`
4. `TASK-007`
5. `TASK-016`

---

## Tasks by Feature

### FEAT-001

| Tasks | Hours | Points |
|-------|-------|--------|
| 8 | 70h | 71 |

#### TASK-001: CI/CD Pipeline für Core Features einrichten

- **Type:** devops
- **Complexity:** complex
- **Estimated:** 8h / 8 points
- **Skills:** devops, ci/cd, security
- **Assignee:** DevOps Engineer

Aufsetzen einer CI/CD Pipeline (Build, Test, Lint, Security-Checks) für Backend und Mobile Client. Inklusive automatischer Ausführung bei Pull Requests und Merges.

**Acceptance Criteria:**
- [ ] Pipeline läuft für Backend und Client bei jedem PR
- [ ] Build-, Lint- und Unit-Test-Schritte sind integriert
- [ ] Fehlschläge blockieren Merge

---

#### TASK-002: Docker & Kubernetes Basis-Konfiguration

- **Type:** devops
- **Complexity:** complex
- **Estimated:** 8h / 8 points
- **Skills:** docker, kubernetes, devops
- **Assignee:** DevOps Engineer

Erstellen von Dockerfiles für Backend/Services und Kubernetes Manifests (Deployment/Service/Ingress) für die Auth-Services und App-Backend.

**Acceptance Criteria:**
- [ ] Docker-Images bauen erfolgreich
- [ ] K8s Manifests sind deploybar in Staging
- [ ] Health/Readiness Probes konfiguriert

**Depends on:** TASK-001

---

#### TASK-003: Backend API: Telefonnummer-Registrierung & Verifikation

- **Type:** development
- **Complexity:** complex
- **Estimated:** 8h / 8 points
- **Skills:** backend, api, security
- **Assignee:** Backend Developer

Implementierung der APIs für Telefonnummer-Registrierung, SMS-OTP Versand und Verifikation, inkl. Validierung und Rate Limiting.

**Acceptance Criteria:**
- [ ] API akzeptiert Telefonnummern und sendet OTP
- [ ] OTP-Verifikation erzeugt gültige Session/Token
- [ ] Rate Limiting und Validierung sind aktiv

**Depends on:** TASK-001

---

#### TASK-004: Backend: 2FA, Passkey & Multi-Device Session Management

- **Type:** development
- **Complexity:** complex
- **Estimated:** 12h / 13 points
- **Skills:** backend, security, webauthn
- **Assignee:** Backend Developer

Implementierung von 2FA-Mechanismen, Passkey-Unterstützung (FIDO2/WebAuthn) und Verwaltung von Multi-Device Sessions inkl. Token-Rotation.

**Acceptance Criteria:**
- [ ] 2FA lässt sich aktivieren/deaktivieren je Nutzer
- [ ] Passkey-Registrierung und -Login funktionieren
- [ ] Mehrere Geräte-Sessions werden korrekt verwaltet
- [ ] session model created with all attributes
- [ ] Migration script works forward and backward
- [ ] Unit tests for model validation

**Depends on:** TASK-003

---

#### TASK-005: Mobile UI: Registrierung, 2FA & Biometrische Entsperrung

- **Type:** development
- **Complexity:** complex
- **Estimated:** 12h / 13 points
- **Skills:** mobile, frontend, biometrics
- **Assignee:** Mobile Developer

Implementierung der UI-Flows für Telefonnummer-Registrierung, 2FA-Eingabe und biometrische Entsperrung (FaceID/TouchID) inkl. Fehler-Handling.

**Acceptance Criteria:**
- [ ] User kann Telefonnummer registrieren und OTP eingeben
- [ ] 2FA Prompt ist korrekt integriert
- [ ] Biometrische Entsperrung funktioniert auf iOS/Android

**Depends on:** TASK-003

---

#### TASK-006: Cross-Cutting: Logging, Error Handling & Validation für Auth

- **Type:** development
- **Complexity:** medium
- **Estimated:** 6h / 5 points
- **Skills:** backend, security, observability
- **Assignee:** Backend Developer

Einführung standardisierter Logging-Events, Fehlercodes und Validierungslogik für Auth-Flows, inkl. Audit-Trail für Sicherheitsereignisse.

**Acceptance Criteria:**
- [ ] Auth-bezogene Fehler liefern konsistente Codes
- [ ] Security Events werden geloggt und auditierbar
- [ ] Validierung greift für alle Auth-Endpunkte

**Depends on:** TASK-003, TASK-004

---

#### TASK-007: End-to-End Tests für Auth-Flows

- **Type:** testing
- **Complexity:** complex
- **Estimated:** 8h / 8 points
- **Skills:** qa, automation, testing
- **Assignee:** QA Engineer

Erstellung von E2E-Tests für Registrierung, 2FA, Passkey und Multi-Device Login. Tests laufen in CI und berichten automatisch.

**Acceptance Criteria:**
- [ ] Alle Hauptauth-Flows sind testautomatisiert
- [ ] Tests laufen stabil in CI
- [ ] Testberichte werden erzeugt
- [ ] E2E-Tests decken alle Auth-Flows ab
- [ ] Fehlerfälle sind in Tests abgedeckt
- [ ] Alle Auth-Flows sind durch Integrationstests abgedeckt
- [ ] Tests laufen stabil im CI
- [ ] E2E-Tests laufen stabil in CI
- [ ] Tests decken alle Auth-Flows ab
- [ ] Fehlerfälle sind reproduzierbar getestet

**Depends on:** TASK-004, TASK-005, TASK-001

---

#### TASK-008: Monitoring-Dashboard & Dokumentation (API + Runbook)

- **Type:** documentation
- **Complexity:** complex
- **Estimated:** 8h / 8 points
- **Skills:** documentation, observability, backend
- **Assignee:** Technical Writer / DevOps Engineer

Einrichten eines Monitoring-Dashboards für Auth-Services (Login-Rate, OTP-Failures, 2FA-Failures) sowie Dokumentation der Auth-APIs und Runbooks.

**Acceptance Criteria:**
- [ ] Dashboard zeigt Auth-KPIs und Alerts
- [ ] API-Dokumentation ist vollständig und versioniert
- [ ] Runbook beschreibt Incident-Prozeduren

**Depends on:** TASK-002, TASK-006

---

### FEAT-002

| Tasks | Hours | Points |
|-------|-------|--------|
| 8 | 84h | 52 |

#### TASK-009: Auth-Service Grundgeruest & Datenmodell

- **Type:** development
- **Complexity:** complex
- **Estimated:** 8h / 5 points
- **Skills:** backend, database, api-design
- **Assignee:** Backend Developer

Backend-Grundgeruest fuer den Auth-Service erstellen, Datenbankschema fuer Nutzer, Telefonnummern, Devices und Passkeys definieren und migrieren.

**Acceptance Criteria:**
- [ ] Auth-Service laeuft lokal mit Basis-Routing
- [ ] DB-Migrationen fuer User, Phone, Device, Passkey sind vorhanden
- [ ] Schema-Checks bestehen ohne Fehler

---

#### TASK-010: Telefonnummer-Registrierung + SMS-OTP

- **Type:** development
- **Complexity:** complex
- **Estimated:** 12h / 8 points
- **Skills:** backend, security, integration
- **Assignee:** Backend Developer

API-Endpunkte fuer Registrierung per Telefonnummer implementieren, OTP generieren/versenden (SMS-Provider) und Validierung inkl. Fehlerhandling integrieren.

**Acceptance Criteria:**
- [ ] Registrierungs-Endpunkt erstellt und dokumentiert
- [ ] OTP wird generiert und per SMS versendet
- [ ] Fehlerhafte/abgelaufene OTPs werden korrekt abgelehnt

**Depends on:** TASK-001

---

#### TASK-011: Zwei-Faktor-Authentifizierung (2FA) Flow

- **Type:** development
- **Complexity:** complex
- **Estimated:** 8h / 5 points
- **Skills:** backend, security, authentication
- **Assignee:** Backend Developer

2FA-Verifizierung implementieren: OTP-Validierung, Session/Token-Ausstellung und Rate-Limiting fuer fehlgeschlagene Versuche.

**Acceptance Criteria:**
- [ ] 2FA-Verifizierung erstellt und laeuft mit OTP
- [ ] Session/Token werden nach erfolgreicher Verifizierung ausgegeben
- [ ] Rate-Limiting greift bei Fehlversuchen
- [ ] OTP wird erzeugt und an den Versand-Service übergeben
- [ ] Verifikation akzeptiert gültige OTPs und lehnt ungültige ab

**Depends on:** TASK-002

---

#### TASK-012: Multi-Device & Passkey Management

- **Type:** development
- **Complexity:** complex
- **Estimated:** 12h / 8 points
- **Skills:** backend, security, webauthn
- **Assignee:** Backend Developer

Backend-Funktionen fuer Device-Registrierung, Device-Management und Passkey-Registrierung/Validierung implementieren.

**Acceptance Criteria:**
- [ ] Devices koennen registriert und verwaltet werden
- [ ] Passkeys koennen erstellt und validiert werden
- [ ] Mehrere Devices pro User werden korrekt gespeichert

**Depends on:** TASK-001, TASK-003

---

#### TASK-013: Biometrische Entsperrung im Client

- **Type:** development
- **Complexity:** complex
- **Estimated:** 12h / 8 points
- **Skills:** mobile, security, frontend
- **Assignee:** Mobile Developer

Biometrische Entsperrung (FaceID/TouchID/Android Biometrics) in der App integrieren, inkl. Fallback auf PIN/OTP.

**Acceptance Criteria:**
- [ ] Biometrische Entsperrung laesst sich aktivieren/deaktivieren
- [ ] Fallback-Mechanismus funktioniert bei fehlgeschlagener Biometrie
- [ ] UX-Flow ist konsistent auf iOS und Android
- [ ] Biometrische Entsperrung aktiviert und deaktiviert werden kann
- [ ] Tokens werden sicher im Secure Storage abgelegt

**Depends on:** TASK-003

---

#### TASK-014: End-to-End Tests fuer Auth-Flows

- **Type:** testing
- **Complexity:** complex
- **Estimated:** 8h / 5 points
- **Skills:** qa, automation, testing
- **Assignee:** QA Engineer

E2E-Tests fuer Registrierung, 2FA, Passkey und Biometrie erstellen; inklusive Multi-Device Szenarien und Fehlerszenarien.

**Acceptance Criteria:**
- [ ] E2E-Test-Suite deckt alle User Stories ab
- [ ] Tests laufen in CI erfolgreich durch
- [ ] Fehlerszenarien werden explizit getestet
- [ ] E2E-Tests laufen automatisiert in CI
- [ ] Positive und negative Szenarien abgedeckt
- [ ] Testergebnisse werden in Pipeline reported

**Depends on:** TASK-002, TASK-003, TASK-004, TASK-005

---

#### TASK-015: CI/CD, Docker & Monitoring Setup

- **Type:** devops
- **Complexity:** complex
- **Estimated:** 16h / 8 points
- **Skills:** devops, ci-cd, kubernetes, monitoring
- **Assignee:** DevOps Engineer

CI/CD Pipeline fuer Auth-Service einrichten, Docker-Image erstellen, Kubernetes-Deployment konfigurieren und Monitoring-Dashboards (Login/OTP Error Rates) aufsetzen.

**Acceptance Criteria:**
- [ ] Pipeline baut, testet und deployed automatisch
- [ ] Docker-Image ist versioniert und laeuft in K8s
- [ ] Monitoring-Dashboards zeigen Auth-KPIs
- [ ] CI/CD Pipeline baut, testet und deployed den Auth-Service
- [ ] Docker- und K8s-Konfigurationen sind versioniert
- [ ] Monitoring-Dashboard und Alerts sind eingerichtet
- [ ] CI/CD Pipeline baut, testet und deployed Auth-Service
- [ ] Monitoring-Dashboard zeigt Health- und Error-Metriken
- [ ] CI/CD Pipeline baut und deployt Auth-Service automatisch
- [ ] Docker-Image kann lokal gebaut und gestartet werden
- [ ] Kubernetes-Manifesten sind im Repo und validiert
- [ ] Monitoring-Dashboards zeigen Request-Rate, Errors, Latenz
- [ ] Build/Deploy Pipeline laeuft automatisiert
- [ ] Docker-Image und K8s Manifeste vorhanden
- [ ] Monitoring Dashboard fuer Auth-Metriken ist eingerichtet
- [ ] Services sind ueber Kubernetes deploybar
- [ ] Monitoring-Dashboards zeigen Verfuegbarkeit und Fehlerquoten
- [ ] Docker-Images bauen und lokal starten
- [ ] Kubernetes Manifeste sind validiert und deploybar
- [ ] Monitoring-Dashboards zeigen zentrale Metriken (Auth-Fehler, Login-Latenz)
- [ ] CI/CD Pipeline baut und deployt automatisiert
- [ ] Docker-Images werden versioniert erzeugt
- [ ] Kubernetes-Manifeste sind vorhanden und funktionsfähig
- [ ] Monitoring-Dashboards zeigen relevante Metriken

**Depends on:** TASK-001

---

#### TASK-016: Dokumentation: API, ADR & Runbooks

- **Type:** documentation
- **Complexity:** medium
- **Estimated:** 8h / 5 points
- **Skills:** documentation, api-design, operations
- **Assignee:** Technical Writer

API-Dokumentation fuer Auth-Endpunkte erstellen, Architecture Decision Records fuer Auth-Design dokumentieren und Runbook fuer Betrieb/Incident Response schreiben.

**Acceptance Criteria:**
- [ ] API-Docs sind vollstaendig und versioniert
- [ ] ADRs beschreiben Entscheidungen zu 2FA/Passkeys
- [ ] Runbook deckt Deployment und Incident-Handling ab
- [ ] API-Dokumentation ist vollständig und versioniert
- [ ] ADR beschreibt zentrale Auth-Entscheidungen
- [ ] Runbook enthält Deploy- und Incident-Prozesse
- [ ] ADR beschreibt Auth-Strategie und Passkey-Entscheidung
- [ ] Runbooks enthalten Monitoring- und Incident-Handling

**Depends on:** TASK-002, TASK-003, TASK-004, TASK-007

---

### FEAT-003

| Tasks | Hours | Points |
|-------|-------|--------|
| 6 | 54h | 32 |

#### TASK-017: Auth-Logging, Validierung & Error-Handling Basis

- **Type:** development
- **Complexity:** medium
- **Estimated:** 6h / 3 points
- **Skills:** backend, security, logging
- **Assignee:** Backend Developer

Implementiere zentrale Logging-, Validierungs- und Fehlerbehandlungskomponenten für alle Auth-Flows (Telefonnummer, 2FA, Biometrie, Passkeys). Einheitliche Error-Codes, strukturierte Logs und Security-Audits vorbereiten.

**Acceptance Criteria:**
- [ ] Zentrale Error-Codes und Validierungsregeln sind implementiert
- [ ] Strukturierte Logs für Auth-Ereignisse vorhanden
- [ ] Security-Audit-Events werden erzeugt

---

#### TASK-018: Telefonnummer-Registrierung implementieren

- **Type:** development
- **Complexity:** complex
- **Estimated:** 12h / 8 points
- **Skills:** backend, frontend, sms-api
- **Assignee:** Fullstack Developer

Implementiere Backend-Endpunkte und Frontend-Flow für die Registrierung per Telefonnummer inklusive SMS-Verifizierung (OTP).

**Acceptance Criteria:**
- [ ] OTP wird via SMS versendet und geprüft
- [ ] Telefonnummern-Registrierung ist im UI vollständig nutzbar
- [ ] Fehlermeldungen sind konsistent und lokalisiert
- [ ] API akzeptiert nur valide Telefonnummernformate
- [ ] Registrierung speichert Datensätze korrekt in der DB
- [ ] Fehlerfälle liefern konsistente Fehlermeldungen

**Depends on:** TASK-001

---

#### TASK-019: Zwei-Faktor-Authentifizierung (2FA) integrieren

- **Type:** development
- **Complexity:** complex
- **Estimated:** 10h / 5 points
- **Skills:** backend, frontend, security
- **Assignee:** Fullstack Developer

Implementiere 2FA per TOTP/SMS als zusätzlicher Auth-Schritt nach Passwort/Passkey-Anmeldung. Backend-Logik und UI-Schritte hinzufügen.

**Acceptance Criteria:**
- [ ] 2FA ist optional aktivierbar und erfordert OTP beim Login
- [ ] Backup-Codes oder Recovery-Flow dokumentiert
- [ ] Audit-Log enthält 2FA-Events
- [ ] OTP kann generiert und per SMS versendet werden
- [ ] Verifizierung invalidiert OTPs nach Nutzung oder Ablauf
- [ ] Rate-Limiting verhindert Missbrauch

**Depends on:** TASK-002

---

#### TASK-020: Biometrische Entsperrung clientseitig integrieren

- **Type:** development
- **Complexity:** medium
- **Estimated:** 8h / 5 points
- **Skills:** mobile, security
- **Assignee:** Mobile Developer

Implementiere die clientseitige Biometrie-Entsperrung (FaceID/TouchID/Android BiometricPrompt) inklusive Fallback-Flow.

**Acceptance Criteria:**
- [ ] Biometrische Entsperrung funktioniert auf iOS und Android
- [ ] Fallback auf PIN/Passcode ist vorhanden
- [ ] Fehlerfälle werden sauber abgefangen

**Depends on:** TASK-002

---

#### TASK-021: Passkey-Unterstützung & Multi-Device Sessions

- **Type:** development
- **Complexity:** complex
- **Estimated:** 12h / 8 points
- **Skills:** backend, security, webauthn
- **Assignee:** Backend Developer

Implementiere Passkey-Login (WebAuthn) sowie die Verwaltung mehrerer Geräte pro Benutzer inkl. Session-Revocation.

**Acceptance Criteria:**
- [ ] Passkey-Registrierung und Login funktionieren
- [ ] Mehrere Geräte können verwaltet und revoked werden
- [ ] Session-Management ist auditierbar

**Depends on:** TASK-001

---

#### TASK-024: Dokumentation: API Docs, ADRs & Runbooks

- **Type:** documentation
- **Complexity:** medium
- **Estimated:** 6h / 3 points
- **Skills:** documentation, api-design
- **Assignee:** Technical Writer

Erstelle API-Dokumentation für Auth-Endpunkte, dokumentiere Architekturentscheidungen (ADRs) und erstelle Runbooks für Betrieb & Incident-Handling.

**Acceptance Criteria:**
- [ ] API-Dokumentation ist vollständig und versioniert
- [ ] ADR(s) sind erstellt und referenziert
- [ ] Runbooks für Auth-Ausfälle vorhanden
- [ ] API-Dokumentation ist vollständig und aktuell
- [ ] ADRs dokumentieren zentrale Architekturentscheidungen
- [ ] Runbooks enthalten Deploy- und Incident-Prozesse

**Depends on:** TASK-002, TASK-003, TASK-004, TASK-005, TASK-007

---

### FEAT-004

| Tasks | Hours | Points |
|-------|-------|--------|
| 4 | 32h | 23 |

#### TASK-025: Gemeinsame Auth-Datenmodelle & Middleware

- **Type:** development
- **Complexity:** medium
- **Estimated:** 8h / 5 points
- **Skills:** backend, database, security
- **Assignee:** Backend Developer

Definiere Datenmodelle für Telefonnummern, Geräte, Passkeys und Sessions. Implementiere zentrale Validierung, Logging und Error-Handling Middleware für Auth-bezogene Endpunkte.

**Acceptance Criteria:**
- [ ] Datenmodelle für Telefonnummer, Gerät, Passkey und Session sind erstellt
- [ ] Validierungs-, Logging- und Error-Handling Middleware ist integriert und dokumentiert

---

#### TASK-026: Telefonnummer-Registrierung API

- **Type:** development
- **Complexity:** medium
- **Estimated:** 6h / 5 points
- **Skills:** backend, database
- **Assignee:** Backend Developer

Implementiere den Backend-Endpunkt für Telefonnummer-Registrierung inkl. Persistenz und Validierung (REQ: WA-AUTH-001).

**Acceptance Criteria:**
- [ ] API-Endpunkt registriert Telefonnummern und speichert sie in der DB
- [ ] Fehlerfälle (Duplikate, invalides Format) werden korrekt behandelt

**Depends on:** TASK-001

---

#### TASK-028: Biometrische Entsperrung & Passkey-Support

- **Type:** development
- **Complexity:** complex
- **Estimated:** 10h / 8 points
- **Skills:** backend, security
- **Assignee:** Backend Developer

Implementiere Passkey- und biometrische Entsperrung inkl. Registrierung und Verifikation (REQ: WA-AUTH-003, WA-AUTH-005).

**Acceptance Criteria:**
- [ ] Passkey-Registrierung und -Verifikation funktionieren gemäß Spezifikation
- [ ] Biometrische Entsperrung ist über das Passkey-Backend angebunden

**Depends on:** TASK-001

---

#### TASK-029: Multi-Device Support für Sessions

- **Type:** development
- **Complexity:** medium
- **Estimated:** 8h / 5 points
- **Skills:** backend, database, security
- **Assignee:** Backend Developer

Implementiere Geräteverwaltung und Multi-Device Session-Handling (REQ: WA-AUTH-004).

**Acceptance Criteria:**
- [ ] Mehrere Geräte pro Nutzer können registriert werden
- [ ] Session-Tokens sind gerätespezifisch nachvollziehbar

**Depends on:** TASK-001

---

### FEAT-005

| Tasks | Hours | Points |
|-------|-------|--------|
| 6 | 56h | 24 |

#### TASK-033: Auth-Datenmodell & Service-Skeleton

- **Type:** development
- **Complexity:** medium
- **Estimated:** 6h / 3 points
- **Skills:** backend, database, sql
- **Assignee:** Backend Developer

Erstelle das Datenbank-Schema für User, Telefonnummern, 2FA-Settings, Geräte-Registry und Session-Token. Lege Basisstruktur des Auth-Services inkl. Migrations an.

**Acceptance Criteria:**
- [ ] DB-Schema mit User-, Device- und Auth-Tabellen ist angelegt
- [ ] Migrations laufen ohne Fehler in lokaler Umgebung
- [ ] Service-Skeleton baut erfolgreich

---

#### TASK-035: Telefonnummer-Registrierung & OTP-API

- **Type:** development
- **Complexity:** medium
- **Estimated:** 8h / 3 points
- **Skills:** backend, api, security
- **Assignee:** Backend Developer

Implementiere API-Endpunkte für Telefonnummer-Registrierung, Versand/Verifikation von OTP (SMS Provider Mock/Integration) inkl. Validierung und Fehlerbehandlung.

**Acceptance Criteria:**
- [ ] POST /register und /verify-otp funktionieren gemäß WA-AUTH-001
- [ ] Fehlerfälle (ungültige Nummer, falsches OTP) sind abgedeckt
- [ ] Audit-Logging für OTP-Versand vorhanden

**Depends on:** TASK-001

---

#### TASK-036: 2FA-Setup/Verifikation & Multi-Device Token-Management

- **Type:** development
- **Complexity:** complex
- **Estimated:** 12h / 5 points
- **Skills:** backend, security, api
- **Assignee:** Backend Developer

Implementiere Backend für 2FA (z.B. TOTP/SMS), Aktivierung/Deaktivierung, sowie Multi-Device Support inkl. Device-Registrierung und Token-Revocation.

**Acceptance Criteria:**
- [ ] 2FA-Setup und Verifikation entsprechen WA-AUTH-002
- [ ] Geräte können registriert und getrennt werden (WA-AUTH-004)
- [ ] Token-Revocation invalidiert Sessions zuverlässig

**Depends on:** TASK-001, TASK-003

---

#### TASK-037: Frontend-Flow für Registrierung & 2FA

- **Type:** development
- **Complexity:** complex
- **Estimated:** 12h / 5 points
- **Skills:** frontend, typescript, ux
- **Assignee:** Frontend Developer

Implementiere UI-Screens für Telefonnummer-Registrierung, OTP-Verifikation sowie 2FA-Aktivierung/Verifikation inkl. Fehler- und Loading-States.

**Acceptance Criteria:**
- [ ] Registrierungs- und OTP-Flow sind UX-konform bedienbar
- [ ] 2FA-Setup ist im UI vollständig integrierbar
- [ ] Fehlerfälle werden verständlich angezeigt

**Depends on:** TASK-003, TASK-004

---

#### TASK-038: Biometrische Entsperrung & Passkey-Integration

- **Type:** development
- **Complexity:** complex
- **Estimated:** 10h / 5 points
- **Skills:** mobile, security, webauthn
- **Assignee:** Mobile Developer

Integriere Biometrie/Passkey (z.B. WebAuthn/OS-Passkeys) in den Client inkl. Fallback und sichere Gerätebindung.

**Acceptance Criteria:**
- [ ] Biometrische Entsperrung funktioniert gemäß WA-AUTH-003
- [ ] Passkey-Login ist implementiert (WA-AUTH-005)
- [ ] Fallback auf regulären Login bei fehlender Biometrie

**Depends on:** TASK-004

---

#### TASK-039: Integration- & Sicherheitstests für Auth-Flows

- **Type:** testing
- **Complexity:** medium
- **Estimated:** 8h / 3 points
- **Skills:** qa, security, testing
- **Assignee:** QA Engineer

Erstelle End-to-End-Tests für Registrierung, 2FA, Multi-Device und Biometrie-Pfade inkl. Negativ-Tests und Security-Checks.

**Acceptance Criteria:**
- [ ] E2E-Tests decken alle Auth-User-Stories ab
- [ ] Negativ- und Abuse-Cases sind getestet
- [ ] Tests laufen stabil in der CI

**Depends on:** TASK-003, TASK-004, TASK-005, TASK-006

---

### FEAT-006

| Tasks | Hours | Points |
|-------|-------|--------|
| 5 | 42h | 26 |

#### TASK-041: Auth-Datenbankschema erweitern

- **Type:** development
- **Complexity:** complex
- **Estimated:** 8h / 5 points
- **Skills:** backend, database, sql
- **Assignee:** Backend Developer

Erweitere das Auth-Datenbankschema um Tabellen/Felder für Telefonnummern, Geräte, Passkeys und biometrische Tokens. Lege Indizes und Constraints für Eindeutigkeit und Validierung an.

**Acceptance Criteria:**
- [ ] Migrationen lassen sich fehlerfrei ausführen und zurückrollen
- [ ] Schema unterstützt Telefonnummern, Geräte, Passkeys und Biometrie-Tokens
- [ ] Eindeutigkeit und referenzielle Integrität sind gewährleistet

---

#### TASK-044: Multi-Device Support umsetzen

- **Type:** development
- **Complexity:** complex
- **Estimated:** 8h / 5 points
- **Skills:** backend, api-design
- **Assignee:** Backend Developer

Implementiere Geräte-Registrierung, Geräte-Listing und Geräte-Revocation. Verknüpfe Geräte mit Benutzerkonten und speichere Metadaten (Device ID, Plattform).

**Acceptance Criteria:**
- [ ] Geräte können registriert und aufgelistet werden
- [ ] Geräte-Revocation widerruft Zugriff sofort
- [ ] API liefert konsistente Geräte-Metadaten

**Depends on:** TASK-001

---

#### TASK-045: Biometrische Entsperrung & Passkey-Unterstützung

- **Type:** development
- **Complexity:** complex
- **Estimated:** 12h / 8 points
- **Skills:** backend, frontend, security
- **Assignee:** Fullstack Developer

Implementiere Backend-Logik für Passkey/biometrische Token-Registrierung und -Validierung. Ergänze Client-Integration für Registrierung und Login mit Passkeys/Biometrie.

**Acceptance Criteria:**
- [ ] Passkeys/biometrische Tokens können registriert werden
- [ ] Login mit Passkey/Biometrie funktioniert end-to-end
- [ ] Fehlerfälle werden sauber behandelt

**Depends on:** TASK-001

---

#### TASK-047: CI/CD, Docker & K8s für Auth-Service

- **Type:** devops
- **Complexity:** complex
- **Estimated:** 8h / 5 points
- **Skills:** devops, ci-cd, kubernetes, monitoring
- **Assignee:** DevOps Engineer

Erweitere die CI/CD-Pipeline, Dockerfiles und Kubernetes-Manifeste für den Auth-Service. Füge Monitoring-Dashboards für Auth-Metriken hinzu.

**Acceptance Criteria:**
- [ ] CI/CD baut und deployt den Auth-Service zuverlässig
- [ ] Docker/K8s-Configs sind validiert und versioniert
- [ ] Monitoring-Dashboard zeigt Auth-Fehler und Latenzen

**Depends on:** TASK-001

---

#### TASK-048: API-Dokumentation & Runbook erstellen

- **Type:** documentation
- **Complexity:** medium
- **Estimated:** 6h / 3 points
- **Skills:** documentation, api-design
- **Assignee:** Technical Writer

Dokumentiere Auth-APIs (Telefonnummer, 2FA, Passkey/Biometrie, Geräte). Erstelle Runbook für Betrieb und ein ADR zu Passkey-Integration.

**Acceptance Criteria:**
- [ ] API-Dokumentation ist vollständig und versioniert
- [ ] Runbook enthält Troubleshooting und Rollback-Schritte
- [ ] ADR zur Passkey-Integration ist abgelegt

**Depends on:** TASK-002, TASK-003, TASK-004, TASK-005

---

### FEAT-007

| Tasks | Hours | Points |
|-------|-------|--------|
| 7 | 52h | 22 |

#### TASK-049: Performance-Budgets und NFR-Ziele definieren

- **Type:** documentation
- **Complexity:** simple
- **Estimated:** 4h / 2 points
- **Skills:** architecture, performance-engineering
- **Assignee:** Solution Architect

NFR-029 und NFR-050 konkretisieren (z.B. Antwortzeit, Durchsatz, Ressourcenverbrauch) und messbare Performance-Budgets für Registrierung, 2FA und Biometrie festlegen.

**Acceptance Criteria:**
- [ ] Performance-Ziele sind dokumentiert und abgestimmt
- [ ] Budgets pro Auth-Flow (US-001/002/003) sind definiert

---

#### TASK-050: Backend-Optimierung kritischer Auth-Endpunkte

- **Type:** development
- **Complexity:** complex
- **Estimated:** 12h / 5 points
- **Skills:** backend, performance-optimization, database
- **Assignee:** Backend Developer

Profiling der Auth-Endpunkte (Telefonnummer-Registrierung, 2FA, Passkey, Multi-Device) durchführen und Engpässe beheben (DB-Queries, Caching, Parallelisierung).

**Acceptance Criteria:**
- [ ] Latenz der Auth-API-Endpunkte entspricht den Budgets
- [ ] Kein offensichtlicher Hotspot im Profiling vorhanden

**Depends on:** TASK-001

---

#### TASK-051: Frontend-Performance für Auth-Flows verbessern

- **Type:** development
- **Complexity:** medium
- **Estimated:** 8h / 3 points
- **Skills:** frontend, performance-optimization
- **Assignee:** Frontend Developer

Optimierung der UI-Performance für Registrierung, 2FA und Biometrie (Lazy Loading, minimierte Re-Renders, effiziente Animationen).

**Acceptance Criteria:**
- [ ] Time-to-Interactive und Renderzeiten liegen innerhalb der Budgets
- [ ] Keine spürbaren UI-Lags in Auth-Flows

**Depends on:** TASK-001

---

#### TASK-052: Load- und Performance-Testscripts erstellen

- **Type:** testing
- **Complexity:** medium
- **Estimated:** 8h / 3 points
- **Skills:** testing, performance-engineering
- **Assignee:** QA Engineer

Lasttest-Szenarien für Registrierung, 2FA, Biometrie und Multi-Device konfigurieren (z.B. k6/JMeter) basierend auf NFR-Zielen.

**Acceptance Criteria:**
- [ ] Lasttest-Skripte decken alle Auth-Flows ab
- [ ] Skripte sind in der CI/CD ausführbar

**Depends on:** TASK-001

---

#### TASK-053: Performance-Tests in CI/CD integrieren

- **Type:** devops
- **Complexity:** medium
- **Estimated:** 6h / 3 points
- **Skills:** devops, ci-cd, performance-testing
- **Assignee:** DevOps Engineer

Load-Tests in die CI/CD-Pipeline integrieren, Schwellenwerte definieren und Fail-Conditions bei Budgetüberschreitung konfigurieren.

**Acceptance Criteria:**
- [ ] CI/CD führt Performance-Tests automatisiert aus
- [ ] Pipeline schlägt bei Budgetverletzung fehl

**Depends on:** TASK-004

---

#### TASK-054: Monitoring-Dashboard für Auth-Performance einrichten

- **Type:** devops
- **Complexity:** medium
- **Estimated:** 8h / 3 points
- **Skills:** devops, monitoring
- **Assignee:** DevOps Engineer

Dashboards (z.B. Grafana/DataDog) für Latenz, Fehlerquoten und Durchsatz der Auth-Services konfigurieren und Alarme definieren.

**Acceptance Criteria:**
- [ ] Dashboard zeigt KPIs für alle Auth-Flows
- [ ] Alerts für NFR-Verletzungen sind aktiv

**Depends on:** TASK-002, TASK-003

---

#### TASK-055: Performance-Runbook und Ergebnisbericht erstellen

- **Type:** documentation
- **Complexity:** medium
- **Estimated:** 6h / 3 points
- **Skills:** documentation, performance-engineering
- **Assignee:** Technical Writer

Dokumentation der Performance-Tests, Ergebnisse, getroffener Optimierungen und Betriebs-Runbook für Monitoring/Incident-Handling.

**Acceptance Criteria:**
- [ ] Performance-Report ist vollständig und verständlich
- [ ] Runbook enthält klare Schritte für Incident-Handling

**Depends on:** TASK-005, TASK-006

---

### EPIC-001

| Tasks | Hours | Points |
|-------|-------|--------|
| 6 | 52h | 32 |

#### TASK-056: Auth-Service Grundsetup und Datenbankschema

- **Type:** development
- **Complexity:** medium
- **Estimated:** 8h / 5 points
- **Skills:** backend, database, security
- **Assignee:** Backend Developer

Initiales Backend-Setup fuer den Auth-Service inklusive Datenbankschema fuer Nutzer, Telefonnummern, 2FA-Methoden, Passkeys und registrierte Devices (Multi-Device Support).

**Acceptance Criteria:**
- [ ] DB-Tabellen/Collections fuer Users, PhoneVerification, MFA, Passkeys, Devices sind angelegt
- [ ] Service-Scaffold mit Konfig, Secrets-Handling und Basisrouten vorhanden

---

#### TASK-057: Cross-Cutting Auth Middleware (Logging/Validation/Error Handling)

- **Type:** development
- **Complexity:** medium
- **Estimated:** 6h / 3 points
- **Skills:** backend, security
- **Assignee:** Backend Developer

Implementierung zentraler Middleware fuer Request-Validierung, konsistentes Error Handling und Security Logging fuer alle Auth-Endpunkte.

**Acceptance Criteria:**
- [ ] Alle Auth-Endpoints nutzen gemeinsame Validation- und Error-Response-Struktur
- [ ] Security-relevante Events (Login, MFA, Passkey) werden geloggt

**Depends on:** TASK-001

---

#### TASK-058: Telefon-Registrierung und 2FA API

- **Type:** development
- **Complexity:** complex
- **Estimated:** 12h / 8 points
- **Skills:** backend, security, api
- **Assignee:** Backend Developer

Implementierung der Endpunkte fuer Telefonnummer-Registrierung inkl. SMS-Verifikation sowie 2FA-Enrollment, -Verifizierung und Recovery-Flow (SMS/TOTP).

**Acceptance Criteria:**
- [ ] SMS-Verification fuer Telefonnummer-Registrierung ist implementiert und getestet
- [ ] 2FA kann aktiviert, verifiziert und deaktiviert werden
- [ ] Recovery-Mechanismus ist verfuegbar

**Depends on:** TASK-001, TASK-002

---

#### TASK-059: Passkey/WebAuthn und Multi-Device Support

- **Type:** development
- **Complexity:** complex
- **Estimated:** 12h / 8 points
- **Skills:** backend, security, webauthn
- **Assignee:** Backend Developer

Implementierung der Passkey (WebAuthn) Registrierung und Anmeldung inklusive Verwaltung mehrerer Devices pro Nutzer.

**Acceptance Criteria:**
- [ ] Passkey Registrierung und Login ueber WebAuthn funktionieren
- [ ] Mehrere Devices koennen je Nutzer verwaltet werden (Add/Remove/List)

**Depends on:** TASK-001, TASK-002

---

#### TASK-061: E2E Tests fuer Auth-Flows

- **Type:** testing
- **Complexity:** medium
- **Estimated:** 8h / 5 points
- **Skills:** testing, qa, automation
- **Assignee:** QA Engineer

Erstellung von End-to-End Tests fuer Registrierung, 2FA, Passkey-Login, Biometrie und Multi-Device Szenarien.

**Acceptance Criteria:**
- [ ] E2E Test-Suite deckt alle Auth-Flows ab
- [ ] Tests laufen stabil in CI

**Depends on:** TASK-003, TASK-004, TASK-005

---

#### TASK-063: Dokumentation: API Docs, ADR und Runbook

- **Type:** documentation
- **Complexity:** medium
- **Estimated:** 6h / 3 points
- **Skills:** documentation, api, operations
- **Assignee:** Technical Writer

Erstellung von API-Dokumentation (OpenAPI), ADR fuer Auth-Entscheidungen und Runbook fuer Betrieb/Incident-Handling.

**Acceptance Criteria:**
- [ ] OpenAPI Spec beschreibt alle Auth-Endpunkte
- [ ] ADR und Runbook sind im Repository abgelegt
- [ ] API-Dokumentation aktualisiert und versioniert
- [ ] ADR beschreibt Auth-Entscheidungen (2FA, Passkey, Biometrie)
- [ ] Runbook fuer Betrieb und Support vorhanden

**Depends on:** TASK-003, TASK-004, TASK-005, TASK-007

---

### EPIC-002

| Tasks | Hours | Points |
|-------|-------|--------|
| 8 | 94h | 53 |

#### TASK-064: Auth-Backend: Telefonnummer, 2FA, Passkey & Multi-Device

- **Type:** development
- **Complexity:** complex
- **Estimated:** 12h / 8 points
- **Skills:** backend, authentication, api-design
- **Assignee:** Backend Developer

Implementiere Backend-Endpunkte und Logik für Telefonnummer-Registrierung, 2FA (TOTP/SMS), Passkey-Unterstützung sowie Multi-Device-Token-Management inkl. Validierung und Fehlerbehandlung.

**Acceptance Criteria:**
- [ ] API-Endpunkte für Registrierung, 2FA-Setup/Verify und Passkeys sind implementiert
- [ ] Multi-Device-Sessions werden korrekt verwaltet und invalidiert
- [ ] Fehlerfälle liefern konsistente Response-Codes

---

#### TASK-065: Client-Auth-Flows inkl. Biometrie & Passkey

- **Type:** development
- **Complexity:** complex
- **Estimated:** 16h / 8 points
- **Skills:** frontend, mobile, security
- **Assignee:** Mobile Developer

Implementiere im Client die UI-Flows für Registrierung per Telefonnummer, 2FA-Eingabe, Passkey-Login sowie biometrische Entsperrung mit Fallback.

**Acceptance Criteria:**
- [ ] Registrierung und Login funktionieren mit 2FA-Endpunkten
- [ ] Biometrische Entsperrung ist optional und sicher implementiert
- [ ] Passkey-Login wird unterstützt und dokumentiert

**Depends on:** TASK-001

---

#### TASK-066: Profil & Kontaktabgleich (Backend + UI)

- **Type:** development
- **Complexity:** complex
- **Estimated:** 16h / 8 points
- **Skills:** backend, frontend, privacy
- **Assignee:** Fullstack Developer

Implementiere Profilverwaltung (CRUD) und Kontaktabgleich inkl. Upload/Hashing und Matching, plus UI zur Anzeige und Verwaltung.

**Acceptance Criteria:**
- [ ] Profile können erstellt, aktualisiert und angezeigt werden
- [ ] Kontaktabgleich liefert nur gematchte Nutzer zurück
- [ ] UI zeigt Profil- und Kontaktinformationen korrekt an

**Depends on:** TASK-001

---

#### TASK-067: Such-Backend: Indexierung & Query für Chats/Medien

- **Type:** development
- **Complexity:** complex
- **Estimated:** 16h / 8 points
- **Skills:** backend, search, database
- **Assignee:** Backend Developer

Implementiere Such-Backend mit Indexierung von Chats, Nachrichten und Medien sowie Query-API für schnelle Volltextsuche.

**Acceptance Criteria:**
- [ ] Indexierungs-Job erfasst neue Chats/Nachrichten/Medien
- [ ] Such-API liefert relevante Ergebnisse mit Pagination
- [ ] Antwortzeiten für Standardqueries < 500ms im Test

**Depends on:** TASK-001

---

#### TASK-068: Such-UI: Ergebnisse & Filter

- **Type:** development
- **Complexity:** medium
- **Estimated:** 8h / 5 points
- **Skills:** frontend, ux
- **Assignee:** Frontend Developer

Implementiere UI für Suche mit Ergebnisliste, Filter (Chat/Message/Media) und Highlighting.

**Acceptance Criteria:**
- [ ] Suchfeld mit Debounce und Filter-Optionen ist vorhanden
- [ ] Ergebnisse werden korrekt nach Typ gruppiert oder gefiltert
- [ ] UI reagiert flüssig und zeigt Lade-/Fehlerzustände

**Depends on:** TASK-004

---

#### TASK-069: Integrationstests Auth, Profile, Kontakte & Suche

- **Type:** testing
- **Complexity:** medium
- **Estimated:** 8h / 5 points
- **Skills:** qa, automation, testing
- **Assignee:** QA Engineer

Erstelle E2E-Tests für Registrierung, 2FA, Biometrie, Profil- und Kontaktabgleich sowie Suche.

**Acceptance Criteria:**
- [ ] Mindestens 8 E2E-Szenarien sind automatisiert
- [ ] Tests laufen stabil in CI
- [ ] Fehlerreports sind nachvollziehbar

**Depends on:** TASK-002, TASK-003, TASK-004, TASK-005

---

#### TASK-070: DevOps: CI/CD & Deployment für Auth/Search

- **Type:** devops
- **Complexity:** complex
- **Estimated:** 12h / 8 points
- **Skills:** devops, kubernetes, ci-cd
- **Assignee:** DevOps Engineer

Erweitere CI/CD für neue Services, baue Container-Images und K8s-Manifeste, setze Basis-Monitoring (Logs/Metriken) auf.

**Acceptance Criteria:**
- [ ] CI/CD baut und deployed Auth- und Search-Services
- [ ] K8s-Manifeste sind versioniert und getestet
- [ ] Basis-Monitoring für Latenz und Fehlerquote ist vorhanden

**Depends on:** TASK-001, TASK-004

---

#### TASK-071: Dokumentation: API Docs & Runbooks

- **Type:** documentation
- **Complexity:** simple
- **Estimated:** 6h / 3 points
- **Skills:** technical-writing, api-documentation
- **Assignee:** Technical Writer

Erstelle API-Dokumentation für Auth/Profile/Search sowie Runbooks für Deployment, Recovery und Monitoring.

**Acceptance Criteria:**
- [ ] OpenAPI/Markdown-Dokumentation ist aktuell und versioniert
- [ ] Runbooks für Deployment und Incident Response existieren
- [ ] Docs sind für Team zugänglich und überprüft

**Depends on:** TASK-006, TASK-007

---

### EPIC-003

| Tasks | Hours | Points |
|-------|-------|--------|
| 7 | 58h | 47 |

#### TASK-072: UX/UI-Design fuer Einstellungen, Barrierefreiheit und Lokalisierung

- **Type:** design
- **Complexity:** medium
- **Estimated:** 6h / 5 points
- **Skills:** ux, ui, accessibility
- **Assignee:** UX/UI Designer

Erstelle Wireframes und Design-Spezifikationen fuer den Einstellungsbereich inklusive Datenschutz, App-Einstellungen sowie Barrierefreiheits- und Sprachoptionen. Definiere Design-Guidelines fuer Screenreader, Kontrast und Schriftgroessen.

**Acceptance Criteria:**
- [ ] Wireframes fuer alle Einstellungsbereiche liegen vor
- [ ] Design-Guidelines fuer Barrierefreiheit und Lokalisierung sind dokumentiert

---

#### TASK-073: Backend-Modelle und API fuer Einstellungen

- **Type:** development
- **Complexity:** complex
- **Estimated:** 8h / 8 points
- **Skills:** backend, api, security
- **Assignee:** Backend Developer

Implementiere Datenmodelle und API-Endpunkte fuer Datenschutz-, App- und Sicherheits-Einstellungen inkl. Validierung und Fehlerbehandlung.

**Acceptance Criteria:**
- [ ] API-Endpunkte fuer Lesen/Schreiben der Einstellungen sind implementiert
- [ ] Eingaben werden validiert und Fehler sauber zurueckgegeben

**Depends on:** TASK-001

---

#### TASK-074: Einstellungen-UI mit Lokalisierung implementieren

- **Type:** development
- **Complexity:** complex
- **Estimated:** 12h / 8 points
- **Skills:** frontend, mobile, i18n
- **Assignee:** Frontend Developer

Baue den Einstellungsbildschirm inkl. Datenschutz- und App-Optionen. Integriere das Lokalisierungs-Framework und stelle Sprachwechsel zur Laufzeit sicher.

**Acceptance Criteria:**
- [ ] UI entspricht den Designs und zeigt alle Einstellungen korrekt an
- [ ] Sprachwechsel wirkt sich sofort auf alle Texte im Einstellungsbereich aus

**Depends on:** TASK-001, TASK-002

---

#### TASK-075: Integration der Sicherheits- und Authentifizierungs-Einstellungen

- **Type:** development
- **Complexity:** complex
- **Estimated:** 12h / 8 points
- **Skills:** frontend, backend, auth
- **Assignee:** Fullstack Developer

Integriere Einstellungen fuer Telefonnummer-Registrierung, 2FA, biometrische Entsperrung, Passkeys und Multi-Device-Support in die UI und verbinde sie mit den Backend-Services.

**Acceptance Criteria:**
- [ ] Sicherheitsoptionen sind in den Einstellungen sichtbar und funktionsfaehig
- [ ] Aenderungen werden korrekt im Backend persistiert und wirksam

**Depends on:** TASK-002, TASK-003

---

#### TASK-076: Barrierefreiheit-Optimierung und Audit

- **Type:** testing
- **Complexity:** medium
- **Estimated:** 6h / 5 points
- **Skills:** qa, accessibility, mobile
- **Assignee:** QA Engineer

Fuehre Accessibility-Checks durch (Screenreader, Kontrast, Schriftgroessen) und behebe gefundene Probleme im Einstellungsbereich.

**Acceptance Criteria:**
- [ ] Accessibility-Checklist ist abgearbeitet und dokumentiert
- [ ] Alle gefundenen Issues sind behoben oder als bekannte Risiken dokumentiert

**Depends on:** TASK-003

---

#### TASK-077: CI/CD Pipeline und Docker Setup

- **Type:** devops
- **Complexity:** complex
- **Estimated:** 8h / 8 points
- **Skills:** devops, ci_cd, docker
- **Assignee:** DevOps Engineer

Richte Build-, Test- und Deploy-Pipelines ein und erstelle Docker-Images fuer Backend-Services.

**Acceptance Criteria:**
- [ ] CI/CD Pipeline baut und testet automatisch
- [ ] Docker-Images sind versioniert und im Registry verfuegbar

---

#### TASK-079: Dokumentation: API, ADR und Runbook

- **Type:** documentation
- **Complexity:** medium
- **Estimated:** 6h / 5 points
- **Skills:** technical_writing, api, architecture
- **Assignee:** Technical Writer

Erstelle API-Dokumentation fuer Einstellungs-Endpunkte, dokumentiere Architekturentscheidungen (ADR) und verfasse ein Runbook fuer Betrieb/Support.

**Acceptance Criteria:**
- [ ] API-Dokumentation ist vollstaendig und versioniert
- [ ] ADR und Runbook sind im Repo abgelegt und referenzierbar

**Depends on:** TASK-002, TASK-004, TASK-007

---

### EPIC-004

| Tasks | Hours | Points |
|-------|-------|--------|
| 8 | 86h | 53 |

#### TASK-080: API- und Datenmodell-Design für Messaging

- **Type:** design
- **Complexity:** complex
- **Estimated:** 8h / 5 points
- **Skills:** backend, system-design, api-design
- **Assignee:** Solution Architect

Entwurf der API-Kontrakte, Event-Schemas (MessageSent, Delivered, Read, Typing, Presence) und Datenmodelle für Nachrichten, Zustellstatus und Präsenz inkl. Multi-Device-Überlegungen.

**Acceptance Criteria:**
- [ ] API-Endpunkte und Event-Schemas sind dokumentiert
- [ ] Datenmodelle für Nachrichten, Zustellstatus und Präsenz sind spezifiziert
- [ ] Multi-Device-Szenarien sind berücksichtigt

---

#### TASK-081: Backend: Messaging-API mit Zustellstatus

- **Type:** development
- **Complexity:** complex
- **Estimated:** 12h / 8 points
- **Skills:** backend, api, database, websockets
- **Assignee:** Backend Developer

Implementierung der Kern-Messaging-API (Senden, Abrufen, Zustellstatus) inkl. Validierung, Persistenz und Websocket/Broker-Anbindung für Status-Updates.

**Acceptance Criteria:**
- [ ] Nachrichten können gesendet und abgerufen werden
- [ ] Zustellstatus (sent/delivered/read) wird persistiert und aktualisiert
- [ ] API-Validierungen und Fehlerbehandlung sind implementiert

**Depends on:** TASK-001

---

#### TASK-082: Backend: Präsenz- und Typing-Indikatoren

- **Type:** development
- **Complexity:** medium
- **Estimated:** 8h / 5 points
- **Skills:** backend, realtime, websockets
- **Assignee:** Backend Developer

Implementierung von Präsenz- und Typing-Events (online/offline/typing) über Websocket oder Pub/Sub, inkl. TTL und Status-Synchronisation.

**Acceptance Criteria:**
- [ ] Präsenz- und Typing-Events werden in Echtzeit gesendet
- [ ] TTL/Heartbeat-Logik verhindert veraltete Präsenz
- [ ] Events sind für Multi-Device konsistent

**Depends on:** TASK-001

---

#### TASK-083: Benachrichtigungsdienst mit KI-Assistenz-Hooks

- **Type:** development
- **Complexity:** complex
- **Estimated:** 12h / 8 points
- **Skills:** backend, notifications, api-integration
- **Assignee:** Backend Developer

Implementierung von Benachrichtigungen (In-App und Push) inkl. Triggern bei neuen Nachrichten und Zustellstatus; Integration eines Hooks für KI-Assistenz (z.B. Zusammenfassung/Vorschläge).

**Acceptance Criteria:**
- [ ] Benachrichtigungen werden bei neuen Nachrichten ausgelöst
- [ ] Push- und In-App-Kanäle sind ansprechbar
- [ ] KI-Assistenz-Hook ist integriert und konfigurierbar

**Depends on:** TASK-001, TASK-002

---

#### TASK-084: Frontend: Messaging UI inkl. Zustellstatus & Präsenz

- **Type:** development
- **Complexity:** complex
- **Estimated:** 16h / 8 points
- **Skills:** frontend, typescript, realtime-ui
- **Assignee:** Frontend Developer

Implementierung der UI für Chatansicht, Zustellstatus (gesendet/zugestellt/gelesen), Typing-Indikator und Präsenzanzeige.

**Acceptance Criteria:**
- [ ] Chat UI zeigt Nachrichten und Zustellstatus korrekt an
- [ ] Typing-Indikator und Präsenz werden in Echtzeit aktualisiert
- [ ] Fehler- und Ladezustände sind vorhanden

**Depends on:** TASK-002, TASK-003

---

#### TASK-085: Integration & E2E Tests für Messaging/Präsenz/Benachrichtigung

- **Type:** testing
- **Complexity:** complex
- **Estimated:** 12h / 8 points
- **Skills:** testing, e2e, automation
- **Assignee:** QA Engineer

Erstellung automatisierter Integrationstests und End-to-End-Flows für Nachrichtenversand, Zustellstatus, Präsenz/Typing und Benachrichtigungen.

**Acceptance Criteria:**
- [ ] E2E Tests decken Kernflüsse ab
- [ ] Tests laufen in CI stabil durch
- [ ] Fehlerszenarien sind getestet

**Depends on:** TASK-002, TASK-003, TASK-004, TASK-005

---

#### TASK-086: DevOps: CI/CD & Deployment-Konfiguration für Messaging-Dienste

- **Type:** devops
- **Complexity:** complex
- **Estimated:** 12h / 8 points
- **Skills:** devops, ci-cd, kubernetes, docker
- **Assignee:** DevOps Engineer

Erweiterung der CI/CD-Pipeline, Dockerfiles und Kubernetes-Manifeste für Messaging-, Präsenz- und Benachrichtigungsdienste inkl. Healthchecks.

**Acceptance Criteria:**
- [ ] CI/CD Pipeline baut und deployt die Services
- [ ] Docker-Images sind versioniert und scanbar
- [ ] Kubernetes-Manifeste enthalten Healthchecks und Ressourcenlimits

**Depends on:** TASK-002, TASK-003, TASK-004

---

#### TASK-087: Dokumentation: API Docs & Runbook für Messaging

- **Type:** documentation
- **Complexity:** medium
- **Estimated:** 6h / 3 points
- **Skills:** documentation, api
- **Assignee:** Technical Writer

Erstellung der API-Dokumentation und eines Runbooks für Betrieb/Incident-Handling der Messaging- und Benachrichtigungsdienste.

**Acceptance Criteria:**
- [ ] API-Dokumentation ist veröffentlicht
- [ ] Runbook beschreibt Monitoring, Alerts und typische Incidents
- [ ] Dokumentation ist versioniert und zugreifbar

**Depends on:** TASK-002, TASK-004

---

### EPIC-005

| Tasks | Hours | Points |
|-------|-------|--------|
| 5 | 44h | 28 |

#### TASK-088: CI/CD Pipeline fuer Auth-Services einrichten

- **Type:** devops
- **Complexity:** complex
- **Estimated:** 8h / 5 points
- **Skills:** devops, ci/cd, security
- **Assignee:** DevOps Engineer

Einrichten einer CI/CD-Pipeline (Build, Test, Deploy) fuer Auth-Services inklusive Linting, Unit-Tests und Security-Checks.

**Acceptance Criteria:**
- [ ] Automatischer Build und Test bei jedem Commit
- [ ] Deployment in Staging-Umgebung automatisiert
- [ ] Security-Checks (SCA/SAST) integriert

---

#### TASK-090: Backend: Telefonnummer-Registrierung und 2FA APIs

- **Type:** development
- **Complexity:** complex
- **Estimated:** 8h / 5 points
- **Skills:** backend, api, security
- **Assignee:** Backend Developer

Implementierung der Backend-Endpunkte fuer Telefonnummer-Registrierung, SMS/OTP Versand, Verifikation und 2FA-Statusverwaltung.

**Acceptance Criteria:**
- [ ] API-Endpunkte fuer Registrierung und OTP-Verifikation implementiert
- [ ] Fehlerfaelle (falscher Code, Rate-Limits) korrekt behandelt
- [ ] Unit-Tests fuer kritische Logik vorhanden

**Depends on:** TASK-001

---

#### TASK-091: Frontend: UI fuer Telefonnummer-Registrierung und 2FA

- **Type:** development
- **Complexity:** complex
- **Estimated:** 12h / 8 points
- **Skills:** frontend, typescript, ux
- **Assignee:** Frontend Developer

Erstellung der UI-Flows fuer Telefonnummer-Registrierung, OTP-Eingabe und 2FA Aktivierung inkl. Validation und Error-Handling.

**Acceptance Criteria:**
- [ ] Registrierungs- und 2FA-Screens funktionsfaehig
- [ ] Validierungen und Fehlermeldungen sichtbar
- [ ] UI integriert mit Backend-APIs

**Depends on:** TASK-003

---

#### TASK-092: Client: Biometrische Entsperrung und Passkey-Support

- **Type:** development
- **Complexity:** complex
- **Estimated:** 8h / 5 points
- **Skills:** mobile, security, authentication
- **Assignee:** Mobile Developer

Implementierung biometrischer Authentifizierung (Face/Touch ID) und Passkey-Unterstuetzung im Client inkl. Fallbacks.

**Acceptance Criteria:**
- [ ] Biometrische Entsperrung aktiviert und getestet
- [ ] Passkey-Anmeldung funktioniert auf unterstützten Geräten
- [ ] Fallback auf PIN/Passwort vorhanden

**Depends on:** TASK-004

---

#### TASK-093: Multi-Device Support fuer Auth-Sessions

- **Type:** development
- **Complexity:** complex
- **Estimated:** 8h / 5 points
- **Skills:** backend, security, api
- **Assignee:** Backend Developer

Implementierung von Multi-Device Support inkl. Session-Sync, Geräteliste und Geräteabmeldung.

**Acceptance Criteria:**
- [ ] Mehrere Sessions pro Benutzer werden verwaltet
- [ ] Geräte können serverseitig gelistet und abgemeldet werden
- [ ] API-Responses dokumentiert und getestet

**Depends on:** TASK-003

---

### EPIC-006

| Tasks | Hours | Points |
|-------|-------|--------|
| 6 | 72h | 45 |

#### TASK-096: Telefonnummer-Registrierung & 2FA implementieren

- **Type:** development
- **Complexity:** complex
- **Estimated:** 12h / 8 points
- **Skills:** backend, authentication, security
- **Assignee:** Backend Developer

Backend-Logik für Telefonnummer-Registrierung inkl. SMS-Provider-Anbindung, Token-Generierung und Verifikation der Zwei-Faktor-Authentifizierung umsetzen.

**Acceptance Criteria:**
- [ ] Benutzer können sich mit Telefonnummer registrieren
- [ ] 2FA-Codes werden generiert, versendet und validiert
- [ ] Fehlversuche werden protokolliert und limitiert

---

#### TASK-097: Biometrische Entsperrung, Passkey & Multi-Device Support

- **Type:** development
- **Complexity:** complex
- **Estimated:** 12h / 8 points
- **Skills:** mobile, security, authentication
- **Assignee:** Mobile Developer

Client- und Backend-Unterstützung für biometrische Entsperrung, Passkey-Login sowie Verwaltung mehrerer Geräte pro Account implementieren.

**Acceptance Criteria:**
- [ ] Biometrische Entsperrung funktioniert auf unterstützten Geräten
- [ ] Passkeys können erstellt und genutzt werden
- [ ] Mehrere Geräte pro Nutzer sind konsistent verwaltbar

**Depends on:** TASK-001

---

#### TASK-098: Backend-Modelle & APIs für Gruppen/Communities/Kanäle

- **Type:** development
- **Complexity:** complex
- **Estimated:** 12h / 8 points
- **Skills:** backend, database, api-design
- **Assignee:** Backend Developer

Datenbank-Schema, Migrations und CRUD-APIs für Gruppen, Communities und Kanäle implementieren.

**Acceptance Criteria:**
- [ ] CRUD-Endpunkte für Gruppen, Communities und Kanäle existieren
- [ ] Datenbank-Schema ist dokumentiert und versioniert
- [ ] Zugriffsrechte werden serverseitig validiert

**Depends on:** TASK-001

---

#### TASK-099: UI für Gruppen/Communities/Kanäle

- **Type:** development
- **Complexity:** complex
- **Estimated:** 12h / 8 points
- **Skills:** frontend, ui, typescript
- **Assignee:** Frontend Developer

Frontend-Ansichten zur Erstellung, Verwaltung, Beitritt und Austritt aus Gruppen/Communities/Kanälen implementieren.

**Acceptance Criteria:**
- [ ] Nutzer können Gruppen/Communities/Kanäle erstellen und verwalten
- [ ] Beitritt und Austritt funktioniert über die UI
- [ ] Fehlermeldungen und Validierung sind sichtbar

**Depends on:** TASK-003

---

#### TASK-100: Umfragen & Events (Backend + Basis-UI)

- **Type:** development
- **Complexity:** complex
- **Estimated:** 16h / 8 points
- **Skills:** backend, frontend, api-design
- **Assignee:** Fullstack Developer

APIs zur Erstellung/Teilnahme von Umfragen und Events sowie einfache UI-Komponenten für Erstellung und Anzeige umsetzen.

**Acceptance Criteria:**
- [ ] Umfragen und Events können erstellt und angezeigt werden
- [ ] Teilnahme an Umfragen/Events ist möglich
- [ ] Daten werden korrekt in der DB persistiert

**Depends on:** TASK-003

---

#### TASK-101: Integrationstests für Auth & Communities

- **Type:** testing
- **Complexity:** medium
- **Estimated:** 8h / 5 points
- **Skills:** testing, automation, qa
- **Assignee:** QA Engineer

End-to-End-Tests für Auth-Flow sowie Gruppen/Communities/Kanäle/Umfragen/Events implementieren.

**Acceptance Criteria:**
- [ ] E2E-Tests decken Auth-Flow und Kernfeatures ab
- [ ] Tests laufen stabil in CI
- [ ] Fehlgeschlagene Szenarien sind nachvollziehbar

**Depends on:** TASK-002, TASK-004, TASK-005

---

### EPIC-007

| Tasks | Hours | Points |
|-------|-------|--------|
| 7 | 52h | 33 |

#### TASK-104: Medien-Datenmodell & Speicherstrategie definieren

- **Type:** design
- **Complexity:** medium
- **Estimated:** 6h / 5 points
- **Skills:** system_design, backend, security
- **Assignee:** Solution Architect

Erstellen eines technischen Designs für Medien/Anhänge inkl. Metadaten, Qualitäts-/Größenregeln, Speicherort (z.B. Object Storage), Lifecycle und Zugriffskontrolle.

**Acceptance Criteria:**
- [ ] Datenmodell für Medien/Anhänge inkl. Metadaten ist dokumentiert
- [ ] Qualitäts- und Größenregeln sind definiert
- [ ] Speicher- und Zugriffskonzept ist abgestimmt

---

#### TASK-105: Backend API für Medien-Upload und -Verwaltung

- **Type:** development
- **Complexity:** complex
- **Estimated:** 8h / 5 points
- **Skills:** backend, api_design, validation
- **Assignee:** Backend Developer

Implementierung von API-Endpunkten für Upload, Abruf und Löschung von Medien/Anhängen inkl. Validierung von Dateityp, Größe und Qualitätsparametern.

**Acceptance Criteria:**
- [ ] Upload-, Abruf- und Lösch-API funktionieren gemäß Spezifikation
- [ ] Größen- und Qualitätsvalidierung wird serverseitig erzwungen
- [ ] Fehlerfälle liefern nachvollziehbare Fehlermeldungen

**Depends on:** TASK-001

---

#### TASK-106: Frontend UI für Upload und Medienverwaltung

- **Type:** development
- **Complexity:** complex
- **Estimated:** 12h / 8 points
- **Skills:** frontend, typescript, ui
- **Assignee:** Frontend Developer

Erstellung der UI zur Auswahl, Vorschau, Upload und Verwaltung von Medien/Anhängen inkl. Anzeige von Validierungsfehlern.

**Acceptance Criteria:**
- [ ] User können Dateien auswählen, Vorschau sehen und hochladen
- [ ] Validierungsfehler werden nutzerfreundlich angezeigt
- [ ] Upload-Status wird korrekt visualisiert

**Depends on:** TASK-001, TASK-002

---

#### TASK-107: End-to-End Tests für Medien-Workflow

- **Type:** testing
- **Complexity:** medium
- **Estimated:** 6h / 3 points
- **Skills:** testing, e2e, qa
- **Assignee:** QA Engineer

Erstellen von E2E-Tests für Upload, Abruf und Löschung inkl. Validierungsfehler und Größenlimits.

**Acceptance Criteria:**
- [ ] E2E-Tests decken Upload, Abruf, Löschung ab
- [ ] Tests prüfen Fehlerfälle bei Größen-/Qualitätsüberschreitung
- [ ] Tests laufen stabil in CI

**Depends on:** TASK-002, TASK-003

---

#### TASK-108: Containerisierung & Kubernetes-Deploy für Medien-Service

- **Type:** devops
- **Complexity:** complex
- **Estimated:** 8h / 5 points
- **Skills:** devops, docker, kubernetes
- **Assignee:** DevOps Engineer

Dockerfile und Kubernetes-Manifeste für den Medien-Service erstellen (inkl. Volumes/Secrets/ConfigMaps).

**Acceptance Criteria:**
- [ ] Docker-Image baut erfolgreich in CI
- [ ] Kubernetes-Deploy funktioniert in Staging
- [ ] Konfigurationen sind versioniert und dokumentiert

**Depends on:** TASK-002

---

#### TASK-109: CI/CD Pipeline & Monitoring-Dashboard erweitern

- **Type:** devops
- **Complexity:** complex
- **Estimated:** 8h / 5 points
- **Skills:** devops, ci_cd, monitoring
- **Assignee:** DevOps Engineer

Ergänzung der CI/CD Pipeline um Build/Deploy des Medien-Services sowie Aufbau eines Monitoring-Dashboards (Metriken: Upload-Fehler, Latenz, Größe).

**Acceptance Criteria:**
- [ ] Pipeline baut, testet und deployt den Medien-Service
- [ ] Monitoring-Dashboard zeigt zentrale Metriken
- [ ] Alerts für Fehlerquote/Latenz sind konfiguriert

**Depends on:** TASK-005

---

#### TASK-110: API-Dokumentation & Runbook für Medien-Service

- **Type:** documentation
- **Complexity:** simple
- **Estimated:** 4h / 2 points
- **Skills:** documentation, api_design, devops
- **Assignee:** Technical Writer

Erstellen der API-Dokumentation inkl. Beispiele sowie eines Runbooks für Betrieb, Troubleshooting und Skalierung.

**Acceptance Criteria:**
- [ ] API-Docs sind vollständig und versioniert
- [ ] Runbook enthält Start/Stop, Fehleranalyse, Skalierung
- [ ] Dokumente sind im zentralen Repository verfügbar

**Depends on:** TASK-002, TASK-006

---

### DATABASE

| Tasks | Hours | Points |
|-------|-------|--------|
| 1 | 4h | 3 |

#### TASK-111: Create User model and migration

- **Type:** development
- **Complexity:** medium
- **Estimated:** 4h / 3 points
- **Skills:** backend, database, orm
- **Assignee:** Backend Developer

Implement database model for User entity with all attributes and relationships. Create migration script.

**Acceptance Criteria:**
- [ ] User model created with all attributes
- [ ] Migration script works forward and backward
- [ ] Unit tests for model validation
- [ ] UserProfile model created with all attributes
- [ ] UserAuthMethod model created with all attributes
- [ ] Device model created with all attributes
- [ ] EncryptionKey model created with all attributes
- [ ] DeliveryReceipt model created with all attributes
- [ ] LinkPreview model created with all attributes
- [ ] AuditLog model created with all attributes
- [ ] DeviceSession model created with all attributes
- [ ] Chat model created with all attributes
- [ ] Message model created with all attributes
- [ ] MessageReaction model created with all attributes
- [ ] MediaMetadata model created with all attributes
- [ ] Group model created with all attributes
- [ ] GroupMember model created with all attributes
- [ ] MessageReceipt model created with all attributes
- [ ] device_session model created with all attributes
- [ ] encryption_key model created with all attributes
- [ ] message_receipt model created with all attributes
- [ ] media_asset model created with all attributes
- [ ] contact_block model created with all attributes
- [ ] audit_log model created with all attributes
- [ ] contact model created with all attributes
- [ ] delivery_receipt model created with all attributes
- [ ] link_preview model created with all attributes
- [ ] privacy_setting model created with all attributes
- [ ] media_attachment model created with all attributes
- [ ] media model created with all attributes
- [ ] user_storage_limit model created with all attributes
- [ ] reliability_policy model created with all attributes
- [ ] resilience_policy model created with all attributes

---

### API

| Tasks | Hours | Points |
|-------|-------|--------|
| 1 | 8h | 5 |

#### TASK-143: Implement api API endpoints

- **Type:** development
- **Complexity:** complex
- **Estimated:** 8h / 5 points
- **Skills:** backend, api, rest
- **Assignee:** Backend Developer

Implement 506 endpoints for api resource including validation, error handling, and documentation.

**Acceptance Criteria:**
- [ ] All 506 endpoints implemented
- [ ] Request/response validation
- [ ] OpenAPI documentation updated
- [ ] Integration tests written
- [ ] All 3 endpoints implemented

---

