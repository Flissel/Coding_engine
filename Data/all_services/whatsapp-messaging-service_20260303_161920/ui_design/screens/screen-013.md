# Anruf-Onboarding (Video Call Permissions)

**ID:** `SCREEN-013`
**Route:** `/calls/video/:callId/onboarding`
**Layout:** fullscreen-modal

Onboarding-Screen vor einem Videoanruf: Berechtigungen (Kamera, Mikrofon) einholen, Nutzer über Medien-/Dateianhänge im Chat aufklären, Checkliste mit Voraussetzungen anzeigen. Unterstützt Media/File Attachment Previews gemäß US-130.

---

## Components Used

- `COMP-001`
- `COMP-007`
- `COMP-010`

---

## Data Requirements

- `GET /api/calls/video/:callId`
- `GET /api/calls/video/:callId/permissions`
- `POST /api/calls/video/:callId/permissions/grant`
- `GET /api/media/preview/:attachmentId`

---

## Related User Story

`US-130`

---

## Wireframe

```
     0    5   10   15   20   25   30   35   40   45   50   55   60
   0 +------------------------------------------------------------+
     |                                                            |
   2 |          +----------------------------------------+        |
     |          | COMP-010  StatusIndicator               |        |
   4 |          | [✓] Kamera-Berechtigung       [Granted] |        |
     |          | [✗] Mikrofon-Berechtigung     [Denied]  |        |
   6 |          | [✓] Medien-/Dateianhänge      [Ready]   |        |
     |          +----------------------------------------+        |
   7 |          +----------------------------------------+        |
     |          |                                        |        |
   9 |          |    COMP-007  MediaViewer                |        |
     |          |                                        |        |
  11 |          |   +------------------------------+     |        |
     |          |   |  📷  Kamera-Vorschau         |     |        |
  13 |          |   |                              |     |        |
     |          |   |   [Selbstansicht / Preview]  |     |        |
  15 |          |   |                              |     |        |
     |          |   +------------------------------+     |        |
  17 |          |  📎 Anhang-Preview: foto.jpg  2.1MB    |        |
     |          |  📄 Anhang-Preview: doc.pdf   540KB    |        |
  19 |          +----------------------------------------+        |
     |                                                            |
  21 |               +------------------------------+             |
     |               |  COMP-001  Button             |             |
  23 |               |  [🟢 Berechtigungen erteilen  |             |
     |               |     & Anruf starten]          |             |
  25 |               +------------------------------+             |
     |                                                            |
  27 |          Hinweis: Du kannst Medien & Dateien               |
     |          während des Anrufs im Chat teilen.                |
  29 +------------------------------------------------------------+
```
