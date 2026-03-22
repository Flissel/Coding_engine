# Image Send Screen

**ID:** `SCREEN-018`
**Route:** `/chat/{chatId}/send-image`
**Layout:** stack

Screen zum Auswählen, Vorschauen und Senden eines Bildes in einem Chat. Der Nutzer kann ein Bild aus der Galerie wählen oder aufnehmen, es in der Vorschau betrachten, eine optionale Bildunterschrift hinzufügen und absenden.

---

## Components Used

- `COMP-001`
- `COMP-004`
- `COMP-005`
- `COMP-007`
- `COMP-008`
- `COMP-010`

---

## Data Requirements

- `GET /api/chats/{chatId}`
- `POST /api/chats/{chatId}/messages (multipart/form-data: image, caption)`
- `GET /api/chats/{chatId}/messages`

---

## Related User Story

`US-047`

---

## Wireframe

```
     0    5   10   15   20   25   30   35   40   45   50   55   60
   0 +------------------------------------------------------------+
     | [<Back]  Kontaktname        [Online/Offline] COMP-010     |
   2 |          StatusIndicator                                  |
     +------------------------------------------------------------+
   4 | [ChatBubble Preview - letzte Nachricht im Chat]           |
     |  COMP-004                                                 |
   6 |  "Hier ist das Bild..."                                   |
     +------------------------------------------------------------+
   8 | +--------------------------------------------------------+ |
     | |                                                        | |
  10 | |                                                        | |
     | |                                                        | |
  12 | |            +------------------+                        | |
     | |            |   [Bild-        ]|                        | |
  14 | |            |   [Vorschau     ]|                        | |
     | |            |   [COMP-007     ]|                        | |
  16 | |            |   [MediaViewer  ]|                        | |
     | |            +------------------+                        | |
  18 | |                                                        | |
     | |                                                        | |
  20 | |  [Rotate]  [Crop]  [Filter]                            | |
     | |                                                        | |
  22 | +--------------------------------------------------------+ |
     +------------------------------------------------------------+
  24 | [😀]     | [Bildunterschrift eingeben...]  | [  Senden  ] |
     | COMP-008 |  COMP-005 (Caption Input)      | COMP-001     |
  26 |          |  char-limit: 1024               | [    ➤    ]  |
     +----------+--------------------------------+--------------+
```
