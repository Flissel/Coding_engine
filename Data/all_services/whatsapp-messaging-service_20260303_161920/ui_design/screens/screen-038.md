# Dashboard - Sprachnachricht

**ID:** `SCREEN-038`
**Route:** `/dashboard`
**Layout:** split

Dashboard-Ansicht mit Chat-Liste und aktivem Chat-Fenster inkl. Sprachnachricht-Aufnahme und -Versand

---

## Components Used

- `COMP-002`
- `COMP-003`
- `COMP-004`
- `COMP-005`
- `COMP-006`
- `COMP-010`

---

## Data Requirements

- `GET /api/chats`
- `GET /api/chats/{id}/messages`
- `POST /api/chats/{id}/messages/voice`
- `GET /api/contacts/{id}/status`

---

## Related User Story

`US-012`

---

## Wireframe

```
     0    5   10   15   20   25   30   35   40   45   50   55   60
   0 +------------------+------------------------------------------+
     | [🔍 Search...   ]| [Avatar] Max Mustermann                  |
   2 |  COMP-002        |  COMP-010 ● Online    StatusIndicator    |
     +------------------+------------------------------------------+
   3 | [ChatListItem]   |                                          |
     | +==============+ |  +------------------------------------+  |
   5 | | 📷 Anna B.   | |  | Hallo, wie geht's?       14:02   |  |
     | |  Letzte Nach.| |  |          COMP-004 (incoming)      |  |
   7 | | COMP-003     | |  +------------------------------------+  |
     | +--------------+ |                                          |
   9 | | 📷 Max M.    | |       +-----------------------------+   |
     | |  Sprachnach..| |       | 🎤 Sprachnachricht 0:23     |   |
  11 | | COMP-003     | |       |  ▶ ━━━━━━━━━━━━━ 14:05  ✓✓  |   |
     | +--------------+ |       |     COMP-004 (outgoing/voice)|   |
  13 | | 📷 Lisa K.   | |       +-----------------------------+   |
     | |  Hallo!      | |                                          |
  15 | | COMP-003     | |  +------------------------------------+  |
     | +--------------+ |  | Gut, danke! Und dir?     14:07   |  |
  17 | | 📷 Tom S.    | |  |          COMP-004 (incoming)      |  |
     | |  Ok, bis dann| |  +------------------------------------+  |
  19 | | COMP-003     | |                                          |
     +------------------+------------------------------+-----------+
  20 |                  | [💬 Nachricht eingeben... ] | [🎤 REC ] |
     |                  |  COMP-005 MessageInput       | COMP-006  |
  22 |                  |                              | VoiceRec  |
     |                  |  [😀] [📎]  [Send ➤]        | [⏹ Stop] |
  24 +------------------+------------------------------+-----------+
```
