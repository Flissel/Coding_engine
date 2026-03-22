# Hilfe & Support

**ID:** `SCREEN-010`
**Route:** `/settings/help`
**Layout:** stack

Hilfe-Screen mit FAQ-Bereich, Support-Kontakt und Passkey-Anmeldehilfe. Nutzer koennen haeufig gestellte Fragen durchsuchen, Anleitungen zur Passkey-Einrichtung finden und den Support kontaktieren.

---

## Components Used

- `COMP-001`
- `COMP-002`
- `COMP-003`
- `COMP-010`

---

## Data Requirements

- `GET /api/help/faq`
- `GET /api/help/faq?q={searchTerm}`
- `GET /api/help/faq/passkey`
- `GET /api/auth/passkey/status`
- `POST /api/help/support/ticket`

---

## Related User Story

`US-005`

---

## Wireframe

```
     0    5   10   15   20   25   30   35   40   45   50   55   60
   0 +------------------------------------------------------------+
     | [<Back]   Hilfe & Support                                  |
   2 | COMP-001                                                   |
     +------------------------------------------------------------+
   3 | [🔍 FAQ durchsuchen...                                   ] |
     |  COMP-002 (FAQSearchBar)                                   |
   5 +------------------------------------------------------------+
     |  Haeufig gestellte Fragen                                  |
   7 +------------------------------------------------------------+
     | +--------------------------------------------------------+ |
   8 | | ▶ Was ist ein Passkey und wie richte ich ihn ein?       | |
     | |   COMP-003 (FAQListItem)                               | |
   9 | +--------------------------------------------------------+ |
     | +--------------------------------------------------------+ |
  10 | | ▶ Passkey-Anmeldung funktioniert nicht – was tun?       | |
     | |   COMP-003 (FAQListItem)                               | |
  11 | +--------------------------------------------------------+ |
     | +--------------------------------------------------------+ |
  12 | | ▶ Kann ich mehrere Passkeys registrieren?               | |
     | |   COMP-003 (FAQListItem)                               | |
  13 | +--------------------------------------------------------+ |
     | +--------------------------------------------------------+ |
  14 | | ▶ Wie loesche ich einen gespeicherten Passkey?          | |
     | |   COMP-003 (FAQListItem)                               | |
  15 | +--------------------------------------------------------+ |
     | +--------------------------------------------------------+ |
  16 | | ▶ Welche Geraete unterstuetzen Passkeys?                | |
     | |   COMP-003 (FAQListItem)                               | |
  17 | +--------------------------------------------------------+ |
     | +--------------------------------------------------------+ |
  18 | | ▶ Wie aendere ich mein Passwort?                        | |
     | |   COMP-003 (FAQListItem)                               | |
  19 | +--------------------------------------------------------+ |
     | +--------------------------------------------------------+ |
  20 | | ▶ Nachrichten werden nicht zugestellt                    | |
     | |   COMP-003 (FAQListItem)                               | |
  21 | +--------------------------------------------------------+ |
  22 +------------------------------------------------------------+
     | 🔑 Passkey: ● Aktiv        |  [  Support kontaktieren   ] |
     | COMP-010 (StatusIndicator)  |  COMP-001-2 (Button)        |
  24 +------------------------------------------------------------+
```
