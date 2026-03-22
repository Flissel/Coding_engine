# Start - Dashboard mit 2FA

**ID:** `SCREEN-001`
**Route:** `/`
**Layout:** stack

Startseite mit Dashboard, Quick-Actions und Recent-Chats. Enthält 2FA-Aktivierung und PIN-Eingabe für die Zwei-Faktor-Authentifizierung mit 6-stelliger PIN.

---

## Components Used

- `COMP-001`
- `COMP-002`
- `COMP-003`
- `COMP-010`

---

## Data Requirements

- `GET /api/auth/2fa/status`
- `POST /api/auth/2fa/enable`
- `POST /api/auth/2fa/verify`
- `POST /api/auth/2fa/disable`
- `GET /api/chats/recent`
- `GET /api/dashboard/quick-actions`

---

## Related User Story

`US-002`

---

## Wireframe

```
     0    5   10   15   20   25   30   35   40   45   50   55   60
   0 +------------------------------------------------------------+
     | 🔒 Zwei-Faktor-Authentifizierung                          |
   1 |  COMP-010 (StatusIndicator)           [2FA Aktivieren]    |
   2 |  Status: ● Aktiv / ○ Inaktiv          COMP-001 (Button)   |
   3 +------------------------------------------------------------+
     |                                                            |
   4 |        Bitte 6-stellige PIN eingeben:                      |
   5 |        +-----+ +-----+ +-----+ +-----+ +-----+ +-----+   |
     |        |  _  | |  _  | |  _  | |  _  | |  _  | |  _  |   |
   6 |        | [1] | | [2] | | [3] | | [4] | | [5] | | [6] |   |
   7 |        +-----+ +-----+ +-----+ +-----+ +-----+ +-----+   |
     |         PIN-Digit Inputs (6x COMP-001 styled)              |
   8 |                                                            |
   9 |             +------------------------+                     |
     |             |   PIN Bestätigen ✓     |                     |
  10 |             |   COMP-001 (Button)    |                     |
  11 |             +------------------------+                     |
     |                                                            |
  12 +------------------------------------------------------------+
  13 | 🔍 [Chats durchsuchen...                              ]   |
     |    COMP-002 (SearchBar)                                    |
  15 +------------------------------------------------------------+
  16 | Recent Chats            COMP-003 (ChatListItem)            |
     +------------------------------------------------------------+
  17 | [Avatar] Max Mustermann           ● online    14:32        |
     |          Letzte Nachricht...        COMP-010               |
  19 |------------------------------------------------------------|
  20 | [Avatar] Anna Schmidt             ● online    13:15        |
     |          Okay, bis dann!            COMP-010               |
  22 |------------------------------------------------------------|
  23 | [Avatar] Team Gruppe              ○ offline   gestern      |
     |          Peter: Neues Update...     COMP-010               |
  25 |------------------------------------------------------------|
  26 | [Avatar] Lisa Weber               ○ offline   gestern      |
     |          Bild gesendet 📷           COMP-010               |
  28 +------------------------------------------------------------+
```
