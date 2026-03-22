# Verschlüsselter Videoanruf - Kontakt blockieren

**ID:** `SCREEN-006`
**Route:** `/calls/video/:callId`
**Layout:** fullscreen-overlay

Verschlüsselter Videoanruf-Screen mit der Möglichkeit, den aktuellen Kontakt zu blockieren. Zeigt Video-UI, Anrufstatus, Kontaktinformationen und einen Blockieren-Dialog.

---

## Components Used

- `COMP-001`
- `COMP-009`
- `COMP-010`

---

## Data Requirements

- `GET /api/calls/video/{callId}`
- `GET /api/contacts/{contactId}`
- `POST /api/contacts/{contactId}/block`
- `DELETE /api/calls/video/{callId}`

---

## Related User Story

`US-060`

---

## Wireframe

```
     0    5   10   15   20   25   30   35   40   45   50   55   60
   0 +------------------------------------------------------------+
     | [Video Feed - Vollbild Hintergrund]                        |
   1 |            +--------------------+                          |
     |            | 🔒 Verschlüsselt   |                          |
   2 |            |  COMP-010 (Status) |                          |
     |            +--------------------+                          |
   3 |                                                            |
   4 |         +-------------------------------+                  |
     |         |  [Avatar]                      |                  |
   5 |         |   👤  Max Mustermann           |                  |
     |         |   +49 170 1234567              |                  |
   6 |         |   COMP-009 (ContactCard)       |                  |
     |         |   Status: Verbunden            |                  |
   7 |         |   Dauer: 03:24                 |                  |
     |         +-------------------------------+                  |
   8 |                                                            |
   9 |  +------------------------------------------------------+  |
     |  |        Blockieren-Dialog (modal overlay)              |  |
  10 |  |  +--------------------------------------------------+|  |
     |  |  |                                                    ||  |
  11 |  |  |   ⚠️  Kontakt blockieren?                         ||  |
     |  |  |                                                    ||  |
  12 |  |  |   Dieser Kontakt kann Sie nicht mehr               ||  |
     |  |  |   anrufen oder Nachrichten senden.                 ||  |
  13 |  |  |   Der aktive Anruf wird beendet.                   ||  |
     |  |  |                                                    ||  |
  14 |  |  |                                                    ||  |
  15 |  |  |  [🚫 Blockieren]     [Abbrechen]                  ||  |
     |  |  |   COMP-001-confirm    COMP-001-cancel              ||  |
  16 |  |  +--------------------------------------------------+|  |
     |  +------------------------------------------------------+  |
  17 |                                                            |
  18 |  [Eigenes Video - klein]                                   |
     |  +--------+                                                |
  19 |  | 📷 PiP |                                                |
     |  +--------+                                                |
  20 |     +----------+ +----------+ +----------+                 |
     |     | 📞 Ende  | | 🔇 Mute  | | 🚫 Block |                 |
  21 |     | COMP-001 | | COMP-001 | | COMP-001 |                 |
     |     | -end     | | -mute    | | -block   |                 |
  22 |     +----------+ +----------+ +----------+                 |
     |                                                            |
  23 +------------------------------------------------------------+
```
