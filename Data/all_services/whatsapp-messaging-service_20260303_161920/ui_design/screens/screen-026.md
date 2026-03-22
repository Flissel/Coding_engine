# Neues Geraet verbinden

**ID:** `SCREEN-026`
**Route:** `/settings/devices/link`
**Layout:** single-column-centered

Screen zum Verbinden eines neuen Geraets via QR-Code-Scan und Pairing. Enthaelt Compliance- und Datenschutzhinweise gemaess GDPR/CCPA fuer die Geraeteverknuepfung, sowie Status-Anzeige des Pairing-Vorgangs.

---

## Components Used

- `COMP-001`
- `COMP-010`
- `COMP-009`

---

## Data Requirements

- `GET /api/settings/devices`
- `POST /api/settings/devices/link`
- `GET /api/settings/devices/qr-code`
- `GET /api/compliance/consent-status`
- `POST /api/compliance/consent`
- `GET /api/compliance/privacy-policy`

---

## Related User Story

`US-149`

---

## Wireframe

```
     0    5   10   15   20   25   30   35   40   45   50   55   60
   0 +------------------------------------------------------------+
     |  [<- Zurueck]       Neues Geraet verbinden                 |
   2 +------------------------------------------------------------+
     |                                                            |
   3 |            +------------------------+                      |
     |            | COMP-010 (PairingStatus)|                      |
   5 |            | Status: Warte auf Scan |                      |
     |            +------------------------+                      |
   6 |                                                            |
     |     +------------------------------------------+           |
   7 |     |  COMP-009 (ComplianceInfoCard)            |           |
     |     |                                          |           |
   8 |     |  +------------------------------------+  |           |
     |     |  |  +------+                          |  |           |
   9 |     |  |  | QR   |  Scannen Sie diesen      |  |           |
     |     |  |  | CODE |  QR-Code mit Ihrem       |  |           |
  10 |     |  |  |      |  neuen Geraet.           |  |           |
     |     |  |  +------+                          |  |           |
  11 |     |  +------------------------------------+  |           |
     |     |  GDPR/CCPA: Daten werden Ende-zu-Ende   |           |
  12 |     |  verschluesselt. Geraetedaten werden     |           |
     |     |  gemaess Datenschutzrichtlinie verarbeitet|           |
  13 |     +------------------------------------------+           |
     |                                                            |
  14 |            +------------------------+                      |
     |            | [Pairing starten]      |                      |
  15 |            |  COMP-001              |                      |
     |            | (StartPairingBtn)      |                      |
  16 |            +------------------------+                      |
     |                                                            |
  17 |            +------------------------+                      |
     |            | [Abbrechen]            |                      |
  18 |            |  COMP-001              |                      |
     |            | (CancelBtn)            |                      |
  19 |            +------------------------+                      |
     |                                                            |
  20 |            +------------------------+                      |
     |            | [Datenschutzerklaerung] |                      |
  21 |            |  COMP-001              |                      |
     |            | (PrivacyPolicyLink)    |                      |
  22 |            +------------------------+                      |
     |                                                            |
  23 |  [ ] Ich stimme der Verarbeitung meiner Geraetedaten zu    |
     |      gemaess GDPR/CCPA (Einwilligung erforderlich)         |
  24 +------------------------------------------------------------+
```
