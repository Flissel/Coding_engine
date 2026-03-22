# Display Name Settings

**ID:** `SCREEN-017`
**Route:** `/settings/profile/display-name`
**Layout:** single-column

Formular zum Ändern des Anzeigenamens mit Validierung, Authentication-Hardening-konform mit Audit-Logging und Session-Verifizierung

---

## Components Used

- `COMP-001`
- `COMP-010`
- `COMP-005`

---

## Data Requirements

- `GET /api/settings/profile/display-name`
- `PUT /api/settings/profile/display-name`
- `GET /api/auth/session/verify`
- `POST /api/audit/log`
- `GET /api/auth/hardening-status`

---

## Related User Story

`US-147`

---

## Wireframe

```
     0    5   10   15   20   25   30   35   40   45   50   55   60
   0 +------------------------------------------------------------+
     | [🔒 Authenticated] Session: active | Last: 2m ago         |
   2 |  COMP-010 (AuthStatusIndicator)                            |
     +------------------------------------------------------------+
   4 |                                                            |
     |        ← Back to Profile Settings                         |
   6 |                                                            |
     |        +------------------------------------------+        |
   8 |        | Display Name                             |        |
     |        |  COMP-005 (DisplayNameInput)              |        |
  10 |        | [John Doe________________________]       |        |
     |        +------------------------------------------+        |
  12 |        +------------------------------------------+        |
     |        | COMP-010 (ValidationStatus)               |        |
  14 |        | ✓ 3-25 chars | ✓ No special chars | ✓ OK |        |
     |        +------------------------------------------+        |
  16 |                                                            |
     |        ⚠ Changing your name will be logged for audit      |
  18 |        [Cancel]       [     Save Name     ]               |
     |        COMP-001       COMP-001 (SaveButton)               |
  20 |        (CancelButton)                                     |
     |                                                            |
  22 +------------------------------------------------------------+
     | Audit Trail: Last changed 2024-01-15 by session #a8f3     |
  24 +------------------------------------------------------------+
```
