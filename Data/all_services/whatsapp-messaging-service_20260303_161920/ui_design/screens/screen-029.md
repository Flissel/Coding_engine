# PIN-Verifizierung

**ID:** `SCREEN-029`
**Route:** `/settings/security/2fa/verify`
**Layout:** centered

PIN-Eingabe zur Zwei-Faktor-Authentifizierung mit Recovery-Option, um Zugang zu sicherheitsrelevanten Einstellungen wie der Status-Datenschutz-Konfiguration zu erhalten

---

## Components Used

- `COMP-001`
- `COMP-002`
- `COMP-010`

---

## Data Requirements

- `POST /api/settings/security/2fa/verify`
- `POST /api/settings/security/2fa/recovery`
- `GET /api/settings/security/2fa/status`

---

## Related User Story

`US-045`

---

## Wireframe

```
     0    5   10   15   20   25   30   35   40   45   50   55   60
   0 +------------------------------------------------------------+
     |  [<- Zurueck]           Sicherheit                        |
   2 +------------------------------------------------------------+
     |                                                            |
   4 |                    +----------------+                      |
     |                    |   [LockIcon]   |                      |
   6 |                    | COMP-010       |                      |
     |                    | SecurityStatus |                      |
   8 |                    +----------------+                      |
     |                                                            |
  10 |         Bitte gib deine 6-stellige PIN ein                 |
     |                                                            |
  12 |        +------------------------------------+              |
     |        |  [ _ ] [ _ ] [ _ ] [ _ ] [ _ ] [ _ ]|             |
  14 |        |         COMP-002 (PinInput)        |              |
     |        +------------------------------------+              |
  16 |                                                            |
     |              +----------------------------+                |
  18 |              |      PIN bestaetigen       |                |
     |              |   COMP-001 (VerifyButton)  |                |
  20 |              +----------------------------+                |
     |                                                            |
  22 |              +----------------------------+                |
     |              |    PIN vergessen?          |                |
  24 |              | COMP-001 (RecoveryLink)    |                |
     |              +----------------------------+                |
  26 |                                                            |
     |         Du kannst deinen Account auch per                  |
  28 |         E-Mail-Adresse wiederherstellen.                   |
     |                                                            |
  30 +------------------------------------------------------------+
```
