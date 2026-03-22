# Geräte-Verwaltung

**ID:** `SCREEN-009`
**Route:** `/settings/devices`
**Layout:** stack

Übersicht und Verwaltung aller verknüpften Geräte des Nutzers. Zeigt aktive Sessions, erlaubt das Entfernen von Geräten und das Verknüpfen neuer Geräte via QR-Code oder Telefonnummer-Verifizierung.

---

## Components Used

- `COMP-001`
- `COMP-002`
- `COMP-003`
- `COMP-010`

---

## Data Requirements

- `GET /api/settings/devices`
- `POST /api/settings/devices/link`
- `DELETE /api/settings/devices/{deviceId}`
- `POST /api/auth/verify-phone`
- `POST /api/auth/verify-code`

---

## Related User Story

`US-001`

---

## Wireframe

```
     0    5   10   15   20   25   30   35   40   45   50   55   60
   0 +------------------------------------------------------------+
     | [< Back]       Verknüpfte Geräte       [+ Gerät verknüpfen]|
   1 |  COMP-001                                    COMP-001      |
   2 |                                          (LinkDeviceBtn)   |
   3 +------------------------------------------------------------+
     | [🔍 Gerät suchen...]                                       |
   4 |  COMP-002 (DeviceSearchBar)                                |
   5 |                                                            |
   6 +------------------------------------------------------------+
   7 |  DIESES GERÄT                                              |
   8 |  +--------------------------------------------------------+|
   9 |  | 📱 iPhone 14 Pro          COMP-010 (StatusIndicator)   ||
  10 |  |    ● Aktiv  ·  Zuletzt: Jetzt  ·  +49 170 ****1234    ||
  11 |  +--------------------------------------------------------+|
  12 +------------------------------------------------------------+
  13 |  VERKNÜPFTE GERÄTE                                         |
  14 |  +--------------------------------------------------------+|
  15 |  | 💻 WhatsApp Web - Chrome    · Aktiv seit 12.01.2025    ||
  16 |  |    COMP-003 (LinkedDeviceItem)        ● Online         ||
  17 +--+--------------------------------------------------------+|
  18 |  | 🖥️  WhatsApp Desktop - Mac   · Aktiv seit 05.01.2025   ||
  19 |  |    COMP-003 (LinkedDeviceItem)        ○ Offline        ||
  20 |  |                                      Zuletzt: 2 Std   ||
  21 +--+--------------------------------------------------------+|
  22 |  | 📱 WhatsApp Web - Firefox   · Aktiv seit 20.12.2024    ||
  23 |  |    COMP-003 (LinkedDeviceItem)        ○ Offline        ||
  24 |  |                                      Zuletzt: 3 Tage  ||
  25 +--+--------------------------------------------------------+|
  26 |                                                            |
  27 |          [  Von allen Geräten abmelden  ]                  |
  28 |                    COMP-001 (LogOutAllBtn)                  |
  29 +------------------------------------------------------------+
```
