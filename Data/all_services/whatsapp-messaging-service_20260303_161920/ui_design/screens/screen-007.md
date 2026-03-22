# Profile - Audio Attachment

**ID:** `SCREEN-007`
**Route:** `/settings/profile`
**Layout:** single-column

Profilseite mit Avatar, QR-Code und Formular. Ermoeglicht das Senden von Audio-Dateien ueber den VoiceRecorder und die Vorschau via MediaViewer. Audio-Dateien koennen aufgenommen oder aus dem Speicher ausgewaehlt und als Nachricht versendet werden.

---

## Components Used

- `COMP-001`
- `COMP-005`
- `COMP-006`
- `COMP-007`
- `COMP-010`

---

## Data Requirements

- `GET /api/settings/profile`
- `PUT /api/settings/profile`
- `POST /api/messages/audio`
- `GET /api/media/audio/{id}`
- `POST /api/media/upload`

---

## Related User Story

`US-054`

---

## Wireframe

```
     0    5   10   15   20   25   30   35   40   45   50   55   60
   0 +------------------------------------------------------------+
     | [< Back]                                      [Save]      |
   2 | COMP-001                                      COMP-001    |
     +------------------------------------------------------------+
   4 |                  +------------------+                      |
     |   +--------+     | COMP-010         |                      |
   6 |   | Avatar |     | Status: Online   |     +----------+    |
     |   | (Foto) |     +------------------+     | QR-Code  |    |
   8 |   +--------+                              |          |    |
     |   Profilname: Max Mustermann               +----------+    |
  10 +------------------------------------------------------------+
     |    +--------------------------------------------------+    |
  12 |    |                                                  |    |
     |    |          COMP-007 (MediaViewer)                   |    |
  14 |    |                                                  |    |
     |    |   +------------------------------------------+   |    |
  16 |    |   |  [>]  audio_message.mp3                  |   |    |
     |    |   |  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~     |   |    |
  18 |    |   |  00:00 ======|============= 02:34        |   |    |
     |    |   +------------------------------------------+   |    |
  20 |    |                                                  |    |
     |    +--------------------------------------------------+    |
  22 +------------------------------------------------------------+
     |         +----------------------------------------+         |
  24 |         |  COMP-006 (VoiceRecorder)              |         |
     |         |  [ O Rec ]  00:00:00  [ || ] [ [] ]    |         |
  26 |         +----------------------------------------+         |
     +------------------------------------------------------------+
  28 |    +------------------------------------------+ +--------+ |
     |    | COMP-005 (MessageInput)                  | | Send   | |
  30 |    | [Nachricht oder Audiobeschreibung...]     | |COMP-001| |
     |    +------------------------------------------+ +--------+ |
  32 +------------------------------------------------------------+
```
