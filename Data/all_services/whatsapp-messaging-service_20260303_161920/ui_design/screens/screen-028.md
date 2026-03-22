# SMS/Anruf-Verifizierung

**ID:** `SCREEN-028`
**Route:** `/auth/phone/verify`
**Layout:** centered

Verifizierungsscreen für SMS/Anruf-OTP-Eingabe mit Timer und Resend-Funktion, im Kontext des Dokumentenversands über den WhatsApp Messaging Service

---

## Components Used

- `COMP-001`
- `COMP-010`

---

## Data Requirements

- `POST /api/auth/phone/verify`
- `POST /api/auth/phone/resend`

---

## Related User Story

`US-049`

---

## Wireframe

```
     0    5   10   15   20   25   30   35   40   45   50   55   60
   0 +------------------------------------------------------------+
     |                                                            |
   2 |                                                            |
     |                                                            |
   4 |                    +--------------------+                  |
     |                    |   [WhatsApp Logo]  |                  |
   6 |                    +--------------------+                  |
     |                                                            |
   8 |              Bitte geben Sie den Verifizierungscode        |
     |              ein, den wir Ihnen gesendet haben.            |
  10 |                                                            |
     |            +--------------------------------------+        |
  12 |            | [ ___ ] [ ___ ] [ ___ ] [ ___ ] [ ___] |      |
     |            |          OTP-INPUT (6-stellig)         |      |
  14 |            +--------------------------------------+        |
     |                                                            |
  16 |                  +--------------------+                    |
     |                  | COMP-010           |                    |
  18 |                  | ⏱ Code gültig:    |                    |
     |                  |     01:47          |                    |
  20 |                  | StatusIndicator    |                    |
     |                  +--------------------+                    |
  22 |                                                            |
     |               +----------------------------+               |
  24 |               |    ✓  Verifizieren         |               |
     |               |    COMP-001 (Verify Btn)   |               |
  26 |               +----------------------------+               |
     |                                                            |
  28 |                  +----------------------+                  |
     |                  | ↻ Code erneut senden |                  |
  30 |                  | COMP-001 (Resend Btn)|                  |
     |                  +----------------------+                  |
  32 |                                                            |
     |              ──────── oder ────────                        |
  34 |                                                            |
     |                  +----------------------+                  |
  36 |                  | 📞 Per Anruf erhalten|                  |
     |                  | COMP-001 (Call Btn)  |                  |
  38 |                  +----------------------+                  |
     |                                                            |
  40 +------------------------------------------------------------+
```
