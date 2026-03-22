# QR-Code Profil

**ID:** `SCREEN-020`
**Route:** `/settings/profile/qr`
**Layout:** single

QR-Code Profilseite mit Möglichkeit den eigenen QR-Code zu teilen oder einen QR-Code zu scannen. Enthält auch Schnellzugriff auf Voice/Video-Call-Funktionen mit Steuerung für Mute, Kamera und Lautsprecher.

---

## Components Used

- `COMP-001`
- `COMP-009`
- `COMP-010`

---

## Data Requirements

- `GET /api/settings/profile`
- `GET /api/settings/profile/qr-code`
- `POST /api/calls/voice`
- `POST /api/calls/video`
- `PUT /api/calls/{id}/mute`
- `PUT /api/calls/{id}/camera`
- `PUT /api/calls/{id}/speaker`

---

## Related User Story

`US-137`

---

## Wireframe

```
     0    5   10   15   20   25   30   35   40   45   50   55   60
   0 +------------------------------------------------------------+
     |  [<Back]     QR-Code Profil            [···Menu]          |
   2 |                    HeaderBar                               |
     +------------------------------------------------------------+
   4 |          +----------------------------------------+        |
     |          |  [Avatar]   Benutzername                |        |
   6 |          |  COMP-009   +--------COMP-010--------+ |        |
     |          |  ContactCard| StatusIndicator: Online| |        |
   8 |          |             +------------------------+ |        |
     |          +----------------------------------------+        |
  10 |                                                            |
     |               +----------------------------+               |
  12 |               |                            |               |
     |               |                            |               |
  14 |               |      ██████████████        |               |
     |               |      ██ QR-CODE  ██        |               |
  16 |               |      ██          ██        |               |
     |               |      ██████████████        |               |
  18 |               |                            |               |
     |               |     QR-Code Display        |               |
  20 |               |                            |               |
     |               +----------------------------+               |
  22 |                                                            |
     |                                                            |
  24 |                                                            |
     |                                                            |
  26 |   +---------------+ +---------------+ +---------------+   |
     |   | 📤 Share      | | 📷 Scan       | | 📞 Voice Call |   |
  28 |   | COMP-001      | | COMP-001      | | COMP-001      |   |
     |   +---------------+ +---------------+ +---------------+   |
  30 |                                                            |
     +------------------------------------------------------------+
  32 |   +----------+    +----------+    +----------+             |
     |   | 🔇 Mute  |    | 📹 Camera|    | 🔊Speaker|             |
  34 |   | COMP-001 |    | COMP-001 |    | COMP-001 |             |
     |   +----------+    +----------+    +----------+             |
  36 |              Call Controls Bar                             |
     +------------------------------------------------------------+
```
