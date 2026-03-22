# Notification Settings

**ID:** `SCREEN-004`
**Route:** `/settings/notifications`
**Layout:** stack

Konfiguration von Push-Benachrichtigungen mit globalen Einstellungen, per-Chat und per-Typ Steuerung fuer neue Nachrichten

---

## Components Used

- `COMP-001`
- `COMP-002`
- `COMP-003`
- `COMP-010`

---

## Data Requirements

- `GET /api/settings/notifications`
- `PUT /api/settings/notifications`
- `GET /api/settings/notifications/chats`
- `PUT /api/settings/notifications/chats/{chatId}`
- `GET /api/chats`

---

## Related User Story

`US-129`

---

## Wireframe

```
     0    5   10   15   20   25   30   35   40   45   50   55   60
   0 +------------------------------------------------------------+
     | [< Back]     Notification Settings          [Save]        |
   2 |  COMP-001 (BackButton)                COMP-001 (SaveBtn)  |
     +------------------------------------------------------------+
   4 | +--------------------------------------------------------+ |
     | | COMP-010 (StatusIndicator)                              | |
   6 | | [●] Push Notifications:  ENABLED        [Master Toggle] | |
     | +--------------------------------------------------------+ |
   8 | +--------------------------------------------------------+ |
     | |  NOTIFICATION TYPE CONTROLS                            | |
  10 | |  ┌──────────────────────────────────────────────────┐  | |
     | |  │ [Toggle] Private Messages          [====ON ]     │  | |
  12 | |  │ [Toggle] Group Messages             [====ON ]     │  | |
     | |  │ [Toggle] Media Messages             [====ON ]     │  | |
  14 | |  │ [Toggle] Voice Messages             [  OFF==]     │  | |
     | |  │ [Toggle] Status Updates             [  OFF==]     │  | |
  16 | |  │ [Toggle] Sound                      [====ON ]     │  | |
     | |  │ [Toggle] Vibration                  [====ON ]     │  | |
  18 | |  └──────────────────────────────────────────────────┘  | |
     | |  COMP-001 (Toggle Buttons per Type)                    | |
  20 | +--------------------------------------------------------+ |
  21 | +--------------------------------------------------------+ |
     | | [🔍 Search chats...]                                   | |
  23 | |  COMP-002 (ChatSearchBar)                              | |
     | +--------------------------------------------------------+ |
  24 | +--------------------------------------------------------+ |
     | |  PER-CHAT NOTIFICATION CONTROLS                        | |
  26 | |  ┌────────────────────────────────────────────────────┐| |
     | |  │ [Avatar] John Doe          [●Online] [====ON ]     │| |
  28 | |  │  COMP-003    COMP-010(status) COMP-001(toggle)     │| |
     | |  ├────────────────────────────────────────────────────┤| |
  30 | |  │ [Avatar] Family Group       [        ] [====ON ]   │| |
     | |  │  COMP-003                     COMP-001(toggle)     │| |
  32 | |  ├────────────────────────────────────────────────────┤| |
     | |  │ [Avatar] Work Team          [●Online] [  OFF==]    │| |
  34 | |  │  COMP-003    COMP-010(status) COMP-001(toggle)     │| |
     | |  ├────────────────────────────────────────────────────┤| |
  36 | |  │ [Avatar] Alice Smith         [        ] [====ON ]   │| |
     | |  │  COMP-003                     COMP-001(toggle)     │| |
  38 | |  ├────────────────────────────────────────────────────┤| |
     | |  │ [Avatar] Project Alpha      [●Online] [  OFF==]    │| |
  40 | |  │  COMP-003    COMP-010(status) COMP-001(toggle)     │| |
     | |  └────────────────────────────────────────────────────┘| |
  42 | +--------------------------------------------------------+ |
     +------------------------------------------------------------+
```
