# Dashboard - Chat Export

**ID:** `SCREEN-039`
**Route:** `/dashboard`
**Layout:** sidebar

Dashboard-Ansicht mit Chat-Liste, Chat-Vorschau und Export-Funktionalität. Ermöglicht dem Nutzer einen einzelnen Chat auszuwählen und zu exportieren.

---

## Components Used

- `COMP-001`
- `COMP-002`
- `COMP-003`
- `COMP-009`
- `COMP-010`

---

## Data Requirements

- `GET /api/chats`
- `GET /api/chats/{id}`
- `GET /api/chats/{id}/messages`
- `POST /api/chats/{id}/export`
- `GET /api/contacts/{id}`

---

## Related User Story

`US-092`

---

## Wireframe

```
     0    5   10   15   20   25   30   35   40   45   50   55   60
   0 +-------------------+----------------------------------------+
     | [SearchBar]       | [ContactCard]                          |
   1 | COMP-002          |  Avatar  Name: Max Mustermann          |
     | [🔍 Chat suchen] |  COMP-009                              |
   2 |                   |                    [Export Chat]       |
     +-------------------+                    COMP-001 (Button)   |
   3 |                   +----------------------------------------+
     | [ChatListItem]    |                                        |
   4 | COMP-003          |  +----------------------------------+  |
     | +---------------+ |  | Export-Vorschau                  |  |
   5 | | Max Mustermann| |  |                                  |  |
     | | Letzte Nachri.| |  | Format:  (•) TXT  ( ) PDF       |  |
   6 | | 14:32 ● COMP- | |  |          ( ) CSV  ( ) HTML       |  |
     | |       010     | |  |                                  |  |
   7 | +---------------+ |  | Zeitraum:                        |  |
     | +---------------+ |  | [Gesamter Chat        ▼]        |  |
   8 | | Anna Schmidt  | |  |                                  |  |
     | | Hey, wie geht.| |  | Medien einschliessen:            |  |
   9 | | 13:10         | |  | [✓] Bilder                       |  |
     | +---------------+ |  | [✓] Videos                       |  |
  10 | +---------------+ |  | [✓] Dokumente                    |  |
     | | Team Gruppe   | |  | [ ] Sprachnachrichten            |  |
  11 | | Peter: Morgen.| |  |                                  |  |
     | | 12:45         | |  | Geschaetzte Groesse: 4.2 MB      |  |
  12 | +---------------+ |  |                                  |  |
     | +---------------+ |  | +------------------------------+ |  |
  13 | | Lisa Weber    | |  | | Vorschau: 1.247 Nachrichten  | |  |
     | | Dokument gese.| |  | | Zeitraum: 01.01 - 15.06.2024| |  |
  14 | | 11:30         | |  | | Teilnehmer: 2                | |  |
     | +---------------+ |  | +------------------------------+ |  |
  15 |                   |  |                                  |  |
     |                   |  |  [Abbrechen]    [✓ Exportieren]  |  |
  16 |                   |  |                  COMP-001         |  |
     |                   |  +----------------------------------+  |
  17 |                   |                                        |
     +-------------------+----------------------------------------+
  18 | [Status: Online]  |  Letzter Export: 14.06.2024, 10:30     |
     | COMP-010          |                                        |
  19 +-------------------+----------------------------------------+
```
