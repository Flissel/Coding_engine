# Zwei-Faktor-Authentifizierung

**ID:** `SCREEN-022`
**Route:** `/settings/security/2fa`
**Layout:** single-column

Einstellungsseite zur Aktivierung und Konfiguration der Zwei-Faktor-Authentifizierung (2FA) mit Toggle und PIN-Setup, um Multi-Device Support abzusichern

---

## Components Used

- `COMP-001`
- `COMP-010`

---

## Data Requirements

- `GET /api/settings/security/2fa`
- `PUT /api/settings/security/2fa`
- `POST /api/settings/security/2fa/verify-pin`
- `GET /api/devices`

---

## Related User Story

`US-004`

---

## Wireframe

```
     0    5   10   15   20   25   30   35   40   45   50   55   60
   0 +------------------------------------------------------------+
     |  [<Back]     Zwei-Faktor-Authentifizierung                 |
   2 |                    Header Bar                              |
     +------------------------------------------------------------+
   4 |                                                            |
     |                                                            |
   6 |    +--------------------------------------------------+    |
     |    | COMP-010  StatusIndicator                         |    |
   8 |    | Status: [●] 2FA ist aktiv    Sicher seit 12.03.25 |    |
     |    +--------------------------------------------------+    |
  10 |    +--------------------------------------------------+    |
     |    |  Zwei-Faktor-Authentifizierung aktivieren         |    |
  12 |    |                                  [ ○===ON ]       |    |
     |    +--------------------------------------------------+    |
  14 |                                                            |
     |    - - - - - - PIN Setup - - - - - - - - - - - - - -       |
  16 |    +--------------------------------------------------+    |
     |    |  6-stellige PIN eingeben:                        |    |
  18 |    |  [ _ ] [ _ ] [ _ ] [ _ ] [ _ ] [ _ ]             |    |
     |    +--------------------------------------------------+    |
  20 |    +--------------------------------------------------+    |
     |    |  PIN bestaetigen:                                |    |
  22 |    |  [ _ ] [ _ ] [ _ ] [ _ ] [ _ ] [ _ ]             |    |
     |    +--------------------------------------------------+    |
  24 |                                                            |
     |    - - - - - Verbundene Geraete - - - - - - - - - -        |
  26 |    +--------------------------------------------------+    |
     |    | 📱 iPhone 14 Pro      aktiv jetzt    [Entfernen] |    |
  28 |    |--------------------------------------------------|    |
     |    | 💻 MacBook Pro        aktiv vor 2h   [Entfernen] |    |
  30 |    |--------------------------------------------------|    |
     |    | 🖥  Web Browser        aktiv vor 1d   [Entfernen] |    |
  32 |    +--------------------------------------------------+    |
     |                                                            |
  34 |                                                            |
  35 |              +----------------------------+                |
     |              |  COMP-001  Button           |                |
  37 |              |  [ 2FA Aktivieren & Sichern ]|                |
     |              +----------------------------+                |
  39 |                                                            |
  40 +------------------------------------------------------------+
```
