# Chat Background Settings

**ID:** `SCREEN-037`
**Route:** `/dashboard/chat-background`
**Layout:** split

Screen zum individuellen Auswählen und Speichern des Chat-Hintergrunds mit Live-Vorschau im Chat-Bereich

---

## Components Used

- `COMP-001`
- `COMP-004`
- `COMP-005`
- `COMP-010`

---

## Data Requirements

- `GET /api/settings/chat-background`
- `GET /api/settings/chat-background/presets`
- `PUT /api/settings/chat-background`
- `POST /api/settings/chat-background/upload`

---

## Related User Story

`US-087`

---

## Wireframe

```
     0    5   10   15   20   25   30   35   40   45   50   55   60
   0 +------------------------------------------------------------+
     | [< Back]  Chat-Hintergrund anpassen    [Saved ✓] COMP-010 |
   2 |  COMP-001                                                  |
     +-------------------+----------------------------------------+
   3 | HINTERGRUND       |   LIVE-VORSCHAU                        |
     | AUSWAHL           |  +------------------------------------+|
   5 |                   |  | ::::::::::::::::::::::::::::::::::::||
     | [■] Dunkelgrün    |  |  +-------------+                   ||
   7 | [■] Hellblau      |  |  | Hallo!      |  COMP-004         ||
     | [■] Beige         |  |  +-------------+                   ||
   9 | [■] Dunkelblau    |  |                  +----------------+||
     | [■] Rosa          |  |                  | Hey, wie gehts |||
  11 | [■] Grau          |  |                  +----------------+||
     |  COMP-001         |  |  +-------------+                   ||
  13 | (Color Swatches)  |  |  | Super! 😊   |                   ||
     +-------------------+  |  +-------------+                   ||
  14 | [📁 Bild hochladen]|  |                                   ||
     |  COMP-001 (Upload)|  |                                   ||
  16 +-------------------+  |::::::::::::::::::::::::::::::::::::||
     | [↺ Standard       ]|  +------------------------------------+|
  18 |  COMP-001 (Default)|                                       |
     +-------------------+----------------------------------------+
  19 | [💾 Speichern    ] | [MessageInput COMP-005 (Preview)]     |
     |  COMP-001 (Save)  | [Nachricht eingeben...        ] [>]   |
  21 +-------------------+----------------------------------------+
     |              Dashboard Footer                              |
  23 +------------------------------------------------------------+
```
