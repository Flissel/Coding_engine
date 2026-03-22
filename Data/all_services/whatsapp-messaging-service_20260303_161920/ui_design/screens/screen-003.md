# Anrufe / Info-Status

**ID:** `SCREEN-003`
**Route:** `/calls`
**Layout:** stack

Anrufliste mit Verlauf und Schnellaktionen. Nutzer kann seinen Info/Status-Text sehen und bearbeiten. Die Anrufliste zeigt vergangene Anrufe mit Kontaktinformationen und Status-Indikatoren.

---

## Components Used

- `COMP-001`
- `COMP-002`
- `COMP-003`
- `COMP-009`
- `COMP-010`

---

## Data Requirements

- `GET /api/calls/history`
- `GET /api/profile/status`
- `PUT /api/profile/status`
- `GET /api/contacts/{id}`

---

## Related User Story

`US-008`

---

## Wireframe

```
     0    5   10   15   20   25   30   35   40   45   50   55   60
   0 +------------------------------------------------------------+
     |  [Logo/Back]       Anrufe          [NewCall] [VideoCall]   |
   2 |                COMP-001 (QuickActionButtons)               |
     +------------------------------------------------------------+
   4 |  +--------------------------------------------------------+|
     |  | [🔍] Anrufe durchsuchen...                             ||
   6 |  |  COMP-002 (SearchBar)                                  ||
     +--+--------------------------------------------------------++
   7 |  +------------------------------------------------------+ |
     |  | [Avatar]  Mein Status / Info-Text        [Online] ●   | |
   9 |  |           "Hey there! I am using WhatsApp"  COMP-010  | |
     |  |  COMP-009 (ProfileStatusCard)     [✏️ Bearbeiten]     | |
  11 |  +------------------------------------------------------+ |
     +------------------------------------------------------------+
  12 |  Letzte Anrufe                              [Alle | Verp.] |
     |  +--------------------------------------------------------+|
  14 |  | [Avatar] Max Mustermann        ↗ ausgehend  14:32     ||
     |  |          COMP-003              COMP-010  Heute         ||
  16 |  |--------------------------------------------------------||
     |  | [Avatar] Anna Schmidt          ↙ eingehend  12:05     ||
  18 |  |          COMP-003              COMP-010  Heute         ||
     |  |--------------------------------------------------------||
  20 |  | [Avatar] Peter Weber           ✕ verpasst   Gestern   ||
     |  |          COMP-003              COMP-010                ||
  22 |  |--------------------------------------------------------||
     |  | [Avatar] Lisa Mueller          ↗ ausgehend  Mo.       ||
  24 |  |          COMP-003 (CallHistoryList)  COMP-010          ||
     |  +--------------------------------------------------------+|
  26 +------------------------------------------------------------+
```
