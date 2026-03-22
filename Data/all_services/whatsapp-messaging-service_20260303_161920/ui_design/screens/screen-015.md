# Video Call Edge-Case Handling

**ID:** `SCREEN-015`
**Route:** `/calls/video/:callId/edge-cases`
**Layout:** fullscreen-overlay

Edge-Case Handling Screen für Video-Calls mit End-to-End-Verschlüsselung: zeigt Fallbacks bei Netzwerkproblemen, Gerätewechsel und Verschlüsselungs-Fehlern an. Ermöglicht dem Nutzer, den Verschlüsselungsstatus zu prüfen und bei Problemen Aktionen auszuführen.

---

## Components Used

- `COMP-001`
- `COMP-004`
- `COMP-007`
- `COMP-009`
- `COMP-010`

---

## Data Requirements

- `GET /api/calls/video/{callId}`
- `GET /api/calls/video/{callId}/encryption-status`
- `GET /api/calls/video/{callId}/network-quality`
- `POST /api/calls/video/{callId}/rekey`
- `POST /api/calls/video/{callId}/fallback`
- `GET /api/contacts/{peerId}/keys`

---

## Related User Story

`US-127`

---

## Wireframe

```
     0    5   10   15   20   25   30   35   40   45   50   55   60
   0 +------------------------------------------------------------+
     | 🔒 End-to-End Encrypted  |  Status: ⚠ Key Renegotiation  |
   2 |  COMP-010 (EncryptionStatusIndicator)                      |
     |  [🟡 Verifying...]  Security Code: 48293-19472-83741      |
   3 +------------------------------------------------------------+
   4 +----------------------------------------+-------------------+
     |                                        | [PeerContactCard] |
   5 |   +----------------------------------+ | COMP-009          |
     |   |                                  | |                   |
   6 |   |    VIDEO FALLBACK AREA           | | 👤 John Doe       |
     |   |                                  | | +49 170 ****123   |
   8 |   |   ⚠ Network Degraded             | | 🔑 Key: Verified  |
     |   |   Switching to audio-only...      | | 📱 Device: iPhone |
  10 |   |                                  | | 🔄 Device Changed |
     |   |   COMP-007 (VideoFallbackViewer) | +-------------------+
  12 |   |                                  | | [EdgeCaseNotif]   |
     |   |   [🔇 Camera Off Fallback]       | | COMP-004          |
  13 |   |   [📶 Low bandwidth: 120kbps]    | |                   |
  14 |   +----------------------------------+ | ⚠ Peer device     |
     |                                        | changed. New key  |
  16 |                                        | exchange needed.  |
     |                                        | Trust new device? |
  17 +----------------------------------------+-------------------+
  18 +------------------------------------------------------------+
     |                    ACTION BUTTONS                          |
  19 |  COMP-001                                                  |
     |                                                            |
  20 | [🔄 Re-establish]  [📞 Audio Only]  [🔑 Verify Keys]      |
     |   Encryption         Fallback          Manually            |
  22 |                                                            |
     | [❌ End Call]                    [⚙ Connection Settings]   |
  24 +------------------------------------------------------------+
```
