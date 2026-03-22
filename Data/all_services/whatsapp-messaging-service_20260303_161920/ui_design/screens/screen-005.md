# Video Call Screen

**ID:** `SCREEN-005`
**Route:** `/chats/:chatId/video-call`
**Layout:** fullscreen-overlay

Verschlüsselter Videoanruf-Screen mit Kameraansicht, Anrufsteuerung, Kontaktinfo und Verschlüsselungsstatus. Wird aus dem Chat-Detail heraus gestartet oder bei eingehendem Anruf als Overlay angezeigt.

---

## Components Used

- `COMP-001`
- `COMP-009`
- `COMP-010`
- `COMP-007`

---

## Data Requirements

- `GET /api/chats/{chatId}/contact`
- `POST /api/chats/{chatId}/video-call/start`
- `POST /api/chats/{chatId}/video-call/accept`
- `POST /api/chats/{chatId}/video-call/reject`
- `POST /api/chats/{chatId}/video-call/end`
- `WebSocket /ws/video-call/{callId}/signal`
- `GET /api/chats/{chatId}/encryption-status`

---

## Related User Story

`US-036`

---

## Wireframe

```
     0    5   10   15   20   25   30   35   40   45   50   55   60
   0 +------------------------------------------------------------+
     |                  [🔒 End-to-End Encrypted]                 |
   2 |                   COMP-010 (EncryptionStatus)              |
     |               +------------------------------+             |
   3 |               | 👤  Contact Name             |             |
     |               |    +49 170 *** (Mobile)       |             |
   5 |               |    Calling... / 02:34          |             |
     |               |    COMP-009 (ContactCard)     |             |
   7 |               +------------------------------+             |
     |  +--------------------------------------------------------+|
   8 |  |                                          +-----------+ ||
     |  |                                          |           | ||
  10 |  |        REMOTE VIDEO STREAM               | LOCAL PiP | ||
     |  |                                          | COMP-007  | ||
  12 |  |        COMP-007 (MediaViewer)             | (self)    | ||
     |  |                                          |           | ||
  14 |  |                                          +-----------+ ||
     |  |                                                        ||
  16 |  |                                                        ||
     |  |                                                        ||
  18 |  |                                                        ||
     |  |                                                        ||
  20 |  +--------------------------------------------------------+|
     |                                                            |
  22 |    +------+          +------+          +------+  +----+    |
     |    | 🎤   |          | 📞   |          | 📷   |  | 🔄 |    |
  24 |    | Mute |          | End  |          | Cam  |  |Flip|    |
     |    |COMP- |          |COMP- |          |COMP- |  |COMP|    |
  25 |    |001   |          |001   |          |001   |  |001 |    |
     |    +------+          +------+          +------+  +----+    |
  26 +------------------------------------------------------------+
```
