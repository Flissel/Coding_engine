# Profilbild / Biometrische Entsperrung

**ID:** `SCREEN-016`
**Route:** `/settings/profile/avatar`
**Layout:** stack

Screen zum Hochladen, Zuschneiden und Vorschauen des Profilbilds. Zugang erfordert biometrische Authentifizierung (Fingerabdruck oder Face ID). Nach erfolgreicher Entsperrung wird der Avatar-Editor angezeigt.

---

## Components Used

- `COMP-001`
- `COMP-007`
- `COMP-010`

---

## Data Requirements

- `GET /api/settings/profile/avatar`
- `POST /api/settings/profile/avatar/upload`
- `PUT /api/settings/profile/avatar/crop`
- `POST /api/auth/biometric/verify`

---

## Related User Story

`US-003`

---

## Wireframe

```
     0    5   10   15   20   25   30   35   40   45   50   55   60
   0 +------------------------------------------------------------+
     |  [🔒 Biometrische Entsperrung]                            |
   2 |  COMP-010 (BiometricStatus)                                |
     |  Status: ✅ Entsperrt via Face ID / Fingerabdruck         |
   4 +------------------------------------------------------------+
     |                                                            |
   5 |     +------------------------------------------------+    |
     |     |                                                |    |
   7 |     |                                                |    |
     |     |                                                |    |
   9 |     |          +------------------+                  |    |
     |     |          |                  |                  |    |
  11 |     |          |   [Profilbild]   |                  |    |
     |     |          |    Vorschau /    |                  |    |
  13 |     |          |    Zuschnitt     |                  |    |
     |     |          |                  |                  |    |
  15 |     |          +------------------+                  |    |
     |     |                                                |    |
  17 |     |        COMP-007 (AvatarViewer / MediaViewer)   |    |
     |     |        [Crop-Rahmen ziehbar]                   |    |
  19 |     |                                                |    |
     |     +------------------------------------------------+    |
  21 |                                                            |
  22 |     +-------------+  +-------------+  +--------------+    |
     |     | 📁 Upload   |  | ✂ Zuschnei |  | 💾 Speichern |    |
  24 |     |  COMP-001   |  |  COMP-001   |  |  COMP-001    |    |
     |     +-------------+  +-------------+  +--------------+    |
  26 +------------------------------------------------------------+
```
