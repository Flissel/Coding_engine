# Status-Antwort

**ID:** `SCREEN-024`
**Route:** `/status/reply`
**Layout:** fullscreen-overlay

Screen zur Anzeige einer Statusnachricht mit Möglichkeit, darauf mit einer Antwort (Text, Emoji, Sprache) zu reagieren. Der Status wird im Vollbild angezeigt, unten befindet sich das Eingabefeld für die Antwort.

---

## Components Used

- `COMP-004`
- `COMP-005`
- `COMP-006`
- `COMP-007`
- `COMP-008`
- `COMP-010`

---

## Data Requirements

- `GET /api/status/{statusId}`
- `GET /api/status/{statusId}/author`
- `POST /api/status/{statusId}/reply`
- `POST /api/messages/media/upload`

---

## Related User Story

`US-044`

---

## Wireframe

```
     0    5   10   15   20   25   30   35   40   45   50   55   60
   0 +------------------------------------------------------------+
     | [<Back]  [Avatar] Kontaktname        12:34   [...]        |
   1 |          COMP-010 (StatusIndicator)                       |
   2 |  ████████████████████████████████████████████████████████  |
     +------------------------------------------------------------+
   3 |                                                            |
     |                                                            |
   5 |                                                            |
     |                                                            |
   7 |              COMP-007 (MediaViewer)                        |
     |           ┌──────────────────────────┐                     |
   9 |           │   Status-Bild / Video    │                     |
     |           │   oder Text-Status mit   │                     |
  11 |           │   farbigem Hintergrund   │                     |
     |           └──────────────────────────┘                     |
  13 |                                                            |
     |                                                            |
  15 |                                                            |
     +------------------------------------------------------------+
  17 |  ┌────────────────────────────────────────────────────────┐|
     |  │ ↩ Antwort auf Status von Kontaktname                  │|
  18 |  │ COMP-004 (ChatBubble - Reply Preview)                 │|
     |  │ "Originale Statusnachricht hier..."                   │|
  20 |  └────────────────────────────────────────────────────────┘|
     +------------------------------------------------------------+
  21 | [😊]  | [Nachricht eingeben...              ] | [🎤 Mic]  |
     | COMP  | COMP-005 (MessageInput)               | COMP-006  |
  22 | -008  |                                       | (Voice    |
     |Emoji  |                              [📎][➤]  | Recorder) |
  23 |Picker |                                       |           |
     +-------+---------------------------------------+-----------+
```
