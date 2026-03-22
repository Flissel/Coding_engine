# Dashboard

**ID:** `SCREEN-033`
**Route:** `/dashboard`
**Layout:** sidebar

Dashboard-Übersicht mit Chat-Liste, Suchfunktion und Profil-Bereich, in dem die hinterlegte Telefonnummer des Nutzers angezeigt wird.

---

## Components Used

- `COMP-002`
- `COMP-003`
- `COMP-009`
- `COMP-010`
- `COMP-001`

---

## Data Requirements

- `GET /api/profile`
- `GET /api/profile/phone`
- `GET /api/chats`
- `GET /api/chats?search={query}`

---

## Related User Story

`US-009`

---

## Wireframe

```
     0    5   10   15   20   25   30   35   40   45   50   55   60
   0 +--------------+--------------------------------------------+
     | [ProfileCard]|  [SearchBar]                               |
   2 | COMP-009     |  COMP-002                                  |
     |              |  [🔍 Chats durchsuchen...]                 |
   3 | +----------+ +--------------------------------------------+
     | | [Avatar]  | |  +----------------------------------------+
   4 | | COMP-010  | |  | [ChatListItem]  COMP-003               |
     | | 🟢 Online | |  | +------------------------------------+|
   5 | +----------+ |  | | 👤 Max Müller        14:32  🟢      ||
     |              |  | |    Letzte Nachricht...               ||
   6 | Nutzername   |  | +------------------------------------+||
     | Max Musterman|  | +------------------------------------+||
   7 | ------------ |  | | 👤 Anna Schmidt      13:15  ⚪      ||
     | 📞 Telefon:  |  | |    Okay, bis dann!                 ||
   8 | +49 170 1234 |  | +------------------------------------+||
     | 5678         |  | +------------------------------------+||
   9 |              |  | | 👤 Firma ABC         gestern 🟢    ||
     | [Profil      |  | |    Dokument gesendet ✓✓            ||
  10 |  bearbeiten] |  | +------------------------------------+||
     |              |  | +------------------------------------+||
  12 |              |  | | 👤 Julia Weber       Mo     ⚪      ||
     |              |  | |    Foto 📷                          ||
  14 |              |  | +------------------------------------+||
     |              |  | +------------------------------------+||
  16 |              |  | | 👤 Support Team      25.05  🟢     ||
     |              |  | |    Vielen Dank!                     ||
  18 |              |  | +------------------------------------+||
     |              |  |                                        |
  20 |              |  +----------------------------------------+
     +--------------+--------------------------------------------+
  21 |              |                          [+ Neuer Chat]    |
     |              |                           COMP-001         |
  23 +--------------+--------------------------------------------+
```
