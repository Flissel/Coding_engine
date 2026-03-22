# Multi-Device Übersicht

**ID:** `SCREEN-025`
**Route:** `/settings/devices/overview`
**Layout:** single-column

Übersicht aller verbundenen Geräte mit Status, letzter Aktivität und Media-Upload-Durchsatz-Indikatoren zur Validierung von Upload-Performance unter Last

---

## Components Used

- `COMP-001`
- `COMP-002`
- `COMP-003`
- `COMP-010`

---

## Data Requirements

- `GET /api/settings/devices`
- `GET /api/settings/devices/{deviceId}/status`
- `GET /api/settings/devices/{deviceId}/media-throughput`
- `GET /api/metrics/media-upload/throughput-summary`
- `DELETE /api/settings/devices/{deviceId}`

---

## Related User Story

`US-141`

---

## Wireframe

```
     0    5   10   15   20   25   30   35   40   45   50   55   60
   0 +------------------------------------------------------------+
     |  [<- Back]   Multi-Device Übersicht     [Refresh][+Add]  |
   2 |  COMP-001 (ActionBar)                                     |
     +------------------------------------------------------------+
   4 |  [🔍 Search devices by name or ID...                   ] |
     |  COMP-002 (SearchBar)                                     |
   6 +------------------------------------------------------------+
   7 |  ┌─ Upload Throughput Summary ─────────────────────────┐  |
     |  │  ● Current:  12.4 MB/s    Peak: 48.2 MB/s          │  |
   9 |  │  ● Avg Completion: 2.3s   Under Load: 5.1s         │  |
     |  │  COMP-010 (StatusIndicator)  Status: [● Normal]     │  |
  11 |  └─────────────────────────────────────────────────────┘  |
  12 +------------------------------------------------------------+
     |  Connected Devices (3)                    [Sort: Recent ▼] |
  14 |  +--------------------------------------------------------+|
     |  | 📱 iPhone 14 Pro          COMP-003 (DeviceListItem)   ||
  16 |  |    Status: [● Online]  COMP-010   Last: 2 min ago     ||
     |  |    Upload: 14.2 MB/s | Completion: 1.8s | Load: Norm  ||
  18 |  +--------------------------------------------------------+|
     |  | 💻 MacBook Pro 16"        COMP-003 (DeviceListItem)   ||
  20 |  |    Status: [● Online]  COMP-010   Last: Just now      ||
     |  |    Upload: 22.1 MB/s | Completion: 0.9s | Load: Norm  ||
  22 |  +--------------------------------------------------------+|
     |  | 🌐 WhatsApp Web           COMP-003 (DeviceListItem)   ||
  24 |  |    Status: [○ Idle]    COMP-010   Last: 1 hour ago    ||
     |  |    Upload:  3.8 MB/s | Completion: 4.2s | Load: Peak  ||
  26 +------------------------------------------------------------+
```
