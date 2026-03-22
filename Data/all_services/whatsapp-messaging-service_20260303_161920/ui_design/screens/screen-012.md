# Chat-Einstellungen mit Status erstellen

**ID:** `SCREEN-012`
**Route:** `/chats/:chatId/settings`
**Layout:** stack

Chat-Einstellungen Screen mit Toggles und Privacy-Optionen sowie der Möglichkeit, einen 24-Stunden-Status zu erstellen und zu veröffentlichen. Der Nutzer kann Text eingeben, Medien anhängen, eine Vorschau sehen und den Status publizieren.

---

## Components Used

- `COMP-001`
- `COMP-005`
- `COMP-007`
- `COMP-008`
- `COMP-010`

---

## Data Requirements

- `GET /api/chats/{chatId}/settings`
- `PUT /api/chats/{chatId}/settings`
- `POST /api/status`
- `POST /api/status/media`
- `GET /api/status/preview`

---

## Related User Story

`US-042`

---

## Wireframe

```
     0    5   10   15   20   25   30   35   40   45   50   55   60
   0 +------------------------------------------------------------+
     |  [<Back]     Chat-Einstellungen          [⋮ Menu]         |
   2 |                    Header                                  |
     +------------------------------------------------------------+
   4 |                                                            |
   5 |  +------------------------------------------------------+  |
     |  | COMP-010 (StatusIndicator)                            |  |
   7 |  | ● Aktueller Status: Kein Status  |  Ablauf: 24h      |  |
   8 |  +------------------------------------------------------+  |
   9 |  +------------------------------------------------------+  |
     |  |                                                      |  |
  11 |  |          COMP-007 (MediaViewer)                      |  |
     |  |                                                      |  |
  13 |  |    +------------------------------------------+      |  |
     |  |    |   [Bild/Video Vorschau hier]              |      |  |
  15 |  |    |   Tippe um Medien hinzuzufuegen           |      |  |
     |  |    |   [📷 Kamera]  [🖼 Galerie]  [📁 Datei]  |      |  |
  17 |  |    +------------------------------------------+      |  |
     |  |                                                      |  |
  19 |  +------------------------------------------------------+  |
  20 |                                                            |
  21 |  STATUS-TEXT EINGABE:                                      |
  22 |  +------------------------------------------+ +---------+  |
     |  | COMP-005 (MessageInput)                  | | COMP-008|  |
  24 |  | [Statustext eingeben...]                  | | [😀🎉] |  |
     |  | Schreibe deinen Status...                 | |(Emoji   |  |
  26 |  +------------------------------------------+ |Picker)  |  |
     |                                               +---------+  |
  27 |  EINSTELLUNGEN:                                            |
  28 |  +------------------------------------------------------+  |
     |  |  Sichtbarkeit          [Toggle: Alle Kontakte  ◉ ]   |  |
  30 |  |  ------------------------------------------------   |  |
     |  |  Lesebestaetigung      [Toggle:               ◉  ]   |  |
  32 |  |  ------------------------------------------------   |  |
     |  |  Stummschalten         [Toggle:              ○   ]   |  |
  34 |  |  ------------------------------------------------   |  |
     |  |  Kontakte ausschliessen [>]                           |  |
  36 |  +------------------------------------------------------+  |
     |                                                            |
  37 |            +------------------------------+                |
     |            | COMP-001 (Button)            |                |
  39 |            | [  ✓ Status veroeffentlichen ]|                |
     |            +------------------------------+                |
  41 |                                                            |
  42 +------------------------------------------------------------+
```
