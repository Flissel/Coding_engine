# Dashboard - QR-Code Profil

**ID:** `SCREEN-036`
**Route:** `/dashboard`
**Layout:** sidebar

Dashboard-Screen mit QR-Code Profil-Generierung. Der Nutzer kann seinen persönlichen QR-Code generieren, anzeigen und teilen lassen, damit andere sein Profil scannen können.

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
- `GET /api/profile/qr-code`
- `POST /api/profile/qr-code/generate`
- `GET /api/chats`

---

## Related User Story

`US-010`

---

## Wireframe

```
     0    5   10   15   20   25   30   35   40   45   50   55   60
   0 +---------------+--------------------------------------------+
     | [SearchBar]   |                                            |
   1 |  COMP-002     |        Mein QR-Code Profil                 |
   2 | [___________] |   +----------------------------------+     |
     +---------------+   |                                  |     |
   3 | [ChatList]    |   |    +------------------------+    |     |
     |  COMP-003     |   |    |                        |    |     |
   5 | +----------+  |   |    |    ██████████████████   |    |     |
     | | Max M.   |  |   |    |    ██              ██   |    |     |
   7 | | Letzte.. |  |   |    |    ██  ██████████  ██   |    |     |
     | +----------+  |   |    |    ██  ██      ██  ██   |    |     |
   9 | +----------+  |   |    |    ██  ██  QR  ██  ██   |    |     |
     | | Anna K.  |  |   |    |    ██  ██      ██  ██   |    |     |
  11 | | Hallo!.. |  |   |    |    ██  ██████████  ██   |    |     |
     | +----------+  |   |    |    ██              ██   |    |     |
  13 | +----------+  |   |    |    ██████████████████   |    |     |
     | | Tom S.   |  |   |    |                        |    |     |
  15 | | Ok, bis..|  |   |    +------------------------+    |     |
     | +----------+  |   |  COMP-009 (ContactCard + QR)     |     |
  16 |               |   +----------------------------------+     |
     |               |                                            |
  17 |               |   +------------+  +----------+  +-------+ |
     |               |   | [Generate] |  |  [Share] |  | [Save]| |
  18 |               |   | COMP-001   |  | COMP-001 |  |COMP-001 |
     |               |   | QR-Code    |  |  Teilen  |  | Speich| |
  19 |               |   | generieren |  |          |  |  ern  | |
     |               |   +------------+  +----------+  +-------+ |
  20 +---------------+                                            |
     | [●Online]     |   Scanne diesen Code, um mein Profil       |
  21 | COMP-010      |   zu öffnen und mir eine Nachricht          |
     | StatusIndicat.|   zu senden.                                |
  22 +---------------+--------------------------------------------+
```
