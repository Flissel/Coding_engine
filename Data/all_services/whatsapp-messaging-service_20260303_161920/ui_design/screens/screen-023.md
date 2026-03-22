# Biometrische Entsperrung

**ID:** `SCREEN-023`
**Route:** `/settings/security/biometrics`
**Layout:** stack

Einstellungsscreen für biometrische Entsperrung mit Toggle zur Aktivierung/Deaktivierung und Berechtigungsverwaltung. Ermöglicht auch den Zugriff auf Video-Sende-Funktionalität über den Chat-Kontext.

---

## Components Used

- `COMP-001`
- `COMP-007`
- `COMP-005`
- `COMP-010`

---

## Data Requirements

- `GET /api/settings/security/biometrics`
- `PUT /api/settings/security/biometrics`
- `GET /api/permissions/biometrics`
- `POST /api/messages/{chatId}/video`

---

## Related User Story

`US-048`

---

## Wireframe

```
     0    5   10   15   20   25   30   35   40   45   50   55   60
   0 +------------------------------------------------------------+
     | [<Back]   Biometrische Entsperrung                        |
   2 |  COMP-001                                                  |
   3 +------------------------------------------------------------+
   4 |      +------------------------------------------------+   |
     |      |  Biometrische Entsperrung       [====O] Toggle  |   |
   6 |      |  COMP-001 (BiometricToggle)                     |   |
     |      +------------------------------------------------+   |
   8 |                                                            |
   9 |      +------------------------------------------------+   |
     |      |  Berechtigungen              COMP-010           |   |
  11 |      |  +-----------+  +---------------------------+   |   |
     |      |  | [●] Kamera |  | [●] Fingerabdruck       |   |   |
  13 |      |  | Erlaubt    |  | Aktiviert               |   |   |
     |      |  +-----------+  +---------------------------+   |   |
  15 |      +------------------------------------------------+   |
  16 |               +------------------------------+             |
     |               |     [Speichern]  COMP-001    |             |
  18 |               +------------------------------+             |
  19 |  - - - - - - - - - - - - - - - - - - - - - - - - - - - -  |
  20 |      +------------------------------------------------+   |
     |      |                                                |   |
  22 |      |        [Video-Vorschau / Player]               |   |
     |      |           COMP-007 (MediaViewer)               |   |
  24 |      |        +------------------+                    |   |
     |      |        |   advancement_bar |  00:32 / 01:15    |   |
  26 |      |        +------------------+                    |   |
     |      +------------------------------------------------+   |
  28 +------------------------------------------------------------+
     | [+] | [Nachricht / Video-Caption eingeben]    | [>Send]    |
  30 |     |       COMP-005 (MessageInput)           | COMP-001   |
     +------------------------------------------------------------+
  32 +------------------------------------------------------------+
```
