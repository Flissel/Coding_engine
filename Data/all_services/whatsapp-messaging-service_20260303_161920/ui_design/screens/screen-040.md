# Dashboard - Nachricht loeschen

**ID:** `SCREEN-040`
**Route:** `/dashboard`
**Layout:** split

Dashboard mit Chat-Liste und Chat-Ansicht. Ermoeglicht das Loeschen gesendeter oder empfangener Nachrichten ueber ein Kontextmenue an jeder ChatBubble.

---

## Components Used

- `COMP-001`
- `COMP-002`
- `COMP-003`
- `COMP-004`
- `COMP-005`
- `COMP-010`

---

## Data Requirements

- `GET /api/chats`
- `GET /api/chats/{chatId}/messages`
- `DELETE /api/messages/{messageId}`
- `DELETE /api/messages/{messageId}?forEveryone=true`

---

## Related User Story

`US-013`

---

## Wireframe

```
     0    5   10   15   20   25   30   35   40   45   50   55   60
   0 +------------------+------------------------------------------+
     | [SearchBar]      | [ContactName]   [StatusIndicator] Online |
   2 |  COMP-002        |  COMP-010                                |
     +------------------+------------------------------------------+
   3 | [ChatListItem]   |                                          |
     |  COMP-003        |  +--------------------------------------+|
   5 | +==============+ |  |  [Hallo, wie geht's?]     10:01  <- ||
     | | Anna Mueller | |  |        COMP-004 (received)           ||
   7 | | Letzte Nachr.| |  |                                      ||
     | | 10:05        | |  |  -> 10:03  [Mir geht es gut!]        ||
   9 | +==============+ |  |        COMP-004 (sent)                ||
     | +--------------+ |  |        +--------------------+        ||
  11 | | Max Schmidt  | |  |        | [Nachricht loeschen] |       ||
     | | Hey!         | |  |        |  COMP-001            |       ||
  13 | | 09:45        | |  |        | [Fuer mich loeschen] |       ||
     | +--------------+ |  |        | [Fuer alle loeschen] |       ||
  15 | +--------------+ |  |        +--------------------+        ||
     | | Gruppe Dev   | |  |                                      ||
  17 | | Meeting...   | |  |  -> 10:05  [Bis spaeter!]            ||
     | | 09:30        | |  |        COMP-004 (sent)                ||
  19 | +--------------+ |  |                                      ||
     |                  |  +--------------------------------------+|
  21 +------------------+------------------------------------------+
     |                  | [MessageInput: Nachricht eingeben] [Send]|
  23 |                  |  COMP-005                                |
  24 +------------------+------------------------------------------+
```
