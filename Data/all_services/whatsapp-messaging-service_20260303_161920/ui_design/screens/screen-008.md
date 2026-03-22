# Gruppenadministration

**ID:** `SCREEN-008`
**Route:** `/settings/security/group-admin`
**Layout:** single-column

Verwaltung von Gruppenmitgliedern, Gruppenrechten und Sicherheitseinstellungen fuer WhatsApp-Gruppen. Ermoeglicht das Suchen, Hinzufuegen und Entfernen von Mitgliedern sowie die Konfiguration von Gruppenberechtigungen.

---

## Components Used

- `COMP-001`
- `COMP-002`
- `COMP-009`
- `COMP-010`
- `COMP-003`

---

## Data Requirements

- `GET /api/groups/{groupId}`
- `GET /api/groups/{groupId}/members`
- `POST /api/groups/{groupId}/members`
- `DELETE /api/groups/{groupId}/members/{memberId}`
- `PUT /api/groups/{groupId}/members/{memberId}/role`
- `GET /api/groups/{groupId}/settings`
- `PUT /api/groups/{groupId}/settings`
- `GET /api/contacts/search?q={query}`

---

## Related User Story

`US-027`

---

## Wireframe

```
     0    5   10   15   20   25   30   35   40   45   50   55   60
   0 +------------------------------------------------------------+
     |  [<Back]   Gruppenadministration          [MoreOptions ...]|
   2 |  Gruppenname: "Projekt-Team Alpha"                         |
     |  4 Mitglieder | Erstellt: 12.01.2024                      |
   4 +------------------------------------------------------------+
   5 | +----------------------------------------------------------+|
     | | [🔍 Mitglied suchen...]                                  ||
   7 | |  COMP-002 (SearchBar)                                   ||
     | +----------------------------------------------------------+|
   9 | [🔒 Sicherheit]          |           [+ Mitglied hinzufuegen]|
     |  COMP-001 (Toggle)       |            COMP-001 (Button)    |
  11 +------------------------------------------------------------+
  12 | +----------------------------------------------------------+|
     | | [👤 Avatar] Max Mustermann    [🟢Online]  Admin  [⚙][✕] ||
  13 | |  COMP-009 (ContactCard)        COMP-010   Role   Actions ||
     | |  +49 170 1234567              (Status)                   ||
  15 | +----------------------------------------------------------+|
  16 | +----------------------------------------------------------+|
     | | [👤 Avatar] Anna Schmidt       [🟢Online]  Mitglied [⚙][✕]||
  17 | |  COMP-003 (ChatListItem)       COMP-010                  ||
     | |  +49 171 9876543                                        ||
  19 | +----------------------------------------------------------+|
  20 | +----------------------------------------------------------+|
     | | [👤 Avatar] Tom Weber          [⚪Offline] Mitglied [⚙][✕]||
  21 | |  COMP-003 (ChatListItem)       COMP-010                  ||
     | |  +49 172 5551234                                        ||
  23 | +----------------------------------------------------------+|
     |                                                            |
  24 | ---- Gruppenrechte-Konfiguration ----                      |
  25 | +---------------------------+  +---------------------------+|
     | | [Speichern]               |  | [Abbrechen]               ||
  27 | |  COMP-001 (Button/Primary)|  |  COMP-001 (Button/Second) ||
  28 | +---------------------------+  +---------------------------+|
  29 +------------------------------------------------------------+
```
