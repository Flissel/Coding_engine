# Kontakt Status Anzeige

**ID:** `SCREEN-019`
**Route:** `/settings/profile/phone`
**Layout:** single-column

Zeigt den Status eines Kontakts an, inklusive Telefonnummer (readonly) und Verifizierungsstatus

---

## Components Used

- `COMP-009`
- `COMP-010`
- `COMP-001`

---

## Data Requirements

- `GET /api/contacts/{contactId}/status`
- `GET /api/settings/profile/phone`

---

## Related User Story

`US-043`

---

## Wireframe

```
     0    5   10   15   20   25   30   35   40   45   50   55   60
   0 +------------------------------------------------------------+
     | [< Zurueck]                                               |
   1 |  COMP-001 (BackButton)                                    |
     +------------------------------------------------------------+
   2 |                                                            |
     |     +------------------------------------------------+    |
   3 |     |          COMP-009 (ContactCard)                 |    |
     |     |                                                 |    |
   4 |     |     +------+                                    |    |
     |     |     |Avatar|   Kontaktname                      |    |
   5 |     |     |      |   ~~~~~~~~~~~~                     |    |
     |     |     +------+                                    |    |
   6 |     |                                                 |    |
     |     |     +--------------------------------------+    |    |
   7 |     |     |  COMP-010 (StatusIndicator)           |    |    |
     |     |     |  [●] Online / Offline / Zuletzt ...   |    |    |
   8 |     |     |  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~   |    |    |
     |     |     +--------------------------------------+    |    |
   9 |     |                                                 |    |
     |     |     Telefonnummer (readonly):                   |    |
  10 |     |     +--------------------------------------+    |    |
     |     |     | +49 170 1234567          [✓ Verifiz.] |    |    |
  11 |     |     +--------------------------------------+    |    |
     |     |                                                 |    |
  12 |     |     Verifizierungsstatus: ✅ Bestätigt           |    |
     |     |                                                 |    |
  13 |     +------------------------------------------------+    |
     |                                                            |
  14 +------------------------------------------------------------+
```
