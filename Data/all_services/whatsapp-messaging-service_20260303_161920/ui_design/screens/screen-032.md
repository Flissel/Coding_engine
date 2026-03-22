# Dashboard - Status Stumm Schalten

**ID:** `SCREEN-032`
**Route:** `/dashboard`
**Layout:** sidebar

Dashboard-Ansicht mit Status-Liste der Kontakte. Ermoeglicht das Stummschalten einzelner Kontakt-Status ueber Kontextoption oder Long-Press auf den Status-Eintrag.

---

## Components Used

- `COMP-001`
- `COMP-002`
- `COMP-003`
- `COMP-009`
- `COMP-010`

---

## Data Requirements

- `GET /api/contacts`
- `GET /api/contacts/{id}/status`
- `PUT /api/contacts/{id}/status/mute`
- `DELETE /api/contacts/{id}/status/mute`

---

## Related User Story

`US-046`

---

## Wireframe

```
     0    5   10   15   20   25   30   35   40   45   50   55   60
   0 +------------------------------------------------------------+
     |  [Logo]   Dashboard    [Chats | Status | Calls]   [Menu] |
   2 |                         Header                            |
     +------------------------------------------------------------+
   4 | [SearchBar         ] |  +----------------------------------+
     |  COMP-002            |  |  [ContactCard]   COMP-009       |
   6 |                      |  |  +-----+                        |
     +----------------------+  |  |Photo|  Max Mustermann        |
   8 | [ChatListItem]       |  |  +-----+  +49 170 1234567       |
     |  COMP-003             |  |           Zuletzt online: 14:32|
  10 | +------------------+ |  |                                 |
     | | O Anna  - 10 min | |  +----------------------------------+
  12 | | O Ben   - 25 min | |                                    |
     | | O Clara - 1 Std  | |  +---------------+  +--------------+
  14 | | O David - 3 Std  | |  |[StatusIndic.] |  |[Mute Button] |
     | | O Emma  - 5 Std  | |  | COMP-010      |  | COMP-001     |
  16 | |                  | |  | Status: Aktiv  |  | [🔇 Status  ]|
     | | (O = StatusRing)  | |  | Heute, 14:30   |  | stumm       |
  18 | |                  | |  +---------------+  | schalten    ]|
     | |  Ausgewaehlter   | |                     +--------------+
  20 | |  Kontakt wird    | |  +----------------------------------+
     | |  hervorgehoben   | |  | Stummgeschaltete Status:        |
  22 | |                  | |  | [x] Frank  [x] Greta  [x] Hans  |
     | +------------------+ |  +----------------------------------+
  24 +----------------------+-------------------------------------+
```
