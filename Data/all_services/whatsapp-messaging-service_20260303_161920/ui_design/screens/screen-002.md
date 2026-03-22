# Chat List & Messaging

**ID:** `SCREEN-002`
**Route:** `/chats`
**Layout:** split

Chat-Übersicht mit Suchmöglichkeit und aktivem Chat-Fenster zum Senden von Textnachrichten in Echtzeit

---

## Components Used

- `COMP-002`
- `COMP-003`
- `COMP-004`
- `COMP-005`
- `COMP-008`
- `COMP-010`

---

## Data Requirements

- `GET /api/chats`
- `GET /api/chats/{chatId}/messages`
- `POST /api/chats/{chatId}/messages`
- `GET /api/users/{userId}/status`
- `WS /ws/chats/{chatId}`

---

## Related User Story

`US-011`

---

## Wireframe

```
     0    5   10   15   20   25   30   35   40   45   50   55   60
   0 +-------------------+----------------------------------------+
     | [🔍 Search...   ] | [Avatar] Max Mustermann                |
   2 |  COMP-002         |  COMP-010 ● Online    [📞] [📎] [⋮]  |
     +-------------------+----------------------------------------+
   3 | [ChatListItem]    |                                        |
     | +---------------+ |  +----------------------------------+  |
   5 | | 👤 Anna B.    | |  |  Hallo, wie geht's?       14:01 |  |
     | | Letzte Nachr..| |  |  COMP-004 (received)             |  |
   7 | | 14:32  ✓✓  2  | |  +----------------------------------+  |
     | +---------------+ |                                        |
   9 | +---------------+ |         +---------------------------+   |
     | | 👤 Max M.     | |         | Mir geht's gut, danke!   |   |
  11 | | Hey, schau... | |         | 14:02  ✓✓                |   |
     | | 13:15  ✓✓     | |         | COMP-004 (sent)          |   |
  13 | +---------------+ |         +---------------------------+   |
     | +---------------+ |                                        |
  15 | | 👤 Gruppe Dev | |  +----------------------------------+  |
     | | Tom: Build... | |  |  Hast du Zeit heute Abend? 14:05 |  |
  17 | | 12:00  ✓✓     | |  |  COMP-004 (received)             |  |
     | +---------------+ |  +----------------------------------+  |
  19 | |  COMP-003     | |                                        |
     | | (weitere      | +----------------------------------------+
  20 | |  Chats...)    | | [😀]  [Nachricht eingeben...   ] [➤]  |
     | |               | | COMP  COMP-005                         |
  22 | |               | | -008  (MessageInput)                    |
     +-------------------+----------------------------------------+
  24 +------------------------------------------------------------+
```
