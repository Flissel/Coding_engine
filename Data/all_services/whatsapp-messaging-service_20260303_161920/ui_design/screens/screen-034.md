# Dashboard - Chat-Suche

**ID:** `SCREEN-034`
**Route:** `/dashboard`
**Layout:** split

Dashboard mit Chat-Suchfunktion zum Finden von Chats und Kontakten. Die Suchleiste filtert in Echtzeit die Chat-Liste und zeigt passende Kontakte an.

---

## Components Used

- `COMP-002`
- `COMP-003`
- `COMP-009`
- `COMP-010`
- `COMP-001`

---

## Data Requirements

- `GET /api/chats?q={searchTerm}`
- `GET /api/contacts?q={searchTerm}`
- `GET /api/chats`
- `GET /api/contacts/{id}`

---

## Related User Story

`US-078`

---

## Wireframe

```
     0    5   10   15   20   25   30   35   40   45   50   55   60
   0 +------------------------+------------------------------------+
     | [SearchBar]            |  [Kontakt-Details / Suchergebnis]  |
   1 | COMP-002               |                                    |
     | +------------------[X]-|  COMP-009 (ContactCard)            |
   2 | | 🔍 Suche Chats... |CB||                                    |
     | +--------------------+-|  +--------------------------------+|
   3 | COMP-001 (ClearBtn)    |  |  [Avatar]  Max Mustermann      ||
     |------------------------|  |            +49 170 1234567     ||
   4 | [Chat-Liste]           |  |  COMP-010  ● Online            ||
     | COMP-003               |  |  (StatusIndicator)             ||
   5 | +--------------------+ |  +--------------------------------+|
     | | 🟢 Max Mustermann  | |                                    |
   6 | | COMP-010  Letzte.. | |  +--------------------------------+|
     | |--------------------| |  |  Letzte Nachricht:              ||
   7 | | ⚪ Anna Schmidt    | |  |  "Hey, wie geht's dir?"        ||
     | |   Gestern 18:30   | |  |  Gestern 18:45                  ||
   8 | |--------------------| |  +--------------------------------+|
     | | 🟢 Gruppe: Team    | |                                    |
   9 | |   Heute 09:15     | |  +--------------------------------+|
     | |--------------------| |  |  [Nachricht senden]  COMP-001  ||
  10 | | ⚪ Lisa Weber      | |  |  [Chat öffnen]       (Button)  ||
     | |   Mo 14:22        | |  +--------------------------------+|
  11 | |--------------------| |                                    |
     | | 🟢 Peter König    | |                                    |
  12 | |   So 20:10        | |                                    |
     | |--------------------| |                                    |
  13 | |                    | |                                    |
     | | (weitere Ergebnis- | |                                    |
  14 | |  se werden beim    | |                                    |
     | |  Scrollen geladen) | |                                    |
  15 | |                    | |                                    |
     | +--------------------+ |                                    |
  16 |------------------------|                                    |
     | Ergebnisse: 12 Chats,  |                                    |
  17 | 5 Kontakte gefunden    |                                    |
     +------------------------+------------------------------------+
```
