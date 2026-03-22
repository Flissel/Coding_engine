# Chat Info - Chat sperren

**ID:** `SCREEN-011`
**Route:** `/chats/:chatId/info`
**Layout:** single-column

Chat-Info Screen mit Details, Medien und Aktionen. Ermoeglicht das Sperren eines einzelnen Chats mit zusaetzlicher Authentifizierung (PIN/Biometrie). Zeigt Kontaktinformationen, geteilte Medien und Chat-Aktionen an.

---

## Components Used

- `COMP-009`
- `COMP-010`
- `COMP-007`
- `COMP-001`

---

## Data Requirements

- `GET /api/chats/:chatId/info`
- `GET /api/chats/:chatId/media`
- `GET /api/chats/:chatId/lock-status`
- `POST /api/chats/:chatId/lock`
- `POST /api/chats/:chatId/unlock`
- `POST /api/auth/verify-pin`
- `POST /api/auth/verify-biometric`

---

## Related User Story

`US-020`

---

## Wireframe

```
     0    5   10   15   20   25   30   35   40   45   50   55   60
   0 +------------------------------------------------------------+
     |  [<- Back]          Chat Info                              |
   2 |  COMP-001 (BackButton)                                     |
     +------------------------------------------------------------+
   4 |     +--------------------------------------------------+   |
     |     |  +--------+                                      |   |
   6 |     |  | Avatar |   Kontaktname                        |   |
     |     |  |  Foto  |   +49 170 1234567                    |   |
   8 |     |  +--------+   [Online] COMP-010 (StatusIndicator)|   |
     |     |               (StatusIndicator)                  |   |
  10 |     |          COMP-009 (ContactCard)                  |   |
     |     +--------------------------------------------------+   |
  12 |                                                            |
     |  ---- Medien, Links, Dokumente ---------------------------|
  14 |                                                            |
  15 |  +--------------------------------------------------------+|
     |  | [Bild1]  [Bild2]  [Bild3]  [Bild4]  [Bild5]  [>>]     ||
  17 |  |                                                        ||
     |  |  COMP-007 (MediaViewer)                                ||
  19 |  |  Geteilte Medien Vorschau                              ||
     |  +--------------------------------------------------------+|
  21 |                                                            |
     |  ---- Aktionen -------------------------------------------|
  23 |                                                            |
  24 |     +--------------------------------------------------+   |
     |     |  [🔒 Chat sperren]                               |   |
  26 |     |  COMP-001 (LockChatButton)                       |   |
     |     +--------------------------------------------------+   |
  28 |                                                            |
     |  ==========================================================|
  30 |  ||          Authentifizierung erforderlich              |||
     |  ||                                                      |||
  32 |  ||   Um diesen Chat zu sperren, bestaetigen Sie        |||
     |  ||   Ihre Identitaet mit PIN oder Biometrie.           |||
  34 |  ||     +----------------------------------------+      |||
     |  ||     | [✓ Mit PIN/Biometrie bestaetigen]       |      |||
  36 |  ||     |  COMP-001 (ConfirmAuthButton)           |      |||
     |  ||     +----------------------------------------+      |||
  38 |  ||                                                      |||
  39 |  ||     +----------------------------------------+      |||
     |  ||     | [Abbrechen]                             |      |||
  41 |  ||     |  COMP-001 (CancelAuthButton)            |      |||
     |  ||     +----------------------------------------+      |||
  43 |  ||          Auth-Dialog (Modal Overlay)                 |||
     |  ==========================================================|
  45 +------------------------------------------------------------+
```
