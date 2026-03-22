# Account Recovery Dashboard

**ID:** `SCREEN-035`
**Route:** `/dashboard/account-recovery`
**Layout:** single-column

Dashboard screen for account recovery and phone number change after device loss. Allows users to verify identity, recover their account, and update their registered phone number.

---

## Components Used

- `COMP-001`
- `COMP-002`
- `COMP-009`
- `COMP-010`

---

## Data Requirements

- `GET /api/account/recovery/status`
- `POST /api/account/recovery/initiate`
- `POST /api/account/recovery/verify`
- `PUT /api/account/phone-number`
- `GET /api/account/profile`

---

## Related User Story

`US-133`

---

## Wireframe

```
     0    5   10   15   20   25   30   35   40   45   50   55   60
   0 +------------------------------------------------------------+
     |  COMP-010  [StatusIndicator]                              |
   2 |  Recovery Status: [●] Identity Verification Pending       |
     |  Step 2 of 4  =========>-----------  (Progress Bar)       |
   4 +------------------------------------------------------------+
   5 |                                                            |
     |  +--------------------------------------------------------+|
   6 |  | COMP-002  [PhoneNumberSearch]                          ||
     |  | [🔍 Enter your registered or new phone number...    ]  ||
   8 |  +--------------------------------------------------------+|
   9 |                                                            |
     |  +--------------------------------------------------------+|
  10 |  | COMP-009  [AccountInfoCard]                            ||
     |  |                                                        ||
  11 |  |  +--------+  Account Details                           ||
     |  |  | Avatar |  Name:   John Doe                          ||
  12 |  |  |  [👤]  |  Phone:  +49 170 ***-**42 (old)            ||
     |  |  +--------+  Status: Recovery in Progress              ||
  13 |  |                                                        ||
     |  |  +-------------------------------------------------+   ||
  14 |  |  | New Phone Number:                                |   ||
     |  |  | [ +49  ] [  Enter new number__________________ ] |   ||
  15 |  |  +-------------------------------------------------+   ||
     |  |                                                        ||
  16 |  |  Verification Method:                                  ||
     |  |  (●) SMS Code   ( ) Email Link   ( ) Backup Code      ||
  17 |  |                                                        ||
  18 |  |  [ _ ] [ _ ] [ _ ] [ _ ] [ _ ] [ _ ]  (OTP Input)      ||
     |  |                                                        ||
  19 |  +--------------------------------------------------------+|
  20 |                                                            |
     |  +---------------------------+  +-------------------------+|
  21 |  | COMP-001                  |  | COMP-001                ||
     |  | [🔄 Verify & Recover    ] |  | [📱 Change Number     ]||
  22 |  |   (Primary Button)        |  |   (Secondary Button)   ||
     |  +---------------------------+  +-------------------------+|
  23 |                                                            |
     |  +--------------------------------------------------------+|
  24 |  | COMP-001  [ Cancel Recovery ]  (Tertiary/Link Button)  ||
     |  +--------------------------------------------------------+|
  25 +------------------------------------------------------------+
```
