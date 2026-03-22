# Call Recovery - User Moderation

**ID:** `SCREEN-014`
**Route:** `/calls/video/:callId/recovery`
**Layout:** single-column-centered

Fehlerbehebungs-Screen für Videoanrufe mit integrierten Moderationstools zum Überprüfen gemeldeter Nutzer, Blockieren oder Ablehnen von Meldungen. Zeigt Fehlerstatus, Retry-Optionen und Troubleshooting-Hinweise an.

---

## Components Used

- `COMP-001`
- `COMP-002`
- `COMP-009`
- `COMP-010`
- `COMP-003`

---

## Data Requirements

- `GET /api/calls/video/{callId}/status`
- `POST /api/calls/video/{callId}/retry`
- `GET /api/calls/video/{callId}/troubleshooting`
- `GET /api/moderation/reports?status=pending`
- `GET /api/moderation/reports/{reportId}`
- `POST /api/moderation/reports/{reportId}/block`
- `POST /api/moderation/reports/{reportId}/dismiss`
- `GET /api/users/{userId}/profile`

---

## Related User Story

`US-134`

---

## Wireframe

```
     0    5   10   15   20   25   30   35   40   45   50   55   60
   0 +------------------------------------------------------------+
     |          +----------------------------------------+        |
   1 |          |  ⚠  CALL CONNECTION ERROR               |        |
     |          |  COMP-010 (ErrorStatusIndicator)        |        |
   3 |          |  Status: Connection Lost · Code 5003   |        |
     |          +----------------------------------------+        |
   4 |                    +--------------------+                  |
     |                    | 🔄 Retry Call      |                  |
   5 |                    | COMP-001 (Retry)   |                  |
     |                    +--------------------+                  |
   6 |          Troubleshooting: Check network, restart app       |
     |------------------------------------------------------------|
   7 |  ── MODERATION: REPORTED USERS ──────────────────────────  |
     |                                                            |
   8 |  +------------------------------------------------------+  |
     |  | 🔍 Search reported users...                          |  |
   9 |  | COMP-002 (UserSearchBar)                             |  |
     |  +------------------------------------------------------+  |
  10 |                                                            |
  11 |  +------------------------------------------------------+  |
     |  | 👤 @john_doe    | Reason: Harassment  | ⏱ 2h ago    |  |
  12 |  |  COMP-003 (ReportedUserListItem)        [●pending]   |  |
     |  |------------------------------------------------------|  |
  13 |  | 👤 @toxic_user  | Reason: Spam         | ⏱ 5h ago    |  |
     |  |  COMP-003                                [●pending]   |  |
  14 |  |------------------------------------------------------|  |
     |  | 👤 @bad_actor   | Reason: Threats       | ⏱ 1d ago    |  |
  15 |  |  COMP-003                                [●pending]   |  |
     |  |------------------------------------------------------|  |
  16 |  | 👤 @spammer99   | Reason: Spam         | ⏱ 1d ago    |  |
     |  |  COMP-003                                [●review]   |  |
  17 |  +------------------------------------------------------+  |
     |                                                            |
  18 |  ── SELECTED REPORT DETAIL ──────────────────────────────  |
     |                                                            |
  19 |  +------------------------------------+ +----------------+ |
     |  | 👤 @john_doe                       | |                | |
  20 |  |  Name: John Doe                    | | [🚫 Block User]| |
     |  |  Phone: +49 170 ***1234             | | COMP-001       | |
  21 |  |  Reports: 3 total (2 harassment)   | | (BlockButton)  | |
     |  |  Status: Active                    | |                | |
  22 |  |  Last seen: 10 min ago             | +----------------+ |
     |  |  COMP-009 (ReportedUserDetailCard) | +----------------+ |
  23 |  |                                    | | [✓ Dismiss    ]| |
     |  |  Report Details:                   | | COMP-001       | |
  24 |  |  "Sent threatening messages in     | | (DismissBtn)   | |
     |  |   group chat on 2024-01-15"        | |                | |
  25 |  +------------------------------------+ +----------------+ |
     |                                                            |
  26 +------------------------------------------------------------+
```
