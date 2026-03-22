# Unknown Senders Dashboard

**ID:** `SCREEN-031`
**Route:** `/dashboard/unknown-senders`
**Layout:** sidebar

Dashboard-Ansicht zur separaten Anzeige und Verwaltung von Nachrichten unbekannter Absender. Ermöglicht das Filtern, Durchsuchen, Blockieren und Hinzufügen zu Kontakten.

---

## Components Used

- `COMP-001`
- `COMP-002`
- `COMP-003`
- `COMP-009`
- `COMP-010`

---

## Data Requirements

- `GET /api/messages/unknown-senders`
- `GET /api/messages/unknown-senders?search={query}`
- `GET /api/messages/unknown-senders/{senderId}`
- `POST /api/contacts (add unknown sender to contacts)`
- `POST /api/messages/unknown-senders/{senderId}/block`
- `DELETE /api/messages/unknown-senders/{senderId}`

---

## Related User Story

`US-075`

---

## Wireframe

```
     0    5   10   15   20   25   30   35   40   45   50   55   60
   0 +------------------------------------------------------------+
     | [Logo]   Unbekannte Absender          [Badge: 12 neu]    |
   2 |  Dashboard > Unbekannte Absender                          |
     |  COMP-001 [Alle markieren] [Blockieren] [Löschen]        |
   3 +------------------------------------------------------------+
   4 +-------------------+|+--------------------------------------+
     | [🔍 Suche...]     ||  Unbekannte Absender (24)             |
   5 |  COMP-002         ||                                      |
     | SearchBar         ||  +----------------------------------+ |
   6 |                   ||  | 📱 +49 176 xxx  COMP-010 [●neu] | |
   7 +-------------------+|  | "Hallo, ich bins..."    14:32   | |
     | Filter  COMP-010   ||  | COMP-003 (ChatListItem)         | |
   8 | +-----------------+||  +----------------------------------+ |
     | | [●] Alle    (24)||  +----------------------------------+ |
   9 | | [●] Neu     (12)||  | 📱 +49 151 xxx  COMP-010 [●]   | |
     | | [○] Gelesen  (8)||  | "Können wir reden?"     12:05   | |
  10 | | [○] Blockiert(4)||  | COMP-003 (ChatListItem)         | |
     | +-----------------+|  +----------------------------------+ |
  11 | StatusIndicator    ||  +----------------------------------+ |
  12 +-------------------+|  | 📱 +44 20 xxx   [blockiert]     | |
     | Aktionen COMP-001  ||  | "Buy now..."            09:11   | |
  13 | +-------+ +------+||  | COMP-003 (ChatListItem)         | |
     | |+Kontakt| |Block |||  +----------------------------------+ |
  14 | |hinzu  | |ieren |||  | 📱 +49 170 xxx  COMP-010 [●neu] | |
     | +-------+ +------+||  | "Treffen morgen?"       gestern | |
  15 | +----------------+||  | COMP-003 (ChatListItem)         | |
     | |Alle löschen    |||  +----------------------------------+ |
  16 | +----------------++|+--------------------------------------+
     +-------------------+|+--------------------------------------+
  17 |                    || Absender-Details   COMP-009           |
     |                    || +------------------------------------+|
  18 |                    || | 📱 +49 176 xxx xx xx              ||
     |                    || | Land: Deutschland                 ||
  19 |                    || | Erste Nachricht: 01.12.2024       ||
     |                    || | Nachrichten: 3                    ||
  20 |                    || | Status: Unbekannt  COMP-010       ||
     |                    || +------------------------------------+|
  21 |                    || | [+Zu Kontakten] [Blockieren] [🗑] ||
     |                    || |      COMP-001 (ActionButtons)     ||
  22 |                    || +------------------------------------+|
  23 +-------------------++---------------------------------------+
     |          [< Zurück zum Dashboard]    [Seite 1/3  < 1 2 3 >]|
  24 +------------------------------------------------------------+
```
