# Support kontaktieren - Profilbild

**ID:** `SCREEN-027`
**Route:** `/settings/help/support`
**Layout:** stack

Support-Kontaktformular mit Profilbild-Upload-Funktion. Nutzer können ein Profilbild hochladen, anzeigen, ersetzen oder entfernen und bei Problemen den Support kontaktieren.

---

## Components Used

- `COMP-001`
- `COMP-007`
- `COMP-005`
- `COMP-010`

---

## Data Requirements

- `GET /api/user/profile-picture`
- `POST /api/user/profile-picture`
- `PUT /api/user/profile-picture`
- `DELETE /api/user/profile-picture`
- `POST /api/support/contact`
- `POST /api/support/contact/attachments`

---

## Related User Story

`US-006`

---

## Wireframe

```
     0    5   10   15   20   25   30   35   40   45   50   55   60
   0 +------------------------------------------------------------+
     |  [<- Zurück]    Support kontaktieren        [X Schließen] |
   2 |                     Profilbild                             |
     |  Header Bar                                               |
   4 +------------------------------------------------------------+
   5 |  COMP-010 [StatusIndicator: ● Online / Upload-Status]     |
     |  "Profilbild aktiv" / "Kein Profilbild gesetzt"           |
   7 +------------------------------------------------------------+
   8 |               +----------------------------+               |
     |               |                            |               |
  10 |               |                            |               |
     |               |    [Profilbild-Vorschau]    |               |
  12 |               |     COMP-007 MediaViewer    |               |
     |               |                            |               |
  14 |               |      +------------+        |               |
     |               |      | 👤 Bild    |        |               |
  16 |               |      | oder       |        |               |
     |               |      | Platzhalter|        |               |
  18 |               |      +------------+        |               |
     |               +----------------------------+               |
  20 +------------------------------------------------------------+
  21 |  +---------------+ +---------------+ +----------------+    |
     |  | 📤 Hochladen  | | 🔄 Ersetzen  | | 🗑️ Entfernen   |    |
  23 |  |  COMP-001     | |  COMP-001     | |  COMP-001      |    |
     |  +---------------+ +---------------+ +----------------+    |
  25 +------------------------------------------------------------+
  26 |  Support-Nachricht:                                        |
     |  +------------------------------------------------------+  |
  28 |  |                                                      |  |
     |  |  COMP-005 MessageInput                               |  |
  30 |  |  Beschreiben Sie Ihr Anliegen zum Profilbild...      |  |
     |  +------------------------------------------------------+  |
  32 +------------------------------------------------------------+
  33 |  +----------------+                  +------------------+  |
     |  | 📎 Anhang      |                  | ✉️ Absenden      |  |
  35 |  |  COMP-001      |                  |  COMP-001        |  |
     |  +----------------+                  +------------------+  |
  37 +------------------------------------------------------------+
```
