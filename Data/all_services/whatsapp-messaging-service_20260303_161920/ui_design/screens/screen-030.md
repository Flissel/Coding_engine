# Dashboard mit Anzeigename-Konfiguration

**ID:** `SCREEN-030`
**Route:** `/dashboard`
**Layout:** sidebar

Dashboard-Ansicht mit Chat-Liste, Suchfunktion und Profil-Bereich zum Festlegen und Speichern eines konfigurierbaren Anzeigenamens

---

## Components Used

- `COMP-001`
- `COMP-002`
- `COMP-003`
- `COMP-009`
- `COMP-010`

---

## Data Requirements

- `GET /api/profile`
- `PUT /api/profile/display-name`
- `GET /api/chats`

---

## Related User Story

`US-007`

---

## Wireframe

```
     0    5   10   15   20   25   30   35   40   45   50   55   60
   0 +------------------------------------------------------------+
     |  COMP-009 (ProfileCard - Anzeigename)                      |
   2 |  [O] COMP-010   Profil & Anzeigename                      |
     |  (StatusInd.)                                              |
   4 |  +------------------------------------------------------+ |
     |  | Anzeigename: [____Max Mustermann__________________ ]  | |
   6 |  +------------------------------------------------------+ |
     |                                    [ Speichern ] COMP-001  |
   8 +--------------------+---------------------------------------+
     | [🔍 Suche...]      |                                       |
  10 |  COMP-002          |        Willkommen, Max Mustermann!    |
     |  (SearchBar)       |                                       |
  12 +--------------------+   Dein Anzeigename wird in allen      |
     | [Avatar] Chat 1    |   Konversationen angezeigt.           |
  14 |  Letzte Nachricht  |                                       |
     |  12:30  ✓✓         |   +---------------------------------+ |
  16 |--------------------|   | Vorschau:                       | |
     | [Avatar] Chat 2    |   |                                 | |
  18 |  Hallo, wie geht.. |   |  +---------------------------+  | |
     |  11:45  ✓          |   |  | Max Mustermann            |  | |
  20 |--------------------|   |  | Online                    |  | |
     | [Avatar] Chat 3    |   |  +---------------------------+  | |
  22 |  Dokument erhalten |   |                                 | |
     |  Gestern           |   +---------------------------------+ |
  24 |  COMP-003          |                                       |
     |  (ChatListItems)   |                                       |
  26 +--------------------+---------------------------------------+
```
