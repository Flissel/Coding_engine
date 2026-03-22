# EPIC-001: Authentifizierung und Kontoschutz

**Status:** draft  
**Priority:** must  
**Story Points:** 21  
**Owner:** Security Team  

## Description

Bereitstellung sicherer Kontoerstellung, Anmeldung und Wiederherstellung inklusive Telefon-Registrierung, 2FA, biometrischer Entsperrung und Passkeys.

## Business Value

Erhöht die Sicherheit und reduziert Kontoübernahmen, was Vertrauen und Nutzerbindung stärkt.

## Acceptance Criteria

1. Registrierung und Verifizierung per Telefonnummer funktionieren in mindestens 95% der Testfälle ohne manuelle Eingriffe.
2. Optionale 2FA und zusätzliche PIN-Sicherung können pro Konto aktiviert/deaktiviert werden.
3. Biometrische Anmeldung und Passkeys sind auf unterstützten Geräten aktivierbar.
4. Kontowiederherstellung inklusive Nummernwechsel ist über definierte Flows vollständig möglich.

## Definition of Done

- Alle User Stories implementiert und getestet
- Integrationstests bestehen
- Dokumentation aktualisiert

## Linked Requirements

- WA-AUTH-001
- WA-AUTH-002
- WA-AUTH-003
- WA-AUTH-005
- WA-SEC-006
- REQ-022
- NFR-036

## User Stories

- US-001
- US-002
- US-003
- US-005
- US-062
- US-133
- US-147



---

# EPIC-002: Profil, Kontakte und Suche

**Status:** draft  
**Priority:** must  
**Story Points:** 13  
**Owner:** Mobile Team  

## Description

Profilverwaltung, Kontaktabgleich und leistungsfähige Suche über Chats, Nachrichten und Medien.

## Business Value

Verbessert Auffindbarkeit von Inhalten und erleichtert soziale Vernetzung, was die Nutzungshäufigkeit steigert.

## Acceptance Criteria

1. Profilbild, Anzeigename und Info-Text können erstellt, geändert und angezeigt werden.
2. Kontakte werden mit Gerätebuch abgeglichen und unbekannte Absender gesondert markiert.
3. Volltextsuche liefert Ergebnisse über Chats und Nachrichten in <2 Sekunden bei Testdaten.
4. Filter nach Medientypen und Kontakt sind in der Suche verfügbar.

## Definition of Done

- Alle User Stories implementiert und getestet
- Integrationstests bestehen
- Dokumentation aktualisiert

## Dependencies

- Authentifizierung und Kontoschutz

## Linked Requirements

- WA-PROF-001
- WA-PROF-002
- WA-PROF-003
- WA-PROF-004
- WA-PROF-005
- WA-CON-001
- WA-CON-002
- WA-CON-003
- WA-CON-004
- WA-CON-005
- WA-SRC-001
- WA-SRC-002
- WA-SRC-003
- WA-SRC-004
- REQ-020

## User Stories

- US-006
- US-007
- US-008
- US-009
- US-010
- US-071
- US-072
- US-073
- US-074
- US-075
- US-076
- US-077
- US-078
- US-079
- US-131



---

# EPIC-003: Einstellungen, Barrierefreiheit und Lokalisierung

**Status:** draft  
**Priority:** must  
**Story Points:** 21  
**Owner:** UX Team  

## Description

Konfigurierbare Datenschutz- und App-Einstellungen sowie vollständige Barrierefreiheit und Lokalisierung.

## Business Value

Erhöht Nutzerzufriedenheit und Compliance durch Datenschutz- und Accessibility-Standards.

## Acceptance Criteria

1. Alle Datenschutzoptionen (Online-Status, Lesebestätigung, Profilbild, Info, Gruppeneinladungen) sind pro Nutzer konfigurierbar.
2. UI erfüllt WCAG-Kriterien und Screenreader-Tests bestehen für Kernflüsse.
3. Rechts-nach-links Sprachen werden korrekt dargestellt und regionale Formate angewendet.
4. Schriftgröße, Kontrast, Dark Mode und Sprache sind in den Einstellungen verfügbar.

## Definition of Done

- Alle User Stories implementiert und getestet
- Integrationstests bestehen
- Dokumentation aktualisiert

## Dependencies

- Profil, Kontakte und Suche

## Linked Requirements

- WA-SET-001
- WA-SET-002
- WA-SET-003
- WA-SET-004
- WA-SET-005
- WA-SET-006
- WA-SET-007
- WA-SET-008
- WA-SET-009
- WA-SET-010
- WA-ACC-001
- WA-ACC-002
- WA-ACC-003
- WA-ACC-004
- NFR-045
- NFR-046
- WA-LOC-001
- WA-LOC-002
- WA-LOC-003

## User Stories

- US-080
- US-081
- US-082
- US-083
- US-084
- US-085
- US-086
- US-087
- US-088
- US-089
- US-106
- US-107
- US-108
- US-109
- US-124
- US-125
- US-126
- US-156
- US-157



---

# EPIC-004: Nachrichten, Präsenz und Benachrichtigungen

**Status:** draft  
**Priority:** must  
**Story Points:** 34  
**Owner:** Messaging Team  

## Description

Kern-Messaging mit Zustellstatus, Präsenz/Typing-Indikatoren und umfassenden Benachrichtigungsfunktionen inklusive KI-Assistenz.

## Business Value

Sichert den zentralen Kommunikations-Use-Case und erhöht Reaktionsgeschwindigkeit der Nutzer.

## Acceptance Criteria

1. Text- und Sprachnachrichten werden in Echtzeit übertragen und zeigen gesendet/zugestellt/gelesen an.
2. Typing- und Online-Status sind sichtbar und durch Privacy-Einstellungen steuerbar.
3. Push-Benachrichtigungen unterstützen Vorschau, Schnellantwort und Reaktionshinweise.
4. KI-Funktionen liefern kontextbasierte Antwort- und Sticker-Vorschläge in mindestens 80% der Testfälle.

## Definition of Done

- Alle User Stories implementiert und getestet
- Integrationstests bestehen
- Dokumentation aktualisiert

## Dependencies

- Authentifizierung und Kontoschutz
- Sicherheit, Verschlüsselung und Moderation

## Linked Requirements

- WA-MSG-001
- WA-MSG-002
- WA-MSG-003
- WA-MSG-004
- WA-MSG-005
- WA-MSG-006
- WA-MSG-007
- WA-MSG-012
- REQ-017
- REQ-024
- WA-NOT-001
- WA-NOT-002
- WA-NOT-003
- WA-NOT-004
- WA-NOT-005
- WA-NOT-006
- REQ-018
- WA-AI-001
- WA-AI-002
- WA-AI-003

## User Stories

- US-011
- US-012
- US-013
- US-014
- US-015
- US-016
- US-017
- US-022
- US-065
- US-066
- US-067
- US-068
- US-069
- US-070
- US-121
- US-122
- US-123
- US-128
- US-129
- US-135



---

# EPIC-005: Erweiterte Nachrichten und Status

**Status:** draft  
**Priority:** should  
**Story Points:** 21  
**Owner:** Messaging Team  

## Description

Erweiterte Messaging-Funktionen, Broadcasts, Spezialinhalte und Status-Updates.

## Business Value

Differenziert das Produkt durch reichhaltige Kommunikationsformen und steigert die tägliche Nutzung.

## Acceptance Criteria

1. Verschwindende Nachrichten und View-Once Medien löschen sich wie konfiguriert automatisch.
2. Broadcast-Listen senden Nachrichten an definierte Empfänger ohne Gruppenerstellung.
3. Status-Updates sind 24 Stunden sichtbar und die Sichtbarkeit ist konfigurierbar.
4. Erwähnungen, Standort- und Kontakt-Sharing funktionieren in Einzel- und Gruppenchats.

## Definition of Done

- Alle User Stories implementiert und getestet
- Integrationstests bestehen
- Dokumentation aktualisiert

## Dependencies

- Nachrichten, Präsenz und Benachrichtigungen

## Linked Requirements

- WA-MSG-008
- WA-MSG-009
- WA-MSG-010
- WA-MSG-011
- WA-MSG-013
- WA-MSG-014
- WA-MSG-015
- WA-STS-001
- WA-STS-002
- WA-STS-003
- WA-STS-004
- WA-STS-005

## User Stories

- US-018
- US-019
- US-020
- US-021
- US-023
- US-024
- US-025
- US-042
- US-043
- US-044
- US-045
- US-046



---

# EPIC-006: Gruppen, Communities und Kanäle

**Status:** draft  
**Priority:** must  
**Story Points:** 21  
**Owner:** Collaboration Team  

## Description

Erstellung und Verwaltung von Gruppen, Communities, Kanälen sowie Umfragen und Events.

## Business Value

Unterstützt skalierbare Kommunikation für Communities und Organisationen.

## Acceptance Criteria

1. Nutzer können Gruppen erstellen, Adminrechte vergeben und Einstellungen anpassen.
2. Einladungslinks funktionieren und können deaktiviert/erneuert werden.
3. Communities bündeln mehrere Gruppen und unterstützen One-Way-Kanäle.
4. Umfragen sind in Gruppen und Einzelchats verfügbar, Events können geplant werden.

## Definition of Done

- Alle User Stories implementiert und getestet
- Integrationstests bestehen
- Dokumentation aktualisiert

## Dependencies

- Nachrichten, Präsenz und Benachrichtigungen

## Linked Requirements

- WA-GRP-001
- WA-GRP-002
- WA-GRP-003
- WA-GRP-004
- WA-GRP-005
- WA-GRP-006
- WA-GRP-007
- WA-GRP-008
- WA-GRP-009

## User Stories

- US-026
- US-027
- US-028
- US-029
- US-030
- US-031
- US-032
- US-033
- US-034



---

# EPIC-007: Medien und Anhänge

**Status:** draft  
**Priority:** must  
**Story Points:** 21  
**Owner:** Media Team  

## Description

Versand, Verwaltung und Bearbeitung von Medien und Dateien inklusive Qualitäts- und Größenkontrollen.

## Business Value

Erhöht den Nutzwert durch reichhaltigen Content-Austausch und stärkt Engagement.

## Acceptance Criteria

1. Bilder, Videos, Dokumente und Audio-Dateien können gesendet und empfangen werden.
2. Medien haben Vorschau und die Größenlimits werden systemseitig erzwungen.
3. Grundlegende Bildbearbeitung ist vor dem Senden verfügbar.
4. Uploads erfüllen definierte Durchsatzwerte unter normaler Last.

## Definition of Done

- Alle User Stories implementiert und getestet
- Integrationstests bestehen
- Dokumentation aktualisiert

## Dependencies

- Nachrichten, Präsenz und Benachrichtigungen

## Linked Requirements

- WA-MED-001
- WA-MED-002
- WA-MED-003
- WA-MED-004
- WA-MED-005
- WA-MED-006
- WA-MED-007
- WA-MED-008
- WA-MED-009
- WA-MED-010
- REQ-019
- NFR-030
- NFR-050

## User Stories

- US-047
- US-048
- US-049
- US-050
- US-051
- US-052
- US-053
- US-054
- US-055
- US-056
- US-130
- US-141
- US-161



---

# User Stories

## US-001: Telefonnummer-Registrierung

**Priority:** MUST
**Linked Requirement:** WA-AUTH-001

### User Story

> As a **Endnutzer**
> I want to **mich mit meiner Telefonnummer registrieren und verifizieren**
> So that **damit ich schnell und sicher Zugriff auf den Dienst erhalte**

### Acceptance Criteria

**AC-1:**
- Given: ich bin nicht registriert und gebe eine gueltige Telefonnummer ein
- When: ich die Registrierung starte und den erhaltenen Verifizierungscode korrekt eingebe
- Then: wird mein Konto erfolgreich erstellt und die Telefonnummer als verifiziert markiert

**AC-2:**
- Given: ich gebe eine Telefonnummer in einem ungueltigen Format ein
- When: ich die Registrierung absende
- Then: erhalte ich eine klare Fehlermeldung und die Registrierung wird nicht fortgesetzt

**AC-3:**
- Given: ich habe einen Verifizierungscode erhalten
- When: ich einen falschen oder abgelaufenen Code eingebe
- Then: wird die Verifizierung abgelehnt und ich kann einen neuen Code anfordern

**AC-4:**
- Given: the system is under normal load
- When: the user completes phone number verification
- Then: verification completes within 60 seconds

**AC-5:**
- Given: das System ist unter Normalbetrieb
- When: der Nutzer die Telefonnummer-Registrierung inklusive Verifizierung abschließt
- Then: der Vorgang ist in höchstens 60 Sekunden abgeschlossen


---

## US-002: Zwei-Faktor-Authentifizierung

**Priority:** MUST
**Linked Requirement:** WA-AUTH-002

### User Story

> As a **registrierter Nutzer**
> I want to **die Zwei-Faktor-Authentifizierung mit einer 6-stelligen PIN aktivieren und beim Login verwenden**
> So that **mein Konto durch eine zusätzliche Sicherheitsschicht vor unbefugtem Zugriff schützen**

### Acceptance Criteria

**AC-1:**
- Given: ein registrierter Nutzer ist angemeldet und die 2FA-Funktion ist verfügbar
- When: der Nutzer die 2FA aktiviert und eine gültige 6-stellige PIN bestätigt
- Then: wird 2FA für das Konto aktiviert und beim nächsten Login abgefragt

**AC-2:**
- Given: 2FA ist für das Konto aktiviert
- When: der Nutzer sich mit korrekten Zugangsdaten und der korrekten 6-stelligen PIN anmeldet
- Then: wird der Login erfolgreich abgeschlossen

**AC-3:**
- Given: 2FA ist für das Konto aktiviert
- When: der Nutzer eine ungültige PIN (nicht 6-stellig oder falsch) eingibt
- Then: wird der Login abgelehnt und der Nutzer erhält eine verständliche Fehlermeldung

**AC-4:**
- Given: 2FA ist aktiviert
- When: der Nutzer sich anmeldet
- Then: der Login wird erst nach Eingabe einer gültigen 6-stelligen PIN abgeschlossen


---

## US-003: Biometrische Entsperrung

**Priority:** SHOULD
**Linked Requirement:** WA-AUTH-003

### User Story

> As a **registrierter Nutzer**
> I want to **die App per Fingerabdruck oder Face ID entsperren**
> So that **damit ich schnell und sicher auf meine Nachrichten zugreifen kann, ohne ein Passwort eingeben zu muessen**

### Acceptance Criteria

**AC-1:**
- Given: der Nutzer hat die biometrische Entsperrung in den Einstellungen aktiviert und das Geraet unterstuetzt Biometrics
- When: der Nutzer oeffnet die App
- Then: die App entsperrt sich nach erfolgreicher biometrischer Authentifizierung und zeigt die Startansicht

**AC-2:**
- Given: der Nutzer hat die biometrische Entsperrung aktiviert
- When: die biometrische Authentifizierung fehlschlaegt
- Then: die App verweigert den Zugriff und bietet eine alternative Entsperrung per PIN/Passwort an

**AC-3:**
- Given: das Geraet unterstuetzt keine Biometrics oder der Nutzer hat keine Biometrics eingerichtet
- When: der Nutzer oeffnet die App
- Then: die App bietet keine biometrische Entsperrung an und fordert die Standardanmeldung

**AC-4:**
- Given: the device supports biometric authentication
- When: the user unlocks the app with Face ID or fingerprint
- Then: the app unlocks within 2 seconds

**AC-5:**
- Given: biometrische Entsperrung ist aktiviert
- When: der Nutzer die App mit Fingerabdruck oder Face ID entsperrt
- Then: der Zugriff auf die Nachrichten ist in höchstens 2 Sekunden möglich


---

## US-004: Multi-Device Support

**Priority:** MUST
**Linked Requirement:** WA-AUTH-004

### User Story

> As a **registrierter Nutzer**
> I want to **die Anwendung gleichzeitig auf mehreren Geräten nutzen**
> So that **um jederzeit nahtlos kommunizieren zu können und keine Nachrichten zu verpassen**

### Acceptance Criteria

**AC-1:**
- Given: der Nutzer ist auf einem Smartphone angemeldet
- When: er sich zusätzlich auf einem zweiten Gerät anmeldet
- Then: sind beide Sitzungen aktiv und Nachrichten werden in Echtzeit auf beiden Geräten synchronisiert

**AC-2:**
- Given: der Nutzer verwendet zwei Geräte parallel
- When: er eine Nachricht auf Gerät A liest oder löscht
- Then: wird der Status auf Gerät B innerhalb weniger Sekunden aktualisiert

**AC-3:**
- Given: der Nutzer versucht, ein drittes Gerät anzumelden und ein festgelegtes Gerätelimit ist erreicht
- When: die Anmeldung erfolgt
- Then: erhält der Nutzer eine klare Fehlermeldung und die Anmeldung wird abgelehnt

**AC-4:**
- Given: the user is signed in on two devices
- When: a message is received on one device
- Then: the message appears on the second device within 5 seconds

**AC-5:**
- Given: der Nutzer ist auf mehreren Geräten angemeldet
- When: eine Nachricht an den Nutzer gesendet wird
- Then: die Nachricht wird innerhalb von 5 Sekunden auf mindestens 3 gleichzeitig angemeldeten Geräten angezeigt


---

## US-005: Passkey-Unterstuetzung

**Priority:** SHOULD
**Linked Requirement:** WA-AUTH-005

### User Story

> As a **registrierter Nutzer**
> I want to **mich mit einem Passkey anmelden**
> So that **um mich schnell, sicher und ohne Passwort auf allen Plattformen einzuloggen**

### Acceptance Criteria

**AC-1:**
- Given: der Nutzer hat auf seinem Gerät einen Passkey für das Konto eingerichtet
- When: er die Anmeldung startet und den Passkey bestätigt
- Then: wird er erfolgreich eingeloggt und eine Sitzung erstellt

**AC-2:**
- Given: der Nutzer hat keinen Passkey für das Konto eingerichtet
- When: er die Passkey-Anmeldung auswählt
- Then: wird eine verständliche Hinweismeldung angezeigt und ein alternativer Login angeboten

**AC-3:**
- Given: die Passkey-Authentifizierung schlägt fehl oder wird abgebrochen
- When: die Anmeldung nicht abgeschlossen werden kann
- Then: wird keine Sitzung erstellt und der Nutzer erhält eine klare Fehlermeldung mit erneuter Versuchsmöglichkeit

**AC-4:**
- Given: the user has a registered passkey
- When: the user logs in with the passkey
- Then: login completes within 3 seconds

**AC-5:**
- Given: ein gültiger Passkey ist vorhanden
- When: der Nutzer sich mit Passkey anmeldet
- Then: der Login ist in höchstens 3 Sekunden abgeschlossen


---

## US-006: Profilbild

**Priority:** MUST
**Linked Requirement:** WA-PROF-001

### User Story

> As a **registrierter Benutzer**
> I want to **ein Profilbild hochladen, anzeigen und bei Bedarf ersetzen oder entfernen**
> So that **damit mein Profil personalisiert ist und andere mich schneller erkennen**

### Acceptance Criteria

**AC-1:**
- Given: ich bin angemeldet und befinde mich in den Profileinstellungen
- When: ich lade ein Bild im erlaubten Format und innerhalb der maximalen Dateigroesse hoch
- Then: wird das Profilbild gespeichert und sofort im Profil angezeigt

**AC-2:**
- Given: ich habe bereits ein Profilbild
- When: ich lade ein neues Bild hoch
- Then: ersetzt das neue Bild das alte und das alte wird nicht mehr angezeigt

**AC-3:**
- Given: ich bin angemeldet und versuche ein nicht unterstuetztes Format oder eine zu grosse Datei hochzuladen
- When: ich starte den Upload
- Then: wird der Upload abgelehnt und eine verstaendliche Fehlermeldung angezeigt

**AC-4:**
- Given: ein Nutzer lädt ein Profilbild hoch
- When: ein anderer Nutzer das Profil aufruft
- Then: das Profilbild wird innerhalb von 1 Sekunde angezeigt


---

## US-007: Anzeigename

**Priority:** MUST
**Linked Requirement:** WA-PROF-002

### User Story

> As a **registrierter Nutzer**
> I want to **einen konfigurierbaren Anzeigenamen im Profil festlegen und speichern**
> So that **eine klare und konsistente Darstellung im Chat zu erreichen, was die Kommunikation und Wiedererkennbarkeit verbessert**

### Acceptance Criteria

**AC-1:**
- Given: der Nutzer ist angemeldet und befindet sich im Profilbereich
- When: er einen gültigen Anzeigenamen eingibt und speichert
- Then: wird der Anzeigename gespeichert und in allen relevanten Ansichten angezeigt

**AC-2:**
- Given: der Nutzer ist angemeldet
- When: er den Anzeigenamen auf leer setzt und speichert
- Then: wird eine Validierungsmeldung angezeigt und der vorherige Anzeigename bleibt erhalten

**AC-3:**
- Given: der Nutzer ist angemeldet
- When: er einen Anzeigenamen mit nicht erlaubten Zeichen oder über der maximalen Länge eingibt
- Then: wird eine Fehlermeldung angezeigt und der Anzeigename nicht gespeichert

**AC-4:**
- Given: ein Nutzer speichert einen Anzeigenamen
- When: der Name im Chat angezeigt wird
- Then: der gespeicherte Anzeigename erscheint in 100% der Chatnachrichten exakt identisch


---

## US-008: Info/Status Text

**Priority:** MUST
**Linked Requirement:** WA-PROF-003

### User Story

> As a **Profilinhaber**
> I want to **einen kurzen Info-Text im Profil erstellen und speichern**
> So that **Besuchern schnell relevante Hinweise bereitzustellen und die Kommunikation zu verbessern**

### Acceptance Criteria

**AC-1:**
- Given: der Profilinhaber befindet sich in der Profilbearbeitung
- When: er einen kurzen Info-Text eingibt und speichert
- Then: der Text wird im Profil angezeigt und ist für Besucher sichtbar

**AC-2:**
- Given: der Profilinhaber gibt einen Info-Text ein, der die maximale Zeichenanzahl überschreitet
- When: er versucht zu speichern
- Then: das System verhindert das Speichern und zeigt eine verständliche Fehlermeldung zur Zeichenbegrenzung an

**AC-3:**
- Given: der Profilinhaber entfernt den vorhandenen Info-Text
- When: er speichert die Änderungen
- Then: im Profil wird kein Info-Text mehr angezeigt

**AC-4:**
- Given: ein Profilinhaber erstellt einen Info-Text
- When: der Text gespeichert wird
- Then: die Länge ist auf maximal 250 Zeichen begrenzt


---

## US-009: Telefonnummer anzeigen

**Priority:** MUST
**Linked Requirement:** WA-PROF-004

### User Story

> As a **registrierter Nutzer**
> I want to **im Profil die hinterlegte Telefonnummer anzeigen**
> So that **damit er Kontaktinformationen schnell einsehen und eine zuverlaessige Kommunikation sicherstellen kann**

### Acceptance Criteria

**AC-1:**
- Given: der Nutzer ist eingeloggt und hat eine Telefonnummer im Profil gespeichert
- When: der Nutzer das Profil aufruft
- Then: wird die Telefonnummer im Profil sichtbar angezeigt

**AC-2:**
- Given: der Nutzer ist eingeloggt und hat keine Telefonnummer im Profil gespeichert
- When: der Nutzer das Profil aufruft
- Then: wird eine neutrale Information angezeigt, dass keine Telefonnummer hinterlegt ist, und es wird keine leere oder fehlerhafte Nummer angezeigt

**AC-3:**
- Given: das System kann die Profildaten aufgrund eines technischen Fehlers nicht laden
- When: der Nutzer das Profil aufruft
- Then: wird eine Fehlermeldung angezeigt und die Telefonnummer wird nicht dargestellt

**AC-4:**
- Given: ein registrierter Nutzer öffnet sein Profil
- When: die Telefonnummer angezeigt wird
- Then: die Telefonnummer ist innerhalb von 1 Sekunde sichtbar


---

## US-010: QR-Code Profil

**Priority:** SHOULD
**Linked Requirement:** WA-PROF-005

### User Story

> As a **Primärer Nutzer**
> I want to **einen scanbaren QR-Code für sein Profil generieren und anzeigen lassen**
> So that **Kontakte schnell und einfach hinzufügen können, ohne manuelle Eingabe, bei gleichzeitiger einfacher Bedienung**

### Acceptance Criteria

**AC-1:**
- Given: der Nutzer ist angemeldet und hat ein aktives Profil
- When: er die Funktion „QR-Code anzeigen“ auswählt
- Then: wird ein scanbarer QR-Code für sein Profil angezeigt

**AC-2:**
- Given: der QR-Code wurde angezeigt
- When: ein anderer Nutzer den QR-Code scannt
- Then: wird das zugehörige Profil korrekt geöffnet und kann hinzugefügt werden

**AC-3:**
- Given: der Nutzer ist nicht angemeldet oder hat kein aktives Profil
- When: er versucht, einen QR-Code zu generieren
- Then: erhält er eine verständliche Fehlermeldung und es wird kein QR-Code angezeigt

**AC-4:**
- Given: the user opens the profile QR code screen
- When: the user requests QR code generation
- Then: the QR code is displayed within 1 second

**AC-5:**
- Given: der Nutzer öffnet die Profilansicht
- When: der QR-Code generiert wird
- Then: der QR-Code wird innerhalb von 2 Sekunden angezeigt

**AC-6:**
- Given: ein Primärer Nutzer öffnet sein Profil
- When: der QR-Code generiert wird
- Then: der QR-Code wird innerhalb von 2 Sekunden angezeigt


---

## US-011: Textnachricht senden

**Priority:** MUST
**Linked Requirement:** WA-MSG-001

### User Story

> As a **registrierter Nutzer**
> I want to **Textnachrichten in Echtzeit an andere Nutzer senden**
> So that **schnell und zuverlässig kommunizieren zu können**

### Acceptance Criteria

**AC-1:**
- Given: der Nutzer ist angemeldet und hat eine stabile Internetverbindung
- When: er eine Textnachricht an einen gültigen Empfänger sendet
- Then: wird die Nachricht in Echtzeit zugestellt und als gesendet bestätigt

**AC-2:**
- Given: der Nutzer ist angemeldet und der Empfänger ist offline
- When: er eine Textnachricht sendet
- Then: wird die Nachricht serverseitig gespeichert und bei Verfügbarkeit zugestellt

**AC-3:**
- Given: der Nutzer ist angemeldet
- When: er eine Textnachricht ohne Inhalt sendet
- Then: wird der Versand verhindert und eine verständliche Fehlermeldung angezeigt

**AC-4:**
- Given: both users are online
- When: a text message is sent
- Then: the recipient receives the message within 1 second in 95% of cases

**AC-5:**
- Given: Sender und Empfänger sind online
- When: der Sender eine Textnachricht abschickt
- Then: die Nachricht wird beim Empfänger in höchstens 2 Sekunden angezeigt


---

## US-012: Sprachnachricht

**Priority:** MUST
**Linked Requirement:** WA-MSG-002

### User Story

> As a **Endnutzer**
> I want to **eine Sprachnachricht aufnehmen und senden**
> So that **um schnell und intuitiv zu kommunizieren, auch wenn Tippen unpraktisch ist**

### Acceptance Criteria

**AC-1:**
- Given: der Endnutzer ist in einem Chat und hat Mikrofonzugriff erteilt
- When: er eine Sprachnachricht aufnimmt und auf Senden tippt
- Then: wird die Sprachnachricht verschluesselt uebertragen und dem Empfaenger zugestellt

**AC-2:**
- Given: der Endnutzer ist in einem Chat
- When: er die Aufnahme startet und diese vor dem Senden abbricht
- Then: wird keine Sprachnachricht gesendet und es bleibt keine unvollstaendige Nachricht im Verlauf

**AC-3:**
- Given: der Endnutzer versucht eine Sprachnachricht zu senden und die Netzwerkverbindung ist unterbrochen
- When: er auf Senden tippt
- Then: erhaelt er eine Fehlermeldung und die Nachricht wird lokal zwischengespeichert oder der erneute Sendeversuch wird angeboten

**AC-4:**
- Given: a 30-second voice message is recorded
- When: the user taps send
- Then: the message becomes available to the recipient within 10 seconds

**AC-5:**
- Given: der Nutzer beendet die Aufnahme
- When: die Sprachnachricht gesendet wird
- Then: die Nachricht ist in höchstens 5 Sekunden erfolgreich versendet


---

## US-013: Nachricht loeschen

**Priority:** MUST
**Linked Requirement:** WA-MSG-003

### User Story

> As a **registrierter Nutzer**
> I want to **eine gesendete oder empfangene Nachricht loeschen**
> So that **um Datenschutz zu wahren und den Nachrichtenverlauf uebersichtlich zu halten**

### Acceptance Criteria

**AC-1:**
- Given: der Nutzer ist angemeldet und eine Nachricht ist im Chatverlauf sichtbar
- When: der Nutzer die Funktion 'Nachricht loeschen' auswaehlt und bestaetigt
- Then: die Nachricht wird aus dem Chatverlauf des Nutzers entfernt und die Ansicht aktualisiert sich ohne Fehlermeldung

**AC-2:**
- Given: der Nutzer oeffnet einen Chat mit einer bereits geloeschten Nachricht
- When: der Nutzer die Nachricht erneut loeschen moechte
- Then: das System zeigt an, dass die Nachricht bereits geloescht ist und nimmt keine weitere Aktion vor

**AC-3:**
- Given: es liegt ein technischer Fehler oder eine Verbindungsunterbrechung vor
- When: der Nutzer versucht, eine Nachricht zu loeschen
- Then: das System zeigt eine verständliche Fehlermeldung an und die Nachricht bleibt unveraendert erhalten


---

## US-014: Nachricht bearbeiten

**Priority:** MUST
**Linked Requirement:** WA-MSG-004

### User Story

> As a **Endnutzer**
> I want to **eine bereits gesendete Nachricht bearbeiten**
> So that **Korrekturen vornehmen zu koennen und eine professionelle sowie fehlerfreie Kommunikation sicherzustellen**

### Acceptance Criteria

**AC-1:**
- Given: eine gesendete Nachricht ist in einem bearbeitbaren Zustand und der Nutzer ist autorisiert
- When: der Nutzer den Bearbeiten-Dialog oeffnet, den Text aendert und speichert
- Then: die Nachricht wird aktualisiert angezeigt und die Aenderung wird an den Empfaenger uebermittelt

**AC-2:**
- Given: eine gesendete Nachricht ist nicht mehr bearbeitbar (z. B. Zeitfenster abgelaufen)
- When: der Nutzer versucht die Nachricht zu bearbeiten
- Then: das System verhindert die Bearbeitung und zeigt eine eindeutige Meldung an

**AC-3:**
- Given: die Nachricht enthaelt unzulaessige Inhalte oder ueberschreitet Laengenlimits
- When: der Nutzer speichert die Bearbeitung
- Then: das System lehnt die Aenderung ab und zeigt die Validierungsfehler an


---

## US-015: Nachricht weiterleiten

**Priority:** MUST
**Linked Requirement:** WA-MSG-005

### User Story

> As a **registrierter Nutzer**
> I want to **eine empfangene Nachricht an einen oder mehrere Kontakte weiterleiten**
> So that **damit relevante Informationen schnell und zuverlässig geteilt werden können**

### Acceptance Criteria

**AC-1:**
- Given: der Nutzer ist eingeloggt und hat eine empfangene Nachricht geöffnet
- When: der Nutzer die Weiterleitungsfunktion auswählt und einen oder mehrere Empfänger bestätigt
- Then: die Nachricht wird an die ausgewählten Empfänger zugestellt und der Nutzer erhält eine Bestätigung

**AC-2:**
- Given: der Nutzer ist eingeloggt und startet die Weiterleitung
- When: der Nutzer keinen Empfänger auswählt
- Then: das System verhindert das Senden und zeigt einen Hinweis zur Empfängerauswahl

**AC-3:**
- Given: der Nutzer ist eingeloggt und wählt einen Empfänger, der nicht erreichbar ist
- When: der Nutzer die Weiterleitung abschickt
- Then: das System meldet den Zustellfehler und bietet eine erneute Zustellung an

**AC-4:**
- Given: the user selects 3 contacts to forward a message to
- When: the user confirms forwarding
- Then: all selected recipients receive the forwarded message within 2 seconds in 95% of cases

**AC-5:**
- Given: der Nutzer wählt eine empfangene Nachricht und Kontakte aus
- When: der Nutzer auf Weiterleiten tippt
- Then: die Weiterleitung wird in höchstens 3 Sekunden abgeschlossen


---

## US-016: Nachricht zitieren

**Priority:** MUST
**Linked Requirement:** WA-MSG-006

### User Story

> As a **registrierter Nutzer**
> I want to **eine spezifische Nachricht zitieren und darauf antworten**
> So that **damit die Kommunikation klarer und kontextbezogen nachvollziehbar bleibt**

### Acceptance Criteria

**AC-1:**
- Given: eine bestehende Unterhaltung mit mehreren Nachrichten
- When: der Nutzer eine Nachricht auswählt und die Zitier-/Antwort-Funktion nutzt
- Then: wird die ausgewählte Nachricht im Antwortfeld als Zitat angezeigt und die Antwort wird mit Bezug auf diese Nachricht gesendet

**AC-2:**
- Given: die zitierte Nachricht wurde gelöscht oder ist für den Nutzer nicht mehr sichtbar
- When: der Nutzer versucht, diese Nachricht zu zitieren
- Then: wird eine verständliche Meldung angezeigt und das Zitieren verhindert

**AC-3:**
- Given: der Nutzer antwortet mit Zitat in einer Unterhaltung
- When: die Nachricht zugestellt wird
- Then: sehen alle berechtigten Empfänger die Antwort samt korrektem Zitat und Zeitstempel

**AC-4:**
- Given: a user replies with a quote
- When: the reply is sent
- Then: the displayed reply includes a quoted snippet of the original message and its timestamp


---

## US-017: Reaktionen

**Priority:** MUST
**Linked Requirement:** WA-MSG-007

### User Story

> As a **Primärnutzer**
> I want to **auf Nachrichten mit Emoji reagieren**
> So that **um schnell und intuitiv Rückmeldung zu geben und die Kommunikation zu beschleunigen**

### Acceptance Criteria

**AC-1:**
- Given: eine empfangene oder gesendete Nachricht im Chat
- When: der Nutzer eine Emoji-Reaktion auswählt und bestätigt
- Then: wird die Reaktion an der Nachricht angezeigt und an alle Chatteilnehmer synchronisiert

**AC-2:**
- Given: eine Nachricht mit bestehender Reaktion
- When: der Nutzer eine andere Emoji-Reaktion auswählt
- Then: wird die vorherige Reaktion des Nutzers ersetzt und die Änderung für alle sichtbar aktualisiert

**AC-3:**
- Given: eine Nachricht im Chat
- When: der Nutzer eine nicht unterstützte oder ungültige Emoji-Reaktion sendet
- Then: weist das System die Reaktion zurück und zeigt eine verständliche Fehlermeldung an

**AC-4:**
- Given: a message is visible to participants in a chat
- When: a user adds an emoji reaction
- Then: the reaction appears to all participants within 1 second


---

## US-018: Verschwindende Nachrichten

**Priority:** MUST
**Linked Requirement:** WA-MSG-008

### User Story

> As a **registrierter Nutzer**
> I want to **eine Nachricht mit einer festgelegten Selbstloeschungszeit senden**
> So that **damit vertrauliche Inhalte automatisch entfernt werden und der Datenschutz erhoeht wird**

### Acceptance Criteria

**AC-1:**
- Given: der Nutzer ist angemeldet und erstellt eine Nachricht
- When: er eine Selbstloeschungszeit auswählt und die Nachricht sendet
- Then: die Nachricht wird zugestellt und nach Ablauf der Zeit automatisch entfernt

**AC-2:**
- Given: eine Nachricht mit Selbstloeschungszeit ist zugestellt
- When: die festgelegte Zeit ablaeuft
- Then: die Nachricht ist fuer Sender und Empfaenger nicht mehr sichtbar und nicht mehr abrufbar

**AC-3:**
- Given: der Nutzer versucht eine ungültige oder nicht unterstützte Selbstloeschungszeit festzulegen
- When: er die Nachricht senden moechte
- Then: das System zeigt eine Fehlermeldung und verhindert das Senden

**AC-4:**
- Given: eine Selbstlöschungszeit von 60 Sekunden wurde festgelegt
- When: die Nachricht beim Empfänger angezeigt wird
- Then: die Nachricht wird spätestens 60 Sekunden nach Anzeige automatisch gelöscht


---

## US-019: Einmal-Ansicht Medien

**Priority:** MUST
**Linked Requirement:** WA-MSG-009

### User Story

> As a **registrierter Nutzer**
> I want to **View-Once-Medien senden und empfangen**
> So that **dass vertrauliche Inhalte nur einmal angezeigt werden und dadurch Datenschutz und Sicherheit gewahrt bleiben**

### Acceptance Criteria

**AC-1:**
- Given: der Nutzer hat ein View-Once-Medium ausgewählt und der Empfänger ist erreichbar
- When: der Nutzer das Medium sendet und der Empfänger es öffnet
- Then: wird das Medium genau einmal angezeigt und danach als nicht erneut abrufbar markiert

**AC-2:**
- Given: ein View-Once-Medium wurde bereits geöffnet
- When: der Empfänger versucht es erneut zu öffnen oder weiterzuleiten
- Then: wird der Zugriff verweigert und eine Hinweisnachricht angezeigt

**AC-3:**
- Given: die Nachrichtenzustellung ist fehlgeschlagen
- When: der Nutzer ein View-Once-Medium sendet
- Then: erhält der Nutzer eine Fehlermeldung und das Medium wird nicht als geöffnet/verbrauchtes Medium markiert


---

## US-020: Chat sperren

**Priority:** SHOULD
**Linked Requirement:** WA-MSG-010

### User Story

> As a **registrierter Nutzer**
> I want to **einen einzelnen Chat mit zusaetzlicher Authentifizierung sperren**
> So that **meine privaten Gespraeche vor unbefugtem Zugriff zu schuetzen und die Datensicherheit zu erhoehen**

### Acceptance Criteria

**AC-1:**
- Given: ein geoeffneter Chat und der Nutzer ist angemeldet
- When: der Nutzer die Option „Chat sperren“ waehlt und die zusaetzliche Authentifizierung erfolgreich abschliesst
- Then: der Chat wird gesperrt und ist nur nach erneuter erfolgreicher Authentifizierung zugreifbar

**AC-2:**
- Given: ein geoeffneter Chat und der Nutzer ist angemeldet
- When: der Nutzer die zusaetzliche Authentifizierung abbricht oder fehlschlaegt
- Then: der Chat bleibt entsperrt und es wird eine klare Fehlermeldung angezeigt

**AC-3:**
- Given: ein bereits gesperrter Chat
- When: der Nutzer versucht, den Chat zu oeffnen
- Then: das System fordert zusaetzliche Authentifizierung an und blockiert den Zugriff bis zum Erfolg


---

## US-021: Broadcast-Listen

**Priority:** MUST
**Linked Requirement:** WA-MSG-011

### User Story

> As a **Business-Kommunikationsverantwortlicher**
> I want to **eine Broadcast-Liste erstellen und eine Massen-Nachricht an mehrere Empfänger senden**
> So that **damit Informationen schnell, zuverlässig und datenschutzkonform an viele Kontakte verteilt werden können**

### Acceptance Criteria

**AC-1:**
- Given: eine gültige Broadcast-Liste mit mehreren Empfängern ist erstellt und der Nutzer ist berechtigt
- When: der Nutzer eine Nachricht an die Broadcast-Liste sendet
- Then: wird die Nachricht zuverlässig an alle Empfänger zugestellt und der Versandstatus wird angezeigt

**AC-2:**
- Given: eine Broadcast-Liste enthält keine gültigen Empfänger oder ist leer
- When: der Nutzer versucht eine Nachricht zu senden
- Then: wird der Versand verhindert und eine verständliche Fehlermeldung angezeigt

**AC-3:**
- Given: die Anzahl der Empfänger überschreitet das konfigurierte Rate-Limit
- When: der Nutzer den Versand startet
- Then: wird der Versand gemäß Rate-Limiting verzögert oder blockiert und der Nutzer wird informiert


---

## US-022: Formatierte Texte

**Priority:** MUST
**Linked Requirement:** WA-MSG-012

### User Story

> As a **Kundenservice-Mitarbeiter**
> I want to **Nachrichten mit grundlegender Textformatierung (fett, kursiv, Aufzählungen) verfassen und senden**
> So that **um Informationen klar und professionell zu strukturieren und die Verständlichkeit für Kunden zu erhöhen**

### Acceptance Criteria

**AC-1:**
- Given: der Nutzer befindet sich im Nachrichten-Editor
- When: er Text mit unterstützter Formatierung erstellt und die Nachricht sendet
- Then: wird die Nachricht beim Empfänger mit korrekter Formatierung angezeigt

**AC-2:**
- Given: der Nutzer formatiert einen Textabschnitt und entfernt die Formatierung
- When: er die Nachricht speichert oder sendet
- Then: wird der Text ohne Formatierung dargestellt

**AC-3:**
- Given: der Nutzer fügt nicht unterstützte Formatierungen ein
- When: er die Nachricht sendet
- Then: werden nicht unterstützte Formatierungen entfernt oder in Klartext umgewandelt, ohne die Zustellung zu verhindern


---

## US-023: Erwaehnung (@mention)

**Priority:** MUST
**Linked Requirement:** WA-MSG-013

### User Story

> As a **Gruppenchat-Nutzer**
> I want to **andere Teilnehmer in einem Gruppenchchat per @-Erwähnung markieren**
> So that **um gezielt Aufmerksamkeit zu erzeugen und die Kommunikation effizienter zu gestalten**

### Acceptance Criteria

**AC-1:**
- Given: ich befinde mich in einem Gruppenchchat mit mehreren Teilnehmern
- When: ich tippe @ und wähle einen gültigen Teilnehmer aus der Liste aus und sende die Nachricht
- Then: die Nachricht wird zugestellt und der erwähnte Teilnehmer wird als @-Erwähnung hervorgehoben

**AC-2:**
- Given: ich schreibe eine Nachricht in einem Gruppenchchat
- When: ich füge mehrere gültige @-Erwähnungen in derselben Nachricht hinzu und sende sie
- Then: alle erwähnten Teilnehmer werden korrekt markiert und die Nachricht wird an alle zugestellt

**AC-3:**
- Given: ich tippe @ gefolgt von einem Namen, der nicht im Gruppenchchat ist
- When: ich versuche die Nachricht zu senden
- Then: das System verhindert die ungültige Erwähnung oder entfernt sie und informiert mich über den Fehler


---

## US-024: Standort teilen

**Priority:** MUST
**Linked Requirement:** WA-MSG-014

### User Story

> As a **registrierter Nutzer**
> I want to **einen aktuellen oder ausgewählten Standort in einem Chat teilen**
> So that **damit Empfänger den Ort zuverlässig finden und Absprachen schneller erfolgen**

### Acceptance Criteria

**AC-1:**
- Given: der Nutzer befindet sich in einem geöffneten Chat und hat der Standortfreigabe zugestimmt
- When: er die Funktion „Standort teilen“ auswählt und den Standort sendet
- Then: wird der Standort als Nachricht mit Kartenvorschau und Koordinaten an den Empfänger zugestellt

**AC-2:**
- Given: der Nutzer befindet sich in einem geöffneten Chat
- When: er die Standortfreigabe ablehnt oder keine Berechtigung erteilt
- Then: wird der Standort nicht geteilt und eine verständliche Aufforderung zur Freigabe angezeigt

**AC-3:**
- Given: der Nutzer befindet sich in einem geöffneten Chat und die Netzwerkverbindung ist instabil
- When: er den Standort sendet
- Then: erhält er eine Fehlermeldung mit der Möglichkeit, den Versand erneut zu versuchen


---

## US-025: Kontakt teilen

**Priority:** MUST
**Linked Requirement:** WA-MSG-015

### User Story

> As a **registrierter Nutzer**
> I want to **Kontaktdaten in einem Chat teilen**
> So that **um die Kommunikation schnell und einfach fortzusetzen**

### Acceptance Criteria

**AC-1:**
- Given: der Nutzer befindet sich in einem bestehenden Chat und hat Zugriff auf seine Kontakte
- When: der Nutzer die Funktion „Kontakt teilen“ auswählt und einen Kontakt bestätigt
- Then: wird der ausgewählte Kontakt als Nachricht im Chat angezeigt und an den Empfänger zugestellt

**AC-2:**
- Given: der Nutzer befindet sich in einem Chat
- When: der Nutzer die Funktion „Kontakt teilen“ öffnet und die Auswahl abbricht
- Then: wird kein Kontakt geteilt und der Chat bleibt unverändert

**AC-3:**
- Given: der Nutzer versucht, einen Kontakt zu teilen, aber es besteht keine Netzwerkverbindung
- When: der Nutzer das Teilen bestätigt
- Then: erhält der Nutzer eine Fehlermeldung und der Kontakt wird nicht gesendet


---

## US-026: Gruppe erstellen

**Priority:** MUST
**Linked Requirement:** WA-GRP-001

### User Story

> As a **registrierter Nutzer**
> I want to **einen Gruppenchats erstellen und Teilnehmer hinzufügen**
> So that **um schnell und einfach mit mehreren Kontakten zu kommunizieren und die Zusammenarbeit zu verbessern**

### Acceptance Criteria

**AC-1:**
- Given: der Nutzer ist angemeldet und befindet sich in der Chat-Übersicht
- When: er einen Gruppennamen eingibt, mindestens zwei Kontakte auswählt und auf „Gruppe erstellen“ tippt
- Then: wird der Gruppenchats erstellt, der Nutzer ist Gruppenadmin und der Chat erscheint in der Liste

**AC-2:**
- Given: der Nutzer startet die Gruppenerstellung
- When: er weniger als zwei Kontakte auswählt
- Then: wird die Erstellung verhindert und eine verständliche Hinweismeldung angezeigt

**AC-3:**
- Given: der Nutzer erstellt eine Gruppe
- When: die Nachrichtenzustellung an einen oder mehrere Teilnehmer fehlschlägt
- Then: wird der Nutzer informiert und der Gruppenchats wird trotzdem erstellt, mit Statushinweis zu fehlgeschlagenen Einladungen


---

## US-027: Gruppenadministration

**Priority:** MUST
**Linked Requirement:** WA-GRP-002

### User Story

> As a **Gruppenadministrator**
> I want to **Gruppenmitglieder verwalten und Gruppenrechte konfigurieren**
> So that **damit die Gruppenkommunikation sicher, effizient und konform gesteuert werden kann**

### Acceptance Criteria

**AC-1:**
- Given: eine bestehende Gruppe mit Administratorrechten des Nutzers
- When: der Gruppenadministrator Mitglieder hinzufügt, entfernt oder Rollen ändert
- Then: werden die Änderungen sofort wirksam angezeigt und in der Gruppe protokolliert

**AC-2:**
- Given: eine Gruppe mit definierten Datenschutz- und Sicherheitsregeln
- When: der Gruppenadministrator versucht, eine Rolle zuzuweisen, die gegen Regeln verstößt
- Then: blockiert das System die Aktion und zeigt eine verständliche Fehlermeldung an

**AC-3:**
- Given: eine große Gruppe mit vielen Mitgliedern
- When: der Gruppenadministrator nach einem Mitglied sucht und dessen Rolle aktualisiert
- Then: liefert das System die Ergebnisse performant und bestätigt die Änderung ohne Verzögerung


---

## US-028: Gruppeneinstellungen

**Priority:** MUST
**Linked Requirement:** WA-GRP-003

### User Story

> As a **Gruppenadministrator**
> I want to **Gruppeneinstellungen konfigurieren und speichern**
> So that **um die Nutzung der Gruppe sicher, effizient und an die Bedürfnisse der Mitglieder angepasst zu gestalten**

### Acceptance Criteria

**AC-1:**
- Given: der Gruppenadministrator ist angemeldet und befindet sich in der Gruppenverwaltung
- When: er erlaubte Einstellungen ändert und speichert
- Then: werden die neuen Gruppeneinstellungen gespeichert und sofort angewendet

**AC-2:**
- Given: der Gruppenadministrator bearbeitet die Gruppeneinstellungen
- When: er Pflichtfelder leer lässt oder ungültige Werte eingibt
- Then: zeigt das System eine verständliche Fehlermeldung an und verhindert das Speichern

**AC-3:**
- Given: die Gruppeneinstellungen enthalten sicherheitsrelevante Optionen
- When: der Gruppenadministrator eine restriktive Option aktiviert
- Then: werden die Zugriffsrechte entsprechend eingeschränkt und im System protokolliert


---

## US-029: Einladungslink

**Priority:** MUST
**Linked Requirement:** WA-GRP-004

### User Story

> As a **Gruppenadministrator**
> I want to **einen Einladungslink fuer eine Gruppe erzeugen und teilen**
> So that **damit neue Mitglieder einfach und sicher beitreten koennen**

### Acceptance Criteria

**AC-1:**
- Given: der Gruppenadministrator ist angemeldet und besitzt Adminrechte in der Gruppe
- When: er einen Einladungslink fuer die Gruppe erstellt
- Then: das System generiert einen eindeutigen Link, der fuer den Beitritt zur Gruppe verwendet werden kann

**AC-2:**
- Given: ein gueltiger Einladungslink wurde erstellt
- When: ein Nutzer den Link oeffnet und den Beitritt bestaetigt
- Then: der Nutzer wird der Gruppe hinzugefuegt und eine Bestaetigung wird angezeigt

**AC-3:**
- Given: ein Einladungslink wurde widerrufen oder ist abgelaufen
- When: ein Nutzer den Link oeffnet
- Then: das System verweigert den Beitritt und zeigt eine entsprechende Fehlermeldung an


---

## US-030: Gruppe verlassen

**Priority:** MUST
**Linked Requirement:** WA-GRP-005

### User Story

> As a **Gruppenmitglied**
> I want to **eine Gruppe verlassen, ohne andere Mitglieder zu benachrichtigen**
> So that **damit meine Privatsphaere geschuetzt wird und die Bedienung einfach bleibt**

### Acceptance Criteria

**AC-1:**
- Given: ich bin Mitglied einer Gruppe
- When: ich waehle die Option 'Gruppe verlassen' und bestaetige
- Then: ich werde aus der Gruppe entfernt und es wird keine Benachrichtigung an andere Mitglieder gesendet

**AC-2:**
- Given: ich bin nicht Mitglied der ausgewaehlten Gruppe
- When: ich versuche, die Gruppe zu verlassen
- Then: das System zeigt eine verständliche Meldung an und nimmt keine Aenderungen vor

**AC-3:**
- Given: ein technischer Fehler tritt waehrend des Verlassens auf
- When: der Vorgang nicht abgeschlossen werden kann
- Then: ich erhalte eine Fehlermeldung und bleibe weiterhin Mitglied der Gruppe


---

## US-031: Community

**Priority:** MUST
**Linked Requirement:** WA-GRP-006

### User Story

> As a **Endnutzer**
> I want to **eine Community mit mehreren Gruppen erstellen und verwalten**
> So that **damit unterschiedliche Themenbereiche getrennt organisiert und dennoch unter einem gemeinsamen Rahmen kommuniziert werden koennen**

### Acceptance Criteria

**AC-1:**
- Given: ich bin als Endnutzer angemeldet und habe Berechtigung zur Community-Erstellung
- When: ich eine neue Community anlege und mehrere Gruppen hinzufuege
- Then: wird die Community erstellt und alle Gruppen sind der Community eindeutig zugeordnet

**AC-2:**
- Given: eine bestehende Community mit Gruppen existiert
- When: ich eine Gruppe aus der Community entferne
- Then: wird nur die ausgewaehlte Gruppe entfernt und die uebrigen Gruppen bleiben unveraendert bestehen

**AC-3:**
- Given: ich versuche eine Community zu speichern
- When: keine Gruppe hinzugefuegt wurde
- Then: erhalte ich eine Fehlermeldung und die Community wird nicht erstellt


---

## US-032: Kanaele

**Priority:** SHOULD
**Linked Requirement:** WA-GRP-007

### User Story

> As a **Business-Kommunikationsverantwortlicher**
> I want to **einen One-Way-Broadcast-Kanal erstellen und Nachrichten an Abonnenten senden**
> So that **um Kundeninformationen zuverlässig und datenschutzkonform breit zu verbreiten**

### Acceptance Criteria

**AC-1:**
- Given: der Nutzer ist als Business-Profil verifiziert und hat die Berechtigung zur Kanalverwaltung
- When: er einen One-Way-Broadcast-Kanal erstellt und eine Nachricht veröffentlicht
- Then: wird die Nachricht erfolgreich an alle Abonnenten zugestellt und im Kanalverlauf angezeigt

**AC-2:**
- Given: ein bestehender One-Way-Broadcast-Kanal mit Abonnenten
- When: ein Abonnent versucht, eine Nachricht in den Kanal zu posten
- Then: wird die Aktion blockiert und der Abonnent erhält eine Meldung, dass nur der Kanalbetreiber senden darf

**AC-3:**
- Given: der Nutzer versucht, eine Broadcast-Nachricht ohne ausreichende Berechtigung zu senden
- When: er die Nachricht veröffentlicht
- Then: wird der Versand abgelehnt und ein Berechtigungsfehler protokolliert


---

## US-033: Umfragen

**Priority:** SHOULD
**Linked Requirement:** WA-GRP-008

### User Story

> As a **registrierter Nutzer**
> I want to **eine Umfrage in einem Gruppen- oder Einzelchat erstellen und senden**
> So that **schnell Feedback einzuholen und Entscheidungen effizient abzustimmen**

### Acceptance Criteria

**AC-1:**
- Given: der Nutzer befindet sich in einem Gruppenchat
- When: er eine Umfrage mit mindestens zwei Antwortoptionen erstellt und sendet
- Then: wird die Umfrage im Chat angezeigt und alle Gruppenmitglieder koennen abstimmen

**AC-2:**
- Given: der Nutzer befindet sich in einem Einzelchat
- When: er eine Umfrage erstellt und sendet
- Then: wird die Umfrage im Chat angezeigt und der Gegenueber kann abstimmen

**AC-3:**
- Given: der Nutzer erstellt eine Umfrage ohne Antwortoptionen
- When: er versucht die Umfrage zu senden
- Then: erhaelt er eine Fehlermeldung und die Umfrage wird nicht gesendet


---

## US-034: Events planen

**Priority:** SHOULD
**Linked Requirement:** WA-GRP-009

### User Story

> As a **Gruppenmitglied**
> I want to **ein Event in einer Gruppe planen und erstellen**
> So that **damit alle Gruppenmitglieder zuverlässig informiert werden und die Organisation einfacher wird**

### Acceptance Criteria

**AC-1:**
- Given: das Gruppenmitglied ist in einer Gruppe angemeldet und hat Berechtigung zum Erstellen von Events
- When: es einen Titel, Datum/Uhrzeit, Ort und Beschreibung eingibt und das Event speichert
- Then: wird das Event in der Gruppe angezeigt und eine Benachrichtigung an alle Gruppenmitglieder gesendet

**AC-2:**
- Given: das Gruppenmitglied ist in einer Gruppe angemeldet
- When: es versucht, ein Event ohne erforderliche Pflichtfelder zu speichern
- Then: wird eine verständliche Validierungsmeldung angezeigt und das Event nicht gespeichert

**AC-3:**
- Given: das Gruppenmitglied ist in einer Gruppe angemeldet
- When: es ein Event mit einem Datum in der Vergangenheit plant
- Then: wird das Speichern verhindert und eine Fehlermeldung angezeigt


---

## US-035: Sprachanruf

**Priority:** MUST
**Linked Requirement:** WA-CALL-001

### User Story

> As a **Endnutzer**
> I want to **einen verschlüsselten Sprachanruf starten und führen**
> So that **damit ich sicher und zuverlässig kommunizieren kann und meine Privatsphäre geschützt ist**

### Acceptance Criteria

**AC-1:**
- Given: der Nutzer ist angemeldet und der Empfänger ist erreichbar
- When: der Nutzer einen Sprachanruf startet
- Then: wird der Anruf aufgebaut und die Sprachübertragung ist durchgehend verschlüsselt

**AC-2:**
- Given: der Empfänger lehnt den Anruf ab oder ist nicht erreichbar
- When: der Nutzer den Anruf startet
- Then: erhält der Nutzer eine klare Benachrichtigung über den Status des Anrufs

**AC-3:**
- Given: die Netzwerkverbindung ist instabil
- When: während eines verschlüsselten Sprachanrufs Paketverluste auftreten
- Then: versucht das System die Verbindung zu stabilisieren und informiert den Nutzer bei Abbruch


---

## US-036: Videoanruf

**Priority:** MUST
**Linked Requirement:** WA-CALL-002

### User Story

> As a **Endnutzer**
> I want to **einen verschlüsselten Videoanruf starten und empfangen**
> So that **vertraulich und plattformübergreifend in hoher Qualität kommunizieren zu können**

### Acceptance Criteria

**AC-1:**
- Given: zwei Endnutzer sind online und haben gültige Konten
- When: ein Nutzer einen Videoanruf startet und der andere annimmt
- Then: der Videoanruf wird mit Ende-zu-Ende-Verschlüsselung aufgebaut und beide sehen und hören sich

**AC-2:**
- Given: der Empfänger ist offline oder nicht verfügbar
- When: ein Nutzer einen Videoanruf startet
- Then: das System zeigt eine nicht verfügbare Benachrichtigung an und der Anruf wird nicht gestartet

**AC-3:**
- Given: die Netzwerkverbindung ist instabil oder unterbrochen
- When: ein Videoanruf aktiv ist
- Then: das System versucht eine Wiederverbindung und informiert den Nutzer bei Fehlschlag verständlich


---

## US-037: Gruppenanruf

**Priority:** MUST
**Linked Requirement:** WA-CALL-003

### User Story

> As a **registrierter Nutzer**
> I want to **einen Gruppen-Sprach- oder Videoanruf mit mehreren Teilnehmern starten und beitreten**
> So that **um schnell und zuverlässig plattformübergreifend mit mehreren Personen zu kommunizieren**

### Acceptance Criteria

**AC-1:**
- Given: der Nutzer ist angemeldet und hat Kontakte ausgewählt
- When: er einen Gruppen-Sprach- oder Videoanruf startet
- Then: werden alle eingeladenen Teilnehmer benachrichtigt und der Anruf wird mit der vom Nutzer gewählten Medienart aufgebaut

**AC-2:**
- Given: ein Gruppenanruf ist aktiv und ein weiterer Teilnehmer wird eingeladen
- When: der Teilnehmer die Einladung annimmt
- Then: wird er dem laufenden Gruppenanruf ohne Unterbrechung für bestehende Teilnehmer hinzugefügt

**AC-3:**
- Given: die Netzwerkverbindung eines Teilnehmers ist instabil oder bricht ab
- When: der Teilnehmer dem Gruppenanruf beitreten oder verbunden bleiben möchte
- Then: versucht das System automatisch eine Wiederverbindung und zeigt bei Fehlschlag eine verständliche Fehlermeldung an


---

## US-038: Bildschirmfreigabe

**Priority:** SHOULD
**Linked Requirement:** WA-CALL-004

### User Story

> As a **registrierter Nutzer**
> I want to **während eines laufenden Anrufs die Bildschirmfreigabe starten und beenden**
> So that **um Inhalte klar zu erklären und die Kommunikation effizienter zu gestalten**

### Acceptance Criteria

**AC-1:**
- Given: ein aktiver Anruf zwischen zwei Teilnehmern
- When: der Nutzer die Funktion „Bildschirmfreigabe starten“ auswählt und einen Bildschirm oder ein Fenster freigibt
- Then: sehen alle Teilnehmer die geteilte Ansicht in Echtzeit

**AC-2:**
- Given: eine aktive Bildschirmfreigabe
- When: der Nutzer die Freigabe beendet
- Then: wird die Übertragung sofort gestoppt und alle Teilnehmer erhalten die Ansicht „Freigabe beendet“

**AC-3:**
- Given: der Nutzer hat keine Berechtigung oder verweigert die Freigabe im Betriebssystem
- When: er die Bildschirmfreigabe starten möchte
- Then: wird eine verständliche Fehlermeldung angezeigt und keine Freigabe gestartet


---

## US-039: Anruflink

**Priority:** SHOULD
**Linked Requirement:** WA-CALL-005

### User Story

> As a **Kundenservice-Mitarbeiter**
> I want to **einen Anruflink für einen geplanten Anruf erstellen und teilen**
> So that **Kunden den einfachen Beitritt zum geplanten Anruf ermöglichen und die professionelle Kommunikation verbessern**

### Acceptance Criteria

**AC-1:**
- Given: ein geplanter Anruf mit gültigem Datum und Uhrzeit existiert
- When: der Nutzer den Anruflink erzeugt
- Then: erstellt das System einen eindeutigen Anruflink und zeigt ihn zur sicheren Weitergabe an

**AC-2:**
- Given: ein geplanter Anruf mit Startzeit liegt in der Vergangenheit
- When: der Nutzer versucht einen Anruflink zu erzeugen
- Then: verhindert das System die Erstellung und zeigt eine verständliche Fehlermeldung

**AC-3:**
- Given: der Nutzer teilt einen gültigen Anruflink mit einem Kunden
- When: der Kunde den Link auf einer unterstützten Plattform öffnet
- Then: führt der Link den Kunden direkt zum vorgesehenen Anruf und informiert über den geplanten Zeitpunkt


---

## US-040: Anruf ablehnen mit Nachricht

**Priority:** MUST
**Linked Requirement:** WA-CALL-006

### User Story

> As a **primärer Nutzer**
> I want to **einen eingehenden Anruf ablehnen und eine schnelle Antwortnachricht senden**
> So that **damit der Anrufer sofort informiert wird und die Kommunikation zuverlässig und professionell bleibt**

### Acceptance Criteria

**AC-1:**
- Given: ein eingehender Anruf wird angezeigt und der Nutzer ist online
- When: der Nutzer wählt eine vordefinierte Schnellantwort und lehnt den Anruf ab
- Then: der Anruf wird abgelehnt und die gewählte Nachricht wird innerhalb von 2 Sekunden gesendet

**AC-2:**
- Given: ein eingehender Anruf wird angezeigt und keine vordefinierten Schnellantworten sind verfügbar
- When: der Nutzer den Anruf ablehnt
- Then: der Anruf wird abgelehnt und es wird eine Standardnachricht gesendet

**AC-3:**
- Given: ein eingehender Anruf wird angezeigt und der Nachrichtendienst ist vorübergehend nicht verfügbar
- When: der Nutzer den Anruf ablehnt und eine Schnellantwort auswählt
- Then: der Anruf wird abgelehnt und der Nutzer erhält eine Fehlermeldung zur fehlgeschlagenen Nachrichtenzustellung


---

## US-041: Anrufverlauf

**Priority:** MUST
**Linked Requirement:** WA-CALL-007

### User Story

> As a **registrierter Nutzer**
> I want to **den Anrufverlauf einsehen**
> So that **um vergangene Anrufe nachvollziehen und schnell wieder Kontakt aufnehmen zu koennen**

### Acceptance Criteria

**AC-1:**
- Given: der Nutzer ist angemeldet und es existieren gespeicherte Anrufe
- When: er den Anrufverlauf oeffnet
- Then: werden die Anrufe chronologisch mit Datum, Uhrzeit und Kontakt angezeigt

**AC-2:**
- Given: der Nutzer ist angemeldet und es existieren keine gespeicherten Anrufe
- When: er den Anrufverlauf oeffnet
- Then: wird eine leere Ansicht mit Hinweis angezeigt, dass kein Anrufverlauf vorhanden ist

**AC-3:**
- Given: der Nutzer hat keine Berechtigung auf den Anrufverlauf
- When: er versucht den Anrufverlauf zu oeffnen
- Then: wird der Zugriff verweigert und eine entsprechende Fehlermeldung angezeigt


---

## US-042: Status erstellen

**Priority:** MUST
**Linked Requirement:** WA-STS-001

### User Story

> As a **Endnutzer**
> I want to **einen 24-Stunden-Status erstellen und veröffentlichen**
> So that **aktuelle Informationen schnell und zuverlässig mit Kontakten zu teilen**

### Acceptance Criteria

**AC-1:**
- Given: der Nutzer ist angemeldet und hat eine gültige Internetverbindung
- When: der Nutzer einen neuen Status mit Inhalt erstellt und auf „Veröffentlichen“ tippt
- Then: der Status wird gespeichert und ist für Kontakte 24 Stunden sichtbar

**AC-2:**
- Given: der Nutzer erstellt einen Status ohne Inhalt
- When: der Nutzer auf „Veröffentlichen“ tippt
- Then: das System verhindert die Veröffentlichung und zeigt eine verständliche Fehlermeldung an

**AC-3:**
- Given: die Internetverbindung bricht während der Veröffentlichung ab
- When: der Nutzer den Status veröffentlicht
- Then: das System zeigt einen Fehler an und bietet die Möglichkeit, den Vorgang zu wiederholen


---

## US-043: Status anzeigen

**Priority:** MUST
**Linked Requirement:** WA-STS-002

### User Story

> As a **Endnutzer**
> I want to **den Status eines Kontakts anzeigen**
> So that **den Erreichbarkeitszustand schnell zu erkennen und die Kommunikation effizient zu planen**

### Acceptance Criteria

**AC-1:**
- Given: der Endnutzer ist angemeldet und die Kontaktliste ist geladen
- When: der Endnutzer einen Kontakt in der Liste oder im Chat oeffnet
- Then: zeigt das System den aktuellen Kontakt-Status klar und eindeutig an

**AC-2:**
- Given: ein Kontakt hat keinen verfuegbaren oder freigegebenen Status
- When: der Endnutzer den Kontakt oeffnet
- Then: zeigt das System einen neutralen Statusindikator oder den Hinweis 'Status nicht verfuegbar' an

**AC-3:**
- Given: es besteht keine Netzwerkverbindung oder der Statusdienst ist nicht erreichbar
- When: der Endnutzer den Kontakt-Status anfordert
- Then: informiert das System den Endnutzer ueber den Fehler und behaelt den zuletzt bekannten Status bei


---

## US-044: Status-Antwort

**Priority:** MUST
**Linked Requirement:** WA-STS-003

### User Story

> As a **Kundenservice-Mitarbeiter**
> I want to **auf eine Statusnachricht mit einer Status-Antwort reagieren**
> So that **damit Kunden schnell und zuverlässig eine Rückmeldung erhalten und die Kommunikation professionell bleibt**

### Acceptance Criteria

**AC-1:**
- Given: eine eingehende Statusnachricht liegt in einem Chat vor
- When: der Kundenservice-Mitarbeiter eine Status-Antwort sendet
- Then: wird die Antwort zugestellt und im Chatverlauf als Status-Antwort gekennzeichnet angezeigt

**AC-2:**
- Given: die Statusnachricht ist älter als das zulässige Antwortfenster
- When: der Kundenservice-Mitarbeiter versucht zu antworten
- Then: wird das Senden verhindert und eine verständliche Meldung angezeigt

**AC-3:**
- Given: die Verbindung ist während des Sendens unterbrochen
- When: die Status-Antwort gesendet werden soll
- Then: wird eine Fehlermeldung angezeigt und das System bietet einen erneuten Sendeversuch an


---

## US-045: Status-Datenschutz

**Priority:** MUST
**Linked Requirement:** WA-STS-004

### User Story

> As a **registrierter Nutzer**
> I want to **die Sichtbarkeit meines Status konfigurierbar einstellen**
> So that **meine Privatsphäre schützen und gleichzeitig eine einfache Bedienung beibehalten**

### Acceptance Criteria

**AC-1:**
- Given: der Nutzer ist angemeldet und befindet sich in den Datenschutzeinstellungen
- When: er die Status-Sichtbarkeit auf „Niemand“ setzt und speichert
- Then: ist sein Status für andere Nutzer nicht mehr sichtbar

**AC-2:**
- Given: der Nutzer ist angemeldet und befindet sich in den Datenschutzeinstellungen
- When: er die Status-Sichtbarkeit auf „Nur Kontakte“ setzt und speichert
- Then: ist sein Status ausschließlich für Kontakte sichtbar und nicht für andere Nutzer

**AC-3:**
- Given: es besteht keine Netzwerkverbindung während der Speicherung
- When: der Nutzer versucht die Status-Sichtbarkeit zu speichern
- Then: erhält er eine Fehlermeldung und die vorherige Einstellung bleibt unverändert


---

## US-046: Status stumm schalten

**Priority:** SHOULD
**Linked Requirement:** WA-STS-005

### User Story

> As a **registrierter Nutzer**
> I want to **den Status eines Kontakts stumm schalten**
> So that **Benachrichtigungen gezielt zu steuern und die Kommunikation übersichtlich zu halten**

### Acceptance Criteria

**AC-1:**
- Given: der Nutzer befindet sich in der Kontaktansicht eines aktiven Kontakts
- When: er die Option „Status stumm schalten“ auswählt
- Then: werden Status-Benachrichtigungen dieses Kontakts nicht mehr angezeigt und der Stummschalt-Status ist sichtbar gesetzt

**AC-2:**
- Given: ein Kontakt ist bereits stumm geschaltet
- When: der Nutzer erneut „Status stumm schalten“ auswählt
- Then: zeigt das System an, dass der Kontakt bereits stumm geschaltet ist, ohne den bestehenden Zustand zu ändern

**AC-3:**
- Given: die Netzwerkverbindung ist unterbrochen oder der Speichervorgang schlägt fehl
- When: der Nutzer versucht, einen Kontakt stumm zu schalten
- Then: erhält er eine Fehlermeldung und der Status bleibt unverändert


---

## US-047: Bilder senden

**Priority:** MUST
**Linked Requirement:** WA-MED-001

### User Story

> As a **registrierter Nutzer**
> I want to **ein Bild in einem Chat senden**
> So that **damit Informationen visuell schneller und klarer übermittelt werden können und die Kommunikation effizienter ist**

### Acceptance Criteria

**AC-1:**
- Given: der Nutzer ist angemeldet und befindet sich in einem bestehenden Chat
- When: er ein gültiges Bildformat auswählt und auf „Senden“ tippt
- Then: wird das Bild gesendet und im Chat für Sender und Empfänger angezeigt

**AC-2:**
- Given: der Nutzer ist angemeldet und befindet sich in einem bestehenden Chat
- When: er versucht, ein nicht unterstütztes Dateiformat als Bild zu senden
- Then: wird das Senden verhindert und eine verständliche Fehlermeldung angezeigt

**AC-3:**
- Given: der Nutzer ist angemeldet und befindet sich in einem bestehenden Chat
- When: die Bilddatei die maximal zulässige Größe überschreitet
- Then: wird das Senden abgelehnt und eine Meldung mit Hinweis zur Größenbegrenzung angezeigt

**AC-4:**
- Given: der Nutzer ist angemeldet und die Netzwerkverbindung ist instabil
- When: er ein Bild sendet und die Übertragung fehlschlägt
- Then: wird der Fehler angezeigt und der Nutzer kann den Versand erneut versuchen


---

## US-048: Videos senden

**Priority:** MUST
**Linked Requirement:** WA-MED-002

### User Story

> As a **Endnutzer**
> I want to **ein Video in einer Nachricht senden**
> So that **damit ich Inhalte anschaulich teilen und schneller kommunizieren kann**

### Acceptance Criteria

**AC-1:**
- Given: ich bin angemeldet und habe eine bestehende Unterhaltung geöffnet
- When: ich wähle ein unterstütztes Video aus und sende es
- Then: das Video wird hochgeladen und als Nachricht mit Vorschau zugestellt

**AC-2:**
- Given: ich wähle ein Video, das das maximale Dateilimit überschreitet
- When: ich versuche, es zu senden
- Then: das System blockiert den Versand und zeigt eine verständliche Fehlermeldung mit den zulässigen Grenzen an

**AC-3:**
- Given: meine Netzwerkverbindung bricht während des Uploads ab
- When: der Upload wird unterbrochen
- Then: das System zeigt den fehlgeschlagenen Versand an und bietet eine Wiederholen-Option


---

## US-049: Dokumente senden

**Priority:** MUST
**Linked Requirement:** WA-MED-003

### User Story

> As a **Endnutzer**
> I want to **beliebige Dokumente über den Dienst senden**
> So that **um schnell, sicher und plattformübergreifend Informationen mit anderen zu teilen**

### Acceptance Criteria

**AC-1:**
- Given: der Nutzer ist angemeldet und ein Empfänger wurde ausgewählt
- When: der Nutzer ein unterstütztes Dokument auswählt und auf „Senden“ klickt
- Then: wird das Dokument erfolgreich übertragen und eine Versandbestätigung angezeigt

**AC-2:**
- Given: der Nutzer ist angemeldet und ein Empfänger wurde ausgewählt
- When: der Nutzer ein sehr großes Dokument auswählt
- Then: wird der Nutzer über Größenbeschränkungen informiert und das Senden wird verhindert

**AC-3:**
- Given: der Nutzer ist angemeldet und ein Empfänger wurde ausgewählt
- When: die Netzwerkverbindung während des Sendens abbricht
- Then: erhält der Nutzer eine Fehlermeldung und kann den Versand erneut versuchen


---

## US-050: Bildbearbeitung

**Priority:** MUST
**Linked Requirement:** WA-MED-004

### User Story

> As a **App-Nutzer**
> I want to **ein Bild vor dem Senden zuschneiden und drehen**
> So that **damit Inhalte schnell und datenschutzkonform optimiert werden und die Nachricht professionell wirkt**

### Acceptance Criteria

**AC-1:**
- Given: ein Nutzer hat ein Bild in einer Nachricht ausgewählt
- When: der Nutzer das Bild zuschneidet und dreht
- Then: wird eine Vorschau angezeigt und das bearbeitete Bild wird gesendet

**AC-2:**
- Given: ein Nutzer hat ein Bild geöffnet und keine Bearbeitung vorgenommen
- When: der Nutzer die Bearbeitung bestätigt
- Then: wird das Originalbild ohne Änderungen gesendet

**AC-3:**
- Given: die Bearbeitungsschnittstelle ist geöffnet
- When: eine Bearbeitungsaktion fehlschlägt oder abgebrochen wird
- Then: erhält der Nutzer eine Fehlermeldung und das Originalbild bleibt unverändert


---

## US-051: Sticker

**Priority:** MUST
**Linked Requirement:** WA-MED-005

### User Story

> As a **registrierter Chat-Nutzer**
> I want to **Sticker in einem Chat auswaehlen und senden**
> So that **um Emotionen und Kontext schneller und intuitiver zu vermitteln**

### Acceptance Criteria

**AC-1:**
- Given: der Nutzer ist in einem aktiven Chat und Sticker sind verfuegbar
- When: der Nutzer einen Sticker auswaehlt und auf Senden tippt
- Then: wird der Sticker im Chat angezeigt und beim Empfaenger zugestellt

**AC-2:**
- Given: der Nutzer ist in einem aktiven Chat
- When: der Nutzer die Sticker-Auswahl oeffnet
- Then: werden die Sticker ohne spuerbare Verzoegerung geladen und angezeigt

**AC-3:**
- Given: der Nutzer ist in einem aktiven Chat und die Sticker-Auswahl ist leer
- When: der Nutzer die Sticker-Auswahl oeffnet
- Then: wird eine leere Ansicht mit Hinweis angezeigt und das Senden ist nicht moeglich

**AC-4:**
- Given: der Nutzer sendet einen Sticker und die Verbindung bricht ab
- When: der Sendvorgang fehlschlaegt
- Then: erhaelt der Nutzer eine Fehlermeldung und kann den Sticker erneut senden


---

## US-052: GIFs

**Priority:** MUST
**Linked Requirement:** WA-MED-006

### User Story

> As a **Endnutzer**
> I want to **GIFs suchen und in einer Nachricht versenden**
> So that **um die Kommunikation ansprechender und schneller zu gestalten**

### Acceptance Criteria

**AC-1:**
- Given: der Endnutzer befindet sich im Nachrichten-Composer und eine stabile Internetverbindung besteht
- When: er nach einem Stichwort sucht und ein GIF aus den Ergebnissen auswählt
- Then: wird das GIF in die Nachricht eingefügt und beim Senden zuverlässig zugestellt

**AC-2:**
- Given: der Endnutzer befindet sich in der GIF-Suche
- When: die Suche keine Treffer liefert
- Then: wird eine verständliche Hinweisnachricht angezeigt und es werden keine GIFs eingefügt

**AC-3:**
- Given: der Endnutzer befindet sich im Nachrichten-Composer
- When: die GIF-Suche aufgrund eines Dienstfehlers oder fehlender Verbindung fehlschlägt
- Then: wird eine Fehlermeldung angezeigt und der Nutzer kann die Suche erneut versuchen


---

## US-053: Kamera-Integration

**Priority:** MUST
**Linked Requirement:** WA-MED-007

### User Story

> As a **Chat-Nutzer**
> I want to **im Chat direkt auf die Kamera zugreifen und ein Foto aufnehmen und senden**
> So that **schnell und intuitiv visuelle Informationen teilen zu können, ohne die App zu verlassen**

### Acceptance Criteria

**AC-1:**
- Given: der Nutzer befindet sich in einem aktiven Chat und die Kamera-Berechtigung ist erteilt
- When: der Nutzer die Kamera-Funktion im Chat öffnet und ein Foto aufnimmt
- Then: wird das Foto im Chat als Vorschau angezeigt und kann gesendet werden

**AC-2:**
- Given: der Nutzer befindet sich in einem aktiven Chat und die Kamera-Berechtigung ist nicht erteilt
- When: der Nutzer die Kamera-Funktion im Chat öffnet
- Then: wird ein Berechtigungsdialog angezeigt und ohne Zustimmung kein Kamerazugriff ermöglicht

**AC-3:**
- Given: der Nutzer befindet sich in einem aktiven Chat und die Kamera ist durch eine andere App belegt
- When: der Nutzer die Kamera-Funktion im Chat öffnet
- Then: erhält der Nutzer eine verständliche Fehlermeldung und kann den Vorgang abbrechen oder erneut versuchen


---

## US-054: Audio-Dateien

**Priority:** MUST
**Linked Requirement:** WA-MED-008

### User Story

> As a **Endnutzer**
> I want to **Audio-Dateien in einer Nachricht senden**
> So that **um Informationen schnell und intuitiv zu teilen und eine zuverlässige Kommunikation sicherzustellen**

### Acceptance Criteria

**AC-1:**
- Given: der Endnutzer befindet sich in einem Chat und hat eine unterstützte Audio-Datei ausgewählt
- When: er die Nachricht sendet
- Then: wird die Audio-Datei erfolgreich übertragen und ist für den Empfänger abspielbar

**AC-2:**
- Given: der Endnutzer wählt eine nicht unterstützte Audio-Datei oder eine Datei, die die maximale Größe überschreitet
- When: er versucht, die Nachricht zu senden
- Then: wird die Übertragung blockiert und eine verständliche Fehlermeldung angezeigt

**AC-3:**
- Given: die Netzwerkverbindung ist während des Sendens instabil oder unterbrochen
- When: der Endnutzer die Audio-Datei sendet
- Then: wird der Sendestatus angezeigt und die Übertragung wird automatisch wiederholt oder als fehlgeschlagen markiert


---

## US-055: Galerie-Zugriff

**Priority:** MUST
**Linked Requirement:** WA-MED-009

### User Story

> As a **Endnutzer**
> I want to **Medien aus der Geraete-Galerie im Chat auswaehlen und senden**
> So that **damit ich schnell und sicher Inhalte teilen kann und die Kommunikation effizient bleibt**

### Acceptance Criteria

**AC-1:**
- Given: die App ist installiert und hat Berechtigung zur Geraete-Galerie
- When: ich oeffne die Medienauswahl und waehle ein Bild aus der Galerie
- Then: das ausgewaehlte Bild wird im Chat angezeigt und kann gesendet werden

**AC-2:**
- Given: die App hat keine Berechtigung zur Geraete-Galerie
- When: ich versuche die Galerie zu oeffnen
- Then: ich sehe eine klare Hinweisnachricht und eine Option, die Berechtigung zu erteilen

**AC-3:**
- Given: die Geraete-Galerie ist leer oder enthaelt keine unterstuetzten Dateitypen
- When: ich oeffne die Medienauswahl
- Then: ich erhalte eine informative Meldung und die Auswahl bleibt leer ohne App-Absturz


---

## US-056: HD-Medien

**Priority:** SHOULD
**Linked Requirement:** WA-MED-010

### User Story

> As a **Nutzer**
> I want to **Medien in HD-Qualität senden**
> So that **damit die Kommunikation hochwertig wirkt und Details klar erkennbar sind**

### Acceptance Criteria

**AC-1:**
- Given: der Nutzer hat eine stabile Verbindung und ein unterstütztes Gerät
- When: er ein Foto oder Video als HD sendet
- Then: wird das Medium in HD-Qualität übertragen und beim Empfänger in HD angezeigt

**AC-2:**
- Given: das Medium überschreitet die maximale HD-Dateigröße oder Auflösung
- When: der Nutzer den Versand startet
- Then: erhält er eine verständliche Fehlermeldung mit Hinweis auf die zulässigen Grenzen

**AC-3:**
- Given: die Netzwerkverbindung ist instabil oder langsam
- When: der Nutzer ein HD-Medium sendet
- Then: wird der Versand zuverlässig abgeschlossen oder der Nutzer erhält eine Meldung zur Wiederholung


---

## US-057: End-to-End Verschluesselung

**Priority:** MUST
**Linked Requirement:** WA-SEC-001

### User Story

> As a **registrierter Nutzer**
> I want to **Nachrichten senden und empfangen, ohne dass Dritte die Inhalte lesen koennen**
> So that **um Datenschutz und Sicherheit meiner Kommunikation zu gewaehrleisten**

### Acceptance Criteria

**AC-1:**
- Given: ein registrierter Nutzer ist angemeldet und eine Konversation ist geoeffnet
- When: der Nutzer eine Nachricht sendet
- Then: wird die Nachricht end-to-end verschluesselt uebertragen und kann nur von den beteiligten Endgeraeten entschluesselt werden

**AC-2:**
- Given: ein Dritter oder Systemdienst greift auf transportierte oder gespeicherte Nachrichten zu
- When: der Dritte versucht, den Inhalt zu lesen
- Then: ist der Inhalt unlesbar und nicht entschluesselbar ohne die Endgeraet-Schluessel

**AC-3:**
- Given: ein Endgeraet hat keinen gueltigen Schluessel oder die Schluessel sind inkonsistent
- When: eine Nachricht empfangen wird
- Then: wird die Nachricht nicht im Klartext angezeigt und der Nutzer erhaelt eine Fehlermeldung mit Hinweis zur Wiederherstellung


---

## US-058: Sicherheitscode-Verifizierung

**Priority:** MUST
**Linked Requirement:** WA-SEC-002

### User Story

> As a **Endnutzer**
> I want to **einen Sicherheitscode manuell verifizieren**
> So that **die Ende-zu-Ende-Verschluesselung nachvollziehen und Vertrauen in die Nachrichtensicherheit gewinnen**

### Acceptance Criteria

**AC-1:**
- Given: eine bestehende Unterhaltung mit angezeigtem Sicherheitscode
- When: der Endnutzer den Sicherheitscode mit dem des Kommunikationspartners manuell abgleicht und als bestaetigt markiert
- Then: zeigt das System den Verifizierungsstatus als erfolgreich an

**AC-2:**
- Given: eine Unterhaltung, in der der Sicherheitscode geaendert wurde
- When: der Endnutzer die Verifizierung erneut startet
- Then: fordert das System eine erneute manuelle Bestaetigung des neuen Sicherheitscodes an

**AC-3:**
- Given: der Endnutzer vergleicht einen Sicherheitscode, der nicht uebereinstimmt
- When: er die Verifizierung abschliesst
- Then: zeigt das System eine Warnung an und markiert die Verifizierung als fehlgeschlagen


---

## US-059: Nachrichtensperre

**Priority:** MUST
**Linked Requirement:** WA-SEC-003

### User Story

> As a **registrierter Nutzer**
> I want to **die App manuell sperren und per Authentifizierung wieder entsperren**
> So that **um meine Nachrichten und personenbezogenen Daten zu schuetzen, wenn das Geraet unbeaufsichtigt ist**

### Acceptance Criteria

**AC-1:**
- Given: die App ist installiert und der Nutzer ist angemeldet
- When: der Nutzer aktiviert die App-Sperre und legt eine Authentifizierungsmethode fest
- Then: die App sperrt sich und erfordert bei jedem Oeffnen eine erfolgreiche Authentifizierung

**AC-2:**
- Given: die App ist gesperrt und der Nutzer gibt eine falsche Authentifizierung ein
- When: der Nutzer versucht die App zu entsperren
- Then: der Zugriff wird verweigert und die Nachrichten bleiben verborgen

**AC-3:**
- Given: die App ist gesperrt
- When: der Nutzer authentifiziert sich erfolgreich
- Then: die App wird entsperrt und der Nutzer hat Zugriff auf seine Nachrichten


---

## US-060: Blockieren

**Priority:** MUST
**Linked Requirement:** WA-SEC-004

### User Story

> As a **registrierter Nutzer**
> I want to **einen Kontakt blockieren**
> So that **um unerwuenschte Kommunikation zu unterbinden und seine Privatsphaere zu schuetzen**

### Acceptance Criteria

**AC-1:**
- Given: der Nutzer ist eingeloggt und hat einen bestehenden Kontakt
- When: er die Funktion "Blockieren" fuer diesen Kontakt auswaehlt und bestaetigt
- Then: wird der Kontakt blockiert und kann dem Nutzer keine Nachrichten mehr senden

**AC-2:**
- Given: ein Kontakt ist blockiert
- When: der blockierte Kontakt versucht, eine Nachricht zu senden
- Then: wird die Nachricht nicht zugestellt und der Absender erhaelt eine passende Rueckmeldung

**AC-3:**
- Given: der Nutzer versucht, einen Kontakt zu blockieren, der nicht existiert
- When: die Blockieraktion abgesendet wird
- Then: wird eine Fehlermeldung angezeigt und es erfolgt keine Aenderung


---

## US-061: Melden

**Priority:** MUST
**Linked Requirement:** WA-SEC-005

### User Story

> As a **Endnutzer**
> I want to **eine Nachricht oder einen Kontakt melden**
> So that **um Missbrauch zu verhindern und die Sicherheit der Kommunikation zu erhöhen**

### Acceptance Criteria

**AC-1:**
- Given: der Endnutzer sieht eine erhaltene Nachricht oder einen Kontakt im Chat
- When: der Endnutzer die Option „Melden“ auswählt und den Meldegrund bestätigt
- Then: wird die Meldung erfolgreich gespeichert und dem Endnutzer eine Bestätigung angezeigt

**AC-2:**
- Given: der Endnutzer versucht eine Meldung ohne Auswahl eines Meldegrunds abzusenden
- When: der Endnutzer auf „Senden“ tippt
- Then: wird die Meldung nicht abgeschickt und der Endnutzer wird aufgefordert, einen Meldegrund auszuwählen

**AC-3:**
- Given: die Netzwerkverbindung ist unterbrochen
- When: der Endnutzer eine Meldung absendet
- Then: erhält der Endnutzer eine Fehlermeldung und die Meldung wird nicht gespeichert


---

## US-062: Zwei-Schritte-Verifizierung

**Priority:** MUST
**Linked Requirement:** WA-SEC-006

### User Story

> As a **registrierter Nutzer**
> I want to **eine optionale zusätzliche PIN-Sicherung für mein Konto aktivieren**
> So that **um meine Privatsphäre und Sicherheit zu erhöhen, ohne die Bedienung zu verkomplizieren**

### Acceptance Criteria

**AC-1:**
- Given: der Nutzer ist angemeldet und befindet sich in den Sicherheitseinstellungen
- When: er die PIN-Sicherung aktiviert und eine gültige PIN bestätigt
- Then: ist die PIN-Sicherung aktiv und wird bei sensiblen Aktionen abgefragt

**AC-2:**
- Given: der Nutzer ist angemeldet und befindet sich in den Sicherheitseinstellungen
- When: er eine ungültige PIN eingibt, die den Format- oder Längenregeln nicht entspricht
- Then: wird eine verständliche Fehlermeldung angezeigt und die Aktivierung bleibt deaktiviert

**AC-3:**
- Given: die PIN-Sicherung ist aktiv
- When: der Nutzer eine PIN-Eingabe mehrfach falsch eingibt
- Then: wird der Zugriff auf die geschützte Aktion vorübergehend blockiert und eine Sicherheitsmeldung angezeigt


---

## US-063: Spam-Erkennung

**Priority:** SHOULD
**Linked Requirement:** WA-SEC-007

### User Story

> As a **Support-Mitarbeiter fuer Content-Moderation**
> I want to **automatische Spam-Erkennung fuer eingehende und ausgehende Nachrichten aktiv nutzen**
> So that **um Missbrauch zu verhindern und die Zustellqualitaet sowie Sicherheit fuer Nutzer zu erhoehen**

### Acceptance Criteria

**AC-1:**
- Given: eine Nachricht enthaelt bekannte Spam-Muster oder uebersteigt definierte Schwellenwerte
- When: die Nachricht vom System verarbeitet wird
- Then: wird die Nachricht automatisch als Spam markiert und entsprechend gefiltert

**AC-2:**
- Given: eine legitime Nachricht aehnelt nur teilweise Spam-Mustern
- When: die Nachricht analysiert wird
- Then: wird sie nicht blockiert und als nicht-spam weitergeleitet

**AC-3:**
- Given: die Spam-Erkennung ist voruebergehend nicht verfuegbar
- When: eine Nachricht eingeht
- Then: wird die Nachricht zugestellt und der Ausfall im System-Monitoring protokolliert


---

## US-064: IP-Adresse schuetzen

**Priority:** SHOULD
**Linked Requirement:** WA-SEC-008

### User Story

> As a **Endnutzer**
> I want to **IP-Adressen bei Anrufen verschleiern**
> So that **die Privatsphaere und den Datenschutz zu erhoehen und Missbrauch zu vermeiden**

### Acceptance Criteria

**AC-1:**
- Given: ein Endnutzer initiiert einen Anruf ueber die Plattform
- When: der Anruf verbunden wird
- Then: werden die IP-Adressen beider Parteien nicht im Client angezeigt oder uebertragen

**AC-2:**
- Given: ein Endnutzer erhaelt einen eingehenden Anruf
- When: die Verbindung aufgebaut wird
- Then: ist die IP-Adresse des Anrufers fuer den Empfaenger nicht sichtbar

**AC-3:**
- Given: ein Endnutzer versucht die IP-Adresse ueber Logs oder Netzwerk-Tools im Client zu ermitteln
- When: die Sitzung aktiv ist
- Then: sind in den bereitgestellten Client-Logs keine Klardaten-IP-Adressen enthalten


---

## US-065: Push-Benachrichtigungen

**Priority:** MUST
**Linked Requirement:** WA-NOT-001

### User Story

> As a **registrierter Nutzer**
> I want to **Push-Benachrichtigungen auf meinem Geraet empfangen**
> So that **wichtige Informationen zuverlaessig und zeitnah zu erhalten**

### Acceptance Criteria

**AC-1:**
- Given: der Nutzer hat Push-Benachrichtigungen in der App aktiviert und eine Internetverbindung besteht
- When: das System eine Benachrichtigung versendet
- Then: erhaelt der Nutzer die Push-Benachrichtigung innerhalb der definierten SLA-Zeit

**AC-2:**
- Given: der Nutzer hat Push-Benachrichtigungen deaktiviert
- When: das System eine Benachrichtigung versendet
- Then: wird keine Push-Benachrichtigung auf dem Geraet angezeigt

**AC-3:**
- Given: der Push-Dienst ist temporaer nicht erreichbar
- When: das System eine Benachrichtigung versendet
- Then: wird die Benachrichtigung zwischengespeichert und nach Wiederherstellung des Dienstes erneut zugestellt


---

## US-066: Benachrichtigungsvorschau

**Priority:** MUST
**Linked Requirement:** WA-NOT-002

### User Story

> As a **Kommunikationsmanager**
> I want to **konfigurierbare Benachrichtigungsvorschauen einsehen und anpassen**
> So that **Nachrichten vor dem Versand zuverlässig prüfen zu können, um eine professionelle Kommunikation sicherzustellen**

### Acceptance Criteria

**AC-1:**
- Given: eine Benachrichtigungsvorlage mit Platzhaltern ist ausgewählt
- When: der Kommunikationsmanager die Vorschau öffnet
- Then: zeigt das System eine Vorschau mit aufgelösten Platzhaltern gemäß der aktuellen Konfiguration an

**AC-2:**
- Given: die Vorschau-Konfiguration wird für eine Plattform ohne unterstützte Elemente gespeichert
- When: der Kommunikationsmanager die Vorschau aktualisiert
- Then: zeigt das System eine deutliche Kennzeichnung der nicht unterstützten Elemente und eine Fallback-Darstellung

**AC-3:**
- Given: die Vorschau-Daten können aufgrund eines Systemfehlers nicht geladen werden
- When: der Kommunikationsmanager die Vorschau anfordert
- Then: zeigt das System eine verständliche Fehlermeldung und bietet eine erneute Ladeoption an


---

## US-067: Schnellantwort

**Priority:** MUST
**Linked Requirement:** WA-NOT-003

### User Story

> As a **registrierter Nutzer**
> I want to **eine Antwort direkt aus der Benachrichtigung senden**
> So that **um schnell und bequem zu kommunizieren, ohne die App öffnen zu müssen**

### Acceptance Criteria

**AC-1:**
- Given: der Nutzer erhält eine neue Nachricht und eine Benachrichtigung wird angezeigt
- When: der Nutzer tippt auf „Antworten“ und sendet eine Nachricht aus der Benachrichtigung
- Then: die Antwort wird gesendet und der Empfänger erhält sie zuverlässig

**AC-2:**
- Given: der Nutzer erhält eine Benachrichtigung, während das Gerät offline ist
- When: der Nutzer versucht aus der Benachrichtigung zu antworten
- Then: das System zeigt einen Hinweis auf fehlende Verbindung und sendet die Antwort erst nach Wiederherstellung der Verbindung

**AC-3:**
- Given: die Benachrichtigung ist älter und der zugehörige Chat wurde gelöscht
- When: der Nutzer versucht aus der Benachrichtigung zu antworten
- Then: das System verhindert das Senden und informiert den Nutzer, dass der Chat nicht verfügbar ist


---

## US-068: Nicht stoeren

**Priority:** MUST
**Linked Requirement:** WA-NOT-004

### User Story

> As a **registrierter Nutzer**
> I want to **den Nicht-stören-Modus aktivieren und deaktivieren**
> So that **Benachrichtigungen zeitweise zu pausieren, um konzentriert zu bleiben und dennoch die Zustellung später zuverlässig zu erhalten**

### Acceptance Criteria

**AC-1:**
- Given: der Nutzer ist angemeldet und befindet sich in den Einstellungen
- When: er den Nicht-stören-Modus aktiviert
- Then: werden alle Benachrichtigungen stummgeschaltet und der aktive Status wird sichtbar angezeigt

**AC-2:**
- Given: der Nicht-stören-Modus ist aktiviert
- When: eine neue Nachricht eingeht
- Then: wird keine Benachrichtigung angezeigt und die Nachricht bleibt im Posteingang erhalten

**AC-3:**
- Given: der Nicht-stören-Modus ist aktiviert
- When: der Nutzer den Modus deaktiviert
- Then: werden Benachrichtigungen wieder normal zugestellt und der Status wird aktualisiert


---

## US-069: Reaktionsbenachrichtigungen

**Priority:** SHOULD
**Linked Requirement:** WA-NOT-005

### User Story

> As a **registrierter Nutzer**
> I want to **Benachrichtigungen über Reaktionen auf meine eigenen Nachrichten erhalten**
> So that **damit ich schnell auf Feedback reagieren kann und die Kommunikation effizient bleibt**

### Acceptance Criteria

**AC-1:**
- Given: ich habe eine eigene Nachricht in einem Chat gesendet
- When: ein anderer Nutzer reagiert mit einer unterstützten Reaktion auf diese Nachricht
- Then: erhalte ich eine Benachrichtigung mit Absender, Nachrichtenvorschau und Reaktion in Echtzeit

**AC-2:**
- Given: ich habe Benachrichtigungen für Reaktionen in den Einstellungen deaktiviert
- When: ein anderer Nutzer reagiert auf meine Nachricht
- Then: wird keine Reaktionsbenachrichtigung an mich gesendet

**AC-3:**
- Given: die Benachrichtigungszustellung ist vorübergehend gestört
- When: eine Reaktion auf meine Nachricht erfolgt
- Then: wird die Benachrichtigung zwischengespeichert und zugestellt, sobald die Verbindung wiederhergestellt ist


---

## US-070: Anrufbenachrichtigungen

**Priority:** MUST
**Linked Requirement:** WA-NOT-006

### User Story

> As a **Endnutzer**
> I want to **separate Einstellungen für Anrufbenachrichtigungen konfigurieren**
> So that **um Anrufe zuverlässig und nach meinen Datenschutzpräferenzen zu erhalten, ohne andere Benachrichtigungen zu beeinflussen**

### Acceptance Criteria

**AC-1:**
- Given: der Nutzer ist angemeldet und befindet sich in den Benachrichtigungseinstellungen
- When: der Nutzer aktiviert die Anrufbenachrichtigungen
- Then: Anrufbenachrichtigungen sind aktiv, während andere Benachrichtigungstypen unverändert bleiben

**AC-2:**
- Given: der Nutzer hat Anrufbenachrichtigungen aktiviert
- When: der Nutzer deaktiviert ausschließlich die Anrufbenachrichtigungen
- Then: Anrufbenachrichtigungen werden nicht zugestellt, andere Benachrichtigungen bleiben aktiv

**AC-3:**
- Given: der Nutzer speichert die Benachrichtigungseinstellungen
- When: eine Netzwerkunterbrechung tritt während des Speicherns auf
- Then: das System zeigt eine Fehlermeldung an und die vorherigen Einstellungen bleiben erhalten


---

## US-071: Kontakte synchronisieren

**Priority:** MUST
**Linked Requirement:** WA-CON-001

### User Story

> As a **WhatsApp-Nutzer**
> I want to **Geraete-Kontakte mit WhatsApp-Nutzern synchronisieren**
> So that **um vorhandene Kontakte schnell zu finden und sofort Nachrichten senden zu koennen**

### Acceptance Criteria

**AC-1:**
- Given: der Nutzer hat der App den Zugriff auf die Geraete-Kontakte erlaubt
- When: der Nutzer die Synchronisierung startet
- Then: werden alle uebereinstimmenden Kontakte als WhatsApp-Nutzer in der Kontaktliste angezeigt

**AC-2:**
- Given: ein Teil der Geraete-Kontakte hat keine WhatsApp-Konten
- When: die Synchronisierung abgeschlossen ist
- Then: werden diese Kontakte nicht als WhatsApp-Nutzer markiert und bleiben unveraendert

**AC-3:**
- Given: der Nutzer hat den Zugriff auf die Geraete-Kontakte verweigert
- When: eine Synchronisierung angefordert wird
- Then: zeigt das System eine klare Fehlermeldung und eine Anleitung zur Aktivierung der Berechtigung an


---

## US-072: Kontakt hinzufuegen

**Priority:** MUST
**Linked Requirement:** WA-CON-002

### User Story

> As a **Registrierter Nutzer**
> I want to **einen neuen Kontakt über verschiedene verfügbare Wege hinzufügen**
> So that **um Kontakte schnell und intuitiv zu erfassen und eine zuverlässige Kommunikation zu ermöglichen**

### Acceptance Criteria

**AC-1:**
- Given: der Nutzer ist angemeldet und befindet sich im Bereich „Kontakte“
- When: er einen Kontakt über einen unterstützten Weg (z. B. Telefonnummer, QR‑Code, Einladung) hinzufügt und alle Pflichtangaben gültig sind
- Then: wird der Kontakt gespeichert und in der Kontaktliste angezeigt

**AC-2:**
- Given: der Nutzer versucht, einen Kontakt mit einer ungültigen oder unvollständigen Angabe hinzuzufügen
- When: er den Vorgang bestätigt
- Then: wird der Kontakt nicht gespeichert und es wird eine verständliche Fehlermeldung angezeigt

**AC-3:**
- Given: der Nutzer fügt einen Kontakt hinzu, der bereits existiert
- When: er den Vorgang bestätigt
- Then: wird ein Duplikat verhindert und eine passende Hinweisnachricht angezeigt


---

## US-073: Favoriten

**Priority:** SHOULD
**Linked Requirement:** WA-CON-003

### User Story

> As a **Endnutzer**
> I want to **Kontakte als Favoriten markieren und verwalten**
> So that **wichtige Kontakte schnell finden und eine einfache, intuitive Bedienung sicherstellen**

### Acceptance Criteria

**AC-1:**
- Given: der Nutzer ist angemeldet und sieht eine Kontaktliste
- When: er einen Kontakt als Favorit markiert
- Then: wird der Kontakt als Favorit gekennzeichnet und in der Favoritenliste angezeigt

**AC-2:**
- Given: der Nutzer hat mindestens einen Favoriten
- When: er die Favoritenansicht öffnet
- Then: werden alle favorisierten Kontakte schnell geladen und korrekt angezeigt

**AC-3:**
- Given: ein Kontakt wurde als Favorit markiert
- When: der Nutzer die Favoritenmarkierung entfernt
- Then: wird der Kontakt aus der Favoritenliste entfernt und nicht mehr als Favorit angezeigt


---

## US-074: Labels/Tags

**Priority:** SHOULD
**Linked Requirement:** WA-CON-004

### User Story

> As a **Business-Nutzer**
> I want to **Kontakt-Labels erstellen und Kontakten zuweisen**
> So that **Kontakte schnell segmentieren zu koennen und die Kommunikation effizienter zu gestalten**

### Acceptance Criteria

**AC-1:**
- Given: ein Business-Nutzer ist angemeldet und befindet sich in der Kontaktverwaltung
- When: er ein neues Label mit einem gueltigen Namen erstellt und einem Kontakt zuweist
- Then: wird das Label gespeichert und beim Kontakt angezeigt

**AC-2:**
- Given: ein Business-Nutzer erstellt ein Label mit einem bereits existierenden Namen
- When: er das Label speichert
- Then: erhaelt er eine klare Fehlermeldung und das Label wird nicht dupliziert

**AC-3:**
- Given: ein Business-Nutzer versucht ein Label mit einem leeren Namen zu erstellen
- When: er das Label speichert
- Then: wird der Vorgang abgebrochen und eine Validierungsmeldung angezeigt


---

## US-075: Unbekannte Absender

**Priority:** MUST
**Linked Requirement:** WA-CON-005

### User Story

> As a **Endnutzer**
> I want to **Nachrichten von unbekannten Absendern separat ansehen und verwalten**
> So that **damit ich Datenschutz und Sicherheit erhöhe und relevante Nachrichten schneller finde**

### Acceptance Criteria

**AC-1:**
- Given: eine eingehende Nachricht stammt von einer Nummer oder einem Profil, das nicht in meinen Kontakten und nicht verifiziert ist
- When: die Nachricht im System eintrifft
- Then: wird sie automatisch in einen separaten Bereich für unbekannte Absender einsortiert und nicht im regulären Posteingang angezeigt

**AC-2:**
- Given: ich befinde mich im Bereich für unbekannte Absender
- When: ich wähle einen Absender aus und bestätige ihn als bekannt
- Then: wird der Absender als bekannt markiert und zukünftige Nachrichten erscheinen im regulären Posteingang

**AC-3:**
- Given: eine Nachricht von einem unbekannten Absender enthält einen potenziell unsicheren Link oder Anhang
- When: die Nachricht eintrifft
- Then: wird eine Sicherheitswarnung angezeigt und das Öffnen des Inhalts erfordert eine explizite Bestätigung


---

## US-076: Nachrichtensuche

**Priority:** MUST
**Linked Requirement:** WA-SRC-001

### User Story

> As a **Endnutzer**
> I want to **Nachrichten per Volltextsuche durchsuchen**
> So that **um relevante Informationen schnell zu finden und die Kommunikation effizient fortzusetzen**

### Acceptance Criteria

**AC-1:**
- Given: der Endnutzer ist im Nachrichtensystem angemeldet und hat einen Nachrichtenverlauf
- When: er einen Suchbegriff in die Volltextsuche eingibt und die Suche ausführt
- Then: werden passende Nachrichten in kurzer Zeit angezeigt

**AC-2:**
- Given: der Endnutzer führt eine Suche mit einem seltenen oder nicht vorkommenden Begriff aus
- When: die Suche ausgeführt wird
- Then: wird eine leere Ergebnisliste mit einem Hinweis angezeigt, dass keine Treffer gefunden wurden

**AC-3:**
- Given: die Suchfunktion ist vorübergehend nicht verfügbar
- When: der Endnutzer eine Suche startet
- Then: wird eine verständliche Fehlermeldung angezeigt und die Eingabe bleibt erhalten


---

## US-077: Mediensuche

**Priority:** MUST
**Linked Requirement:** WA-SRC-002

### User Story

> As a **Endnutzer**
> I want to **die Mediensuche nach Medientypen filtern**
> So that **schnell die relevanten Inhalte finden und die Bedienung intuitiv halten**

### Acceptance Criteria

**AC-1:**
- Given: eine Suchergebnisliste mit verschiedenen Medientypen ist geöffnet
- When: der Nutzer einen Medientyp-Filter auswählt
- Then: werden ausschließlich Ergebnisse des gewählten Medientyps angezeigt

**AC-2:**
- Given: mehrere Medientyp-Filter sind verfügbar
- When: der Nutzer mehrere Medientypen auswählt
- Then: werden Ergebnisse angezeigt, die zu mindestens einem der ausgewählten Medientypen gehören

**AC-3:**
- Given: ein Medientyp-Filter wird ausgewählt, für den keine Ergebnisse existieren
- When: die Filterung angewendet wird
- Then: zeigt das System eine leere Ergebnisliste mit einem Hinweis an, dass keine Treffer gefunden wurden


---

## US-078: Chat-Suche

**Priority:** MUST
**Linked Requirement:** WA-SRC-003

### User Story

> As a **Endnutzer**
> I want to **Chats und Kontakte über eine Suchfunktion finden**
> So that **relevante Konversationen schnell wiederfinden und die Kommunikation effizient fortsetzen**

### Acceptance Criteria

**AC-1:**
- Given: der Endnutzer befindet sich in der Chat-Übersicht und es existieren mehrere Chats und Kontakte
- When: er einen Suchbegriff eingibt
- Then: werden passende Chats und Kontakte in der Ergebnisliste angezeigt

**AC-2:**
- Given: der Endnutzer gibt einen Suchbegriff ein, der zu keinem Chat oder Kontakt passt
- When: die Suche ausgeführt wird
- Then: wird eine leere Ergebnisliste mit einem Hinweis angezeigt, dass keine Treffer vorhanden sind

**AC-3:**
- Given: die Sucheingabe ist leer oder enthält nur Leerzeichen
- When: der Endnutzer die Suche startet
- Then: wird keine Suche ausgeführt und es wird die vollständige Chat-Übersicht angezeigt


---

## US-079: Datumsbasierte Suche

**Priority:** SHOULD
**Linked Requirement:** WA-SRC-004

### User Story

> As a **registrierter Nutzer**
> I want to **im Nachrichtenverlauf zu einem bestimmten Datum springen**
> So that **schnell relevante Informationen zu finden und die Bedienung zu vereinfachen**

### Acceptance Criteria

**AC-1:**
- Given: der Nutzer befindet sich im Nachrichtenverlauf mit vorhandenen Nachrichten über mehrere Tage
- When: er ein gültiges Datum auswählt und die Suche startet
- Then: springt das System zur ersten Nachricht dieses Datums und zeigt sie im Verlauf an

**AC-2:**
- Given: der Nutzer wählt ein Datum, an dem keine Nachrichten existieren
- When: er die Suche startet
- Then: zeigt das System eine eindeutige Meldung, dass keine Nachrichten für dieses Datum vorhanden sind, und bleibt im aktuellen Verlauf

**AC-3:**
- Given: der Nutzer gibt ein ungültiges Datumsformat ein
- When: er die Suche startet
- Then: wird die Eingabe abgewiesen und ein Hinweis zur korrekten Datumsangabe angezeigt


---

## US-080: Zuletzt online

**Priority:** MUST
**Linked Requirement:** WA-SET-001

### User Story

> As a **registrierter Endnutzer**
> I want to **die Sichtbarkeit meines Online-Status konfigurieren**
> So that **meine Privatsphäre zu schützen und gleichzeitig die Kommunikation zu steuern**

### Acceptance Criteria

**AC-1:**
- Given: der Nutzer ist angemeldet und öffnet die Datenschutzeinstellungen
- When: er die Sichtbarkeit auf „Nur Kontakte“ setzt und speichert
- Then: wird der Online-Status nur für bestätigte Kontakte angezeigt

**AC-2:**
- Given: der Nutzer ist angemeldet und öffnet die Datenschutzeinstellungen
- When: er die Sichtbarkeit auf „Niemand“ setzt und speichert
- Then: ist der Online-Status für andere Nutzer nicht sichtbar

**AC-3:**
- Given: eine ungültige Auswahl wird an das System gesendet
- When: der Nutzer die Änderung speichern möchte
- Then: wird die Änderung abgelehnt und eine verständliche Fehlermeldung angezeigt


---

## US-081: Lesebestaetigung

**Priority:** MUST
**Linked Requirement:** WA-SET-002

### User Story

> As a **Business-Admin**
> I want to **Lesebestaetigungen fuer Nachrichten konfigurieren (aktivieren, deaktivieren oder pro Kanal steuern)**
> So that **um Transparenz ueber zugestellte und gelesene Nachrichten zu erhalten und die Kommunikation mit Kunden zu optimieren**

### Acceptance Criteria

**AC-1:**
- Given: der Business-Admin ist eingeloggt und befindet sich in den Nachrichteneinstellungen
- When: er die Lesebestaetigung global aktiviert und speichert
- Then: werden Lesebestaetigungen fuer alle neuen Nachrichten erzeugt und angezeigt

**AC-2:**
- Given: der Business-Admin ist eingeloggt und die Lesebestaetigung ist global aktiv
- When: er die Lesebestaetigung fuer einen bestimmten Kanal deaktiviert und speichert
- Then: werden fuer diesen Kanal keine Lesebestaetigungen mehr erzeugt, waehrend andere Kanaele unveraendert bleiben

**AC-3:**
- Given: der Business-Admin hat die Einstellung geaendert, aber eine Netzwerkstoerung liegt vor
- When: er die Aenderung speichert
- Then: wird eine Fehlermeldung angezeigt und die vorherige Konfiguration bleibt unveraendert


---

## US-082: Profilbild-Sichtbarkeit

**Priority:** MUST
**Linked Requirement:** WA-SET-003

### User Story

> As a **registrierter Nutzer**
> I want to **die Sichtbarkeit meines Profilbildes konfigurieren**
> So that **meine Privatsphaere kontrollieren und gleichzeitig je nach Bedarf Vertrauen in der Kommunikation aufbauen**

### Acceptance Criteria

**AC-1:**
- Given: ich bin angemeldet und befinde mich in den Profileinstellungen
- When: ich waehle eine Sichtbarkeitsoption und speichere
- Then: die ausgewaehlte Profilbild-Sichtbarkeit wird gespeichert und sofort wirksam

**AC-2:**
- Given: ich habe die Sichtbarkeit auf 'Niemand' gesetzt
- When: ein anderer Nutzer mein Profil aufruft
- Then: mein Profilbild wird nicht angezeigt und es erscheint kein Platzhalter mit Identifikationsmerkmalen

**AC-3:**
- Given: ich versuche eine nicht vorhandene Sichtbarkeitsoption zu speichern
- When: ich die Aenderung absende
- Then: das System zeigt eine Fehlermeldung und behaelt die bisherige gueltige Einstellung bei


---

## US-083: Info-Sichtbarkeit

**Priority:** MUST
**Linked Requirement:** WA-SET-004

### User Story

> As a **registrierter Nutzer**
> I want to **die Sichtbarkeit von Info- und Status-Texten in den Einstellungen konfigurieren**
> So that **die eigene Privatsphäre zu schützen und die Kommunikation passend zu steuern**

### Acceptance Criteria

**AC-1:**
- Given: der Nutzer ist angemeldet und befindet sich in den Datenschutzeinstellungen
- When: er die Sichtbarkeit für Info- und Status-Texte auf „Nur Kontakte“ setzt und speichert
- Then: werden die Info- und Status-Texte nur für seine Kontakte sichtbar und die Auswahl ist dauerhaft gespeichert

**AC-2:**
- Given: der Nutzer befindet sich in den Datenschutzeinstellungen
- When: er die Sichtbarkeit auf „Niemand“ setzt und speichert
- Then: sind Info- und Status-Texte für andere Nutzer nicht sichtbar

**AC-3:**
- Given: der Nutzer ändert die Sichtbarkeitseinstellung und es tritt ein Systemfehler beim Speichern auf
- When: der Speichervorgang fehlschlägt
- Then: wird eine Fehlermeldung angezeigt und die vorherige Einstellung bleibt unverändert


---

## US-084: Gruppen-Einladungen

**Priority:** MUST
**Linked Requirement:** WA-SET-005

### User Story

> As a **Gruppenadministrator**
> I want to **festlegen, wer Mitglieder zu einer Gruppe hinzufuegen darf**
> So that **Datenschutz und Sicherheit zu erhoehen und Missbrauch zu verhindern**

### Acceptance Criteria

**AC-1:**
- Given: eine bestehende Gruppe und der Gruppenadministrator ist angemeldet
- When: der Administrator die Berechtigung auf „Nur Administratoren duerfen hinzufuegen“ setzt
- Then: koennen nur Administratoren neue Mitglieder zur Gruppe hinzufuegen

**AC-2:**
- Given: die Gruppe hat die Einstellung „Nur Administratoren duerfen hinzufuegen“
- When: ein normales Gruppenmitglied versucht, jemanden hinzuzufuegen
- Then: wird der Vorgang abgelehnt und eine klare Fehlermeldung angezeigt

**AC-3:**
- Given: die Gruppe hat die Einstellung „Alle Mitglieder duerfen hinzufuegen“
- When: ein Gruppenmitglied ein neues Mitglied hinzufuegt
- Then: wird das Mitglied erfolgreich hinzugefuegt und die Gruppe aktualisiert


---

## US-085: Speichernutzung

**Priority:** MUST
**Linked Requirement:** WA-SET-006

### User Story

> As a **Systemadministrator**
> I want to **die Speichernutzung einsehen und Speicher verwalten**
> So that **um Speicherengpaesse fruehzeitig zu erkennen und eine stabile Performance sicherzustellen**

### Acceptance Criteria

**AC-1:**
- Given: der Systemadministrator ist angemeldet und besitzt Berechtigung zur Speicherverwaltung
- When: er die Uebersichtsseite zur Speichernutzung oeffnet
- Then: werden Gesamtverbrauch, Nutzung pro Bereich und verbleibender Speicher in einer klaren Uebersicht angezeigt

**AC-2:**
- Given: es existieren Daten in unterschiedlichen Bereichen mit hohem Speicherverbrauch
- When: der Systemadministrator Filter nach Bereich oder Zeitraum anwendet
- Then: zeigt das System die gefilterten Verbrauchswerte korrekt und aktualisiert die Gesamtsumme

**AC-3:**
- Given: ein Bereich hat keine gespeicherten Daten
- When: der Systemadministrator die Detailansicht dieses Bereichs aufruft
- Then: zeigt das System den Verbrauch als 0 und keine Fehlermeldung

**AC-4:**
- Given: die Speichernutzungsdaten sind voruebergehend nicht verfuegbar
- When: der Systemadministrator die Uebersicht aufruft
- Then: zeigt das System eine klare Fehlermeldung mit Hinweis zur spaeteren erneuten Abfrage


---

## US-086: Datennutzung

**Priority:** MUST
**Linked Requirement:** WA-SET-007

### User Story

> As a **Endnutzer**
> I want to **meinen Datenverbrauch für Nachrichten anzeigen und begrenzen**
> So that **damit ich Datenschutz wahren und die App zuverlässig sowie performant nutzen kann**

### Acceptance Criteria

**AC-1:**
- Given: der Nutzer ist angemeldet und die Datennutzungserfassung ist aktiv
- When: der Nutzer die Ansicht „Datennutzung“ öffnet
- Then: zeigt das System den aktuellen und historischen Datenverbrauch pro Zeitraum an

**AC-2:**
- Given: der Nutzer hat ein Datenlimit definiert
- When: der Datenverbrauch das Limit erreicht oder überschreitet
- Then: informiert das System den Nutzer und reduziert die Datennutzung gemäß der gewählten Einstellung

**AC-3:**
- Given: die Datennutzungserfassung ist nicht verfügbar
- When: der Nutzer versucht die Ansicht „Datennutzung“ zu öffnen
- Then: zeigt das System eine verständliche Fehlermeldung und bietet eine erneute Versuchsmöglichkeit an


---

## US-087: Chat-Hintergrund

**Priority:** SHOULD
**Linked Requirement:** WA-SET-008

### User Story

> As a **registrierter Nutzer**
> I want to **den Chat-Hintergrund individuell auswählen und speichern**
> So that **Chats persönlicher gestalten und die Bedienung intuitiver erleben**

### Acceptance Criteria

**AC-1:**
- Given: der Nutzer ist in der Chat-Ansicht und es stehen anpassbare Hintergründe zur Auswahl
- When: der Nutzer einen Hintergrund auswählt und speichert
- Then: wird der ausgewählte Hintergrund im Chat angezeigt und bleibt für zukünftige Sitzungen gespeichert

**AC-2:**
- Given: der Nutzer lädt eine eigene Hintergrunddatei hoch
- When: die Datei ein unterstütztes Format und die zulässige Größe hat
- Then: wird der Hintergrund akzeptiert und im Chat angezeigt

**AC-3:**
- Given: der Nutzer lädt eine Hintergrunddatei mit nicht unterstütztem Format oder zu großer Größe hoch
- When: der Upload verarbeitet wird
- Then: erhält der Nutzer eine verständliche Fehlermeldung und der aktuelle Hintergrund bleibt unverändert


---

## US-088: Dark Mode

**Priority:** MUST
**Linked Requirement:** WA-SET-009

### User Story

> As a **Endnutzer**
> I want to **den Dark Mode in der App aktivieren und deaktivieren**
> So that **eine komfortable und augenschonende Nutzung bei wenig Licht sowie bessere Lesbarkeit zu erreichen**

### Acceptance Criteria

**AC-1:**
- Given: der Nutzer ist in der App angemeldet und befindet sich in den Einstellungen
- When: der Nutzer den Dark Mode aktiviert
- Then: wechselt die gesamte Benutzeroberflaeche sofort in das dunkle Farbschema

**AC-2:**
- Given: der Dark Mode ist aktiviert
- When: der Nutzer die App schliesst und erneut oeffnet
- Then: bleibt der Dark Mode aktiv und die Einstellung ist gespeichert

**AC-3:**
- Given: der Dark Mode ist aktiviert
- When: der Nutzer den Dark Mode deaktiviert
- Then: wechselt die Benutzeroberflaeche zurueck in das helle Farbschema ohne Darstellungsfehler


---

## US-089: Sprache

**Priority:** MUST
**Linked Requirement:** WA-SET-010

### User Story

> As a **registrierter Nutzer**
> I want to **die Anwendungssprache auswählen und jederzeit ändern**
> So that **die Anwendung intuitiv in meiner bevorzugten Sprache nutzen zu können**

### Acceptance Criteria

**AC-1:**
- Given: der Nutzer ist angemeldet und die Anwendung unterstützt mehrere Sprachen
- When: der Nutzer eine unterstützte Sprache auswählt
- Then: die Benutzeroberfläche wird vollständig in der gewählten Sprache angezeigt

**AC-2:**
- Given: der Nutzer hat eine Sprache ausgewählt
- When: er die Anwendung neu lädt oder später erneut öffnet
- Then: die zuletzt gewählte Sprache wird beibehalten

**AC-3:**
- Given: die gewählte Sprache ist nicht verfügbar
- When: der Nutzer versucht, diese Sprache zu aktivieren
- Then: das System zeigt eine verständliche Fehlermeldung und bleibt bei der vorherigen Sprache


---

## US-090: Cloud-Backup

**Priority:** MUST
**Linked Requirement:** WA-BAK-001

### User Story

> As a **Endnutzer**
> I want to **Chat-Backups in der Cloud aktivieren und ausfuehren**
> So that **meine Nachrichten plattformuebergreifend sicher wiederherstellen zu koennen und Datenverlust zu vermeiden**

### Acceptance Criteria

**AC-1:**
- Given: der Nutzer ist angemeldet und hat eine stabile Internetverbindung
- When: er ein Cloud-Backup ausloest
- Then: wird das Chat-Backup erfolgreich in der Cloud gespeichert und der Nutzer erhaelt eine Bestaetigung

**AC-2:**
- Given: kein Cloud-Speicher ist verfuegbar oder das Kontingent ist erschoepft
- When: der Nutzer ein Backup startet
- Then: wird der Vorgang abgebrochen und eine klare Fehlermeldung mit Hinweis auf das Problem angezeigt

**AC-3:**
- Given: ein bestehendes Cloud-Backup ist vorhanden
- When: der Nutzer ein neues Backup startet
- Then: wird das vorherige Backup sicher ueberschrieben oder versionsbasiert gespeichert gemaess den Systemeinstellungen


---

## US-091: Verschluesseltes Backup

**Priority:** MUST
**Linked Requirement:** WA-BAK-002

### User Story

> As a **registrierter Nutzer**
> I want to **ein Ende-zu-Ende verschlüsseltes Backup meiner Daten erstellen und wiederherstellen**
> So that **damit meine Daten auch bei Verlust oder Gerätewechsel sicher und vertraulich bleiben**

### Acceptance Criteria

**AC-1:**
- Given: der Nutzer ist angemeldet und hat eine aktive Internetverbindung
- When: der Nutzer ein Backup startet
- Then: wird ein Ende-zu-Ende verschlüsseltes Backup erstellt und als erfolgreich bestätigt

**AC-2:**
- Given: ein gültiges, Ende-zu-Ende verschlüsseltes Backup ist vorhanden
- When: der Nutzer die Wiederherstellung auswählt
- Then: werden die Daten vollständig und korrekt aus dem verschlüsselten Backup wiederhergestellt

**AC-3:**
- Given: der Nutzer gibt einen falschen Entschlüsselungsschlüssel an
- When: die Wiederherstellung gestartet wird
- Then: wird die Wiederherstellung abgebrochen und eine verständliche Fehlermeldung angezeigt

**AC-4:**
- Given: die Netzwerkverbindung bricht während der Sicherung ab
- When: das Backup läuft
- Then: wird der Vorgang sicher beendet und der Nutzer erhält eine Meldung mit der Möglichkeit, das Backup erneut zu starten


---

## US-092: Chat exportieren

**Priority:** MUST
**Linked Requirement:** WA-BAK-003

### User Story

> As a **Business-Nutzer**
> I want to **einen einzelnen Chat exportieren**
> So that **um Kommunikation revisionssicher zu dokumentieren und bei Bedarf weiterzugeben**

### Acceptance Criteria

**AC-1:**
- Given: ein authentifizierter Business-Nutzer hat Zugriff auf einen bestehenden Chat
- When: er den Export für diesen Chat auslöst
- Then: wird der Chat als Datei im unterstützten Format erfolgreich erstellt und zum Download angeboten

**AC-2:**
- Given: der Chat enthält viele Nachrichten und verschiedene Medientypen
- When: der Nutzer den Export ausführt
- Then: werden alle Nachrichten in korrekter Reihenfolge und alle zulässigen Medienreferenzen vollständig im Export enthalten

**AC-3:**
- Given: der Nutzer hat keine Berechtigung für den ausgewählten Chat
- When: er versucht den Export zu starten
- Then: wird der Export verweigert und eine verständliche Fehlermeldung angezeigt


---

## US-093: Chatverlauf uebertragen

**Priority:** MUST
**Linked Requirement:** WA-BAK-004

### User Story

> As a **registrierter Nutzer**
> I want to **den Chatverlauf auf ein neues Gerät übertragen**
> So that **damit ich ohne Unterbrechung weiterkommunizieren kann und meine bisherigen Nachrichten sicher verfügbar bleiben**

### Acceptance Criteria

**AC-1:**
- Given: der Nutzer ist auf dem alten Gerät angemeldet und hat einen vorhandenen Chatverlauf
- When: der Nutzer initiiert die Übertragung und meldet sich auf dem neuen Gerät an
- Then: der vollständige Chatverlauf wird innerhalb einer angemessenen Zeit auf das neue Gerät übertragen

**AC-2:**
- Given: die Übertragung ist gestartet und die Netzwerkverbindung ist instabil
- When: die Verbindung wird unterbrochen
- Then: die Übertragung wird pausiert und nach Wiederherstellung der Verbindung automatisch fortgesetzt, ohne Datenverlust

**AC-3:**
- Given: der Nutzer versucht die Übertragung auf ein Gerät mit unzureichendem Speicherplatz
- When: das System prüft die Voraussetzungen
- Then: die Übertragung wird abgebrochen und der Nutzer erhält eine verständliche Fehlermeldung mit Handlungsempfehlung


---

## US-094: Chat archivieren

**Priority:** MUST
**Linked Requirement:** WA-BAK-005

### User Story

> As a **Endnutzer**
> I want to **einen Chat archivieren**
> So that **damit ich meine aktiven Unterhaltungen uebersichtlich halte und Inhalte datenschutzkonform aufraeumen kann**

### Acceptance Criteria

**AC-1:**
- Given: ein vorhandener Chat in der Chatliste
- When: der Nutzer die Funktion „Archivieren“ auswaehlt
- Then: wird der Chat aus der aktiven Liste entfernt und im Archiv angezeigt

**AC-2:**
- Given: ein bereits archivierter Chat
- When: der Nutzer die aktive Chatliste aufruft
- Then: ist der archivierte Chat dort nicht sichtbar

**AC-3:**
- Given: eine fehlgeschlagene Archivierung wegen eines technischen Fehlers
- When: der Nutzer versucht zu archivieren
- Then: erhaelt der Nutzer eine Fehlermeldung und der Chat bleibt in der aktiven Liste


---

## US-095: Chat anpinnen

**Priority:** MUST
**Linked Requirement:** WA-BAK-006

### User Story

> As a **registrierter Nutzer**
> I want to **wichtige Chats anpinnen**
> So that **damit ich relevante Unterhaltungen schnell finde und effizient kommunizieren kann**

### Acceptance Criteria

**AC-1:**
- Given: ich befinde mich in der Chatliste und der Chat ist nicht angepinnt
- When: ich die Option „Anpinnen“ für einen Chat auswähle
- Then: wird der Chat als angepinnt markiert und in der Chatliste oben angezeigt

**AC-2:**
- Given: ich habe mehrere angepinnte Chats
- When: ich die Chatliste öffne oder aktualisiere
- Then: werden alle angepinnten Chats oberhalb der nicht angepinnten Chats angezeigt und behalten ihre Reihenfolge

**AC-3:**
- Given: ein Chat ist bereits angepinnt
- When: ich die Option „Anpinnen“ erneut auswähle
- Then: wird der Chat nicht doppelt angepinnt und das System zeigt den Status „bereits angepinnt“ an

**AC-4:**
- Given: der Server ist nicht erreichbar
- When: ich einen Chat anpinnen möchte
- Then: erhalte ich eine Fehlermeldung und der Chat bleibt unverändert, bis die Aktion erfolgreich gespeichert werden kann


---

## US-096: Business-Profil

**Priority:** MUST
**Linked Requirement:** WA-BUS-001

### User Story

> As a **Business-Nutzer**
> I want to **ein erweitertes Business-Profil erstellen und verwalten**
> So that **um professionell aufzutreten und Kundenkommunikation sowie Shop-Integration effizient zu unterstützen**

### Acceptance Criteria

**AC-1:**
- Given: der Business-Nutzer ist angemeldet und hat Zugriff auf die Profilverwaltung
- When: er alle erforderlichen Felder und optionalen Business-Informationen ausfüllt und speichert
- Then: wird das erweiterte Business-Profil erfolgreich erstellt und im Profilbereich angezeigt

**AC-2:**
- Given: der Business-Nutzer befindet sich im Profilformular
- When: Pflichtfelder fehlen oder ungültige Werte eingegeben werden
- Then: werden klare Validierungsfehler angezeigt und das Speichern verhindert

**AC-3:**
- Given: der Business-Nutzer bearbeitet ein bestehendes Business-Profil
- When: er Änderungen vornimmt und speichert
- Then: werden die Änderungen sofort übernommen und sind plattformübergreifend sichtbar

**AC-4:**
- Given: der Nutzer versucht, ein Profilbild oder Dokument hochzuladen, das gegen Richtlinien verstößt
- When: der Upload erfolgt
- Then: wird der Upload abgelehnt und eine Begründung angezeigt


---

## US-097: Verifiziertes Business

**Priority:** SHOULD
**Linked Requirement:** WA-BUS-002

### User Story

> As a **Business-Admin**
> I want to **mein Business-Profil zur Verifizierung einreichen und den Status einsehen**
> So that **damit Kunden mir vertrauen und ich professionell sowie glaubwürdig auftreten kann**

### Acceptance Criteria

**AC-1:**
- Given: ich bin als Business-Admin angemeldet und habe alle erforderlichen Profilinformationen ausgefuellt
- When: ich den Verifizierungsprozess starte und die geforderten Nachweise hochlade
- Then: wird der Antrag gespeichert und der Status auf 'in Pruefung' gesetzt

**AC-2:**
- Given: mein Verifizierungsantrag wurde erfolgreich geprueft
- When: ich mein Business-Profil aufrufe
- Then: wird ein Verifizierungsabzeichen sichtbar angezeigt und der Status als 'verifiziert' ausgewiesen

**AC-3:**
- Given: ich habe Pflichtangaben oder Nachweise nicht vollstaendig bereitgestellt
- When: ich den Verifizierungsprozess absenden moechte
- Then: erhalte ich eine klare Fehlermeldung und der Antrag wird nicht eingereicht


---

## US-098: Schnellantworten

**Priority:** MUST
**Linked Requirement:** WA-BUS-003

### User Story

> As a **Business-Administrator**
> I want to **vordefinierte Schnellantworten erstellen und verwalten**
> So that **Kundenanfragen schneller und konsistent beantworten und die Kommunikation professionalisieren**

### Acceptance Criteria

**AC-1:**
- Given: der Business-Administrator ist angemeldet und befindet sich im Bereich Nachrichten
- When: er eine neue Schnellantwort mit gültigem Titel und Text speichert
- Then: wird die Schnellantwort in der Liste angezeigt und kann in einer Nachricht eingefügt werden

**AC-2:**
- Given: der Business-Administrator ist im Bereich Schnellantworten
- When: er versucht, eine Schnellantwort ohne Text zu speichern
- Then: wird das Speichern verhindert und eine verständliche Fehlermeldung angezeigt

**AC-3:**
- Given: der Business-Administrator hat eine bestehende Schnellantwort ausgewählt
- When: er die Schnellantwort löscht
- Then: wird sie aus der Liste entfernt und steht nicht mehr zur Auswahl in Nachrichten


---

## US-099: Abwesenheitsnachrichten

**Priority:** MUST
**Linked Requirement:** WA-BUS-004

### User Story

> As a **Shop-Admin**
> I want to **automatische Abwesenheitsnachrichten aktivieren und konfigurieren**
> So that **Kunden waehrend der Abwesenheit professionell informieren und Anfragen zuverlaessig beantworten**

### Acceptance Criteria

**AC-1:**
- Given: der Shop-Admin ist eingeloggt und hat Zugriff auf Nachrichten-Einstellungen
- When: er eine Abwesenheitsnachricht mit Zeitraum und Text speichert und aktiviert
- Then: sendet das System waehrend des Zeitraums automatisch die konfigurierte Nachricht an eingehende Anfragen

**AC-2:**
- Given: eine aktive Abwesenheitsnachricht ist konfiguriert
- When: der konfigurierte Zeitraum endet
- Then: beendet das System die automatischen Antworten und sendet keine weiteren Abwesenheitsnachrichten

**AC-3:**
- Given: ein Shop-Admin versucht eine Abwesenheitsnachricht ohne Pflichtfelder zu speichern
- When: er die Einstellungen speichert
- Then: zeigt das System eine Validierungsfehlermeldung an und speichert die Nachricht nicht


---

## US-100: Begrussungsnachrichten

**Priority:** MUST
**Linked Requirement:** WA-BUS-005

### User Story

> As a **Shop-Admin**
> I want to **automatische Begruessungsnachrichten beim Erstkontakt konfigurieren und ausspielen lassen**
> So that **Kunden professionell und sofort willkommen heissen, um Servicequalitaet zu steigern und die Kommunikation zu standardisieren**

### Acceptance Criteria

**AC-1:**
- Given: ein neuer Kontakt schreibt die erste Nachricht an das Business-Profil
- When: die Begruessungsnachricht ist aktiviert und konfiguriert
- Then: das System sendet automatisch genau eine Begruessungsnachricht innerhalb einer kurzen, definierten Zeitspanne

**AC-2:**
- Given: ein bestehender Kontakt hat bereits zuvor mit dem Business-Profil interagiert
- When: derselbe Kontakt erneut eine Nachricht sendet
- Then: das System sendet keine Begruessungsnachricht erneut


---

## US-101: Produktkatalog

**Priority:** MUST
**Linked Requirement:** WA-BUS-006

### User Story

> As a **Business-Administrator**
> I want to **einen Produktkatalog erstellen und verwalten**
> So that **damit Kunden die Produkte schnell und intuitiv finden und Anfragen effizient bearbeitet werden können**

### Acceptance Criteria

**AC-1:**
- Given: ein verifiziertes Business-Profil mit aktivem Katalogzugriff
- When: der Business-Administrator einen neuen Katalog mit Produkten anlegt
- Then: wird der Katalog gespeichert und ist fuer Kunden plattformuebergreifend sichtbar

**AC-2:**
- Given: ein bestehender Produktkatalog
- When: der Business-Administrator ein Produkt aktualisiert oder entfernt
- Then: sind die Aenderungen sofort im Katalog ersichtlich und die Produktliste bleibt konsistent

**AC-3:**
- Given: ein Produkt mit fehlenden Pflichtangaben wie Name oder Preis
- When: der Business-Administrator versucht, das Produkt zu speichern
- Then: wird eine Validierungsfehlermeldung angezeigt und das Produkt wird nicht gespeichert


---

## US-102: Warenkorb

**Priority:** SHOULD
**Linked Requirement:** WA-BUS-007

### User Story

> As a **Endkunde**
> I want to **Produkte in einen Warenkorb legen und vor der Bestellung bearbeiten**
> So that **um eine einfache, intuitive und schnelle Bestellung vorzubereiten**

### Acceptance Criteria

**AC-1:**
- Given: der Endkunde ist im Shop und ein Produkt ist verfuegbar
- When: er auf "In den Warenkorb" klickt
- Then: wird das Produkt dem Warenkorb hinzugefuegt und die aktualisierte Anzahl/Preis angezeigt

**AC-2:**
- Given: der Endkunde hat mehrere Produkte im Warenkorb
- When: er die Menge eines Produkts aendert
- Then: werden Zwischensumme und Gesamtsumme sofort korrekt aktualisiert

**AC-3:**
- Given: der Endkunde hat ein Produkt im Warenkorb
- When: er das Produkt entfernt
- Then: wird es aus dem Warenkorb geloescht und der Warenkorb entsprechend aktualisiert

**AC-4:**
- Given: die Verbindung ist unterbrochen oder die Anfrage kann nicht verarbeitet werden
- When: der Endkunde ein Produkt in den Warenkorb legen moechte
- Then: wird eine klare Fehlermeldung angezeigt und der Warenkorb bleibt unveraendert


---

## US-103: WhatsApp Pay

**Priority:** COULD
**Linked Requirement:** WA-BUS-008

### User Story

> As a **Privatnutzer**
> I want to **eine In-App-Zahlung über WhatsApp Pay durchführen**
> So that **damit ich schnell und sicher bezahlen kann, ohne die App zu verlassen**

### Acceptance Criteria

**AC-1:**
- Given: der Nutzer befindet sich in einem unterstützten Markt und hat eine gültige Zahlungsmethode hinterlegt
- When: er eine Zahlung in einem Chat initiiert und bestätigt
- Then: wird die Zahlung erfolgreich verarbeitet und eine Bestätigung im Chat angezeigt

**AC-2:**
- Given: der Nutzer befindet sich in einem nicht unterstützten Markt
- When: er versucht, WhatsApp Pay zu öffnen
- Then: wird eine verständliche Meldung angezeigt, dass der Dienst in diesem Markt nicht verfügbar ist

**AC-3:**
- Given: der Nutzer hat eine Zahlungsmethode hinterlegt, aber die Zahlung wird vom Zahlungsanbieter abgelehnt
- When: er die Zahlung bestätigt
- Then: wird die Zahlung abgebrochen und eine Fehlermeldung mit Hinweis auf erneuten Versuch oder andere Zahlungsmethode angezeigt


---

## US-104: Business-Statistiken

**Priority:** MUST
**Linked Requirement:** WA-BUS-009

### User Story

> As a **Business-Admin**
> I want to **grundlegende Nachrichtenstatistiken zu seinen Business-Konversationen im Dashboard einsehen**
> So that **die Kundenkommunikation zu optimieren und fundierte Entscheidungen auf Basis von Leistungskennzahlen zu treffen**

### Acceptance Criteria

**AC-1:**
- Given: der Business-Admin ist authentifiziert und hat Zugriff auf das Business-Dashboard
- When: er die Statistikansicht für einen ausgewählten Zeitraum öffnet
- Then: werden grundlegende Kennzahlen wie gesendete Nachrichten, zugestellte Nachrichten und Antwortrate korrekt angezeigt

**AC-2:**
- Given: der Business-Admin wählt einen Zeitraum ohne Nachrichtenaktivität
- When: die Statistikansicht geladen wird
- Then: werden die Kennzahlen mit 0-Werten angezeigt und es erscheint ein Hinweis, dass keine Aktivität vorliegt

**AC-3:**
- Given: der Business-Admin ist authentifiziert
- When: die Statistikdaten aufgrund eines Systemfehlers nicht geladen werden können
- Then: wird eine verständliche Fehlermeldung angezeigt und es gibt die Option zum erneuten Laden


---

## US-105: API-Zugang

**Priority:** MUST
**Linked Requirement:** WA-BUS-010

### User Story

> As a **Integrationsentwickler**
> I want to **über eine dokumentierte Business-API Nachrichten und Unternehmensdaten sicher integrieren**
> So that **automatisierte und zuverlässige Integrationen mit schneller Performance zu ermöglichen**

### Acceptance Criteria

**AC-1:**
- Given: ein registriertes Business-Profil mit gültigen API-Zugangsdaten
- When: der Entwickler eine autorisierte API-Anfrage gemäß Dokumentation sendet
- Then: liefert die API eine erfolgreiche Antwort innerhalb der definierten Performance-Grenzen

**AC-2:**
- Given: ein API-Schlüssel, der ungültig ist oder fehlt
- When: eine Anfrage an die Business-API gestellt wird
- Then: antwortet die API mit einem klaren 401/403-Fehler und einer verständlichen Fehlermeldung

**AC-3:**
- Given: das definierte Rate-Limit für die API ist erreicht
- When: weitere Anfragen gesendet werden
- Then: weist die API die Anfragen mit einem Rate-Limit-Fehler zurück und gibt Informationen zum Reset-Zeitpunkt zurück


---

## US-106: Screenreader-Unterstuetzung

**Priority:** MUST
**Linked Requirement:** WA-ACC-001

### User Story

> As a **Endnutzer**
> I want to **die Anwendung vollständig per Screenreader bedienen**
> So that **damit ich die Plattform barrierefrei, intuitiv und zuverlässig nutzen kann**

### Acceptance Criteria

**AC-1:**
- Given: ein aktivierter Screenreader auf einem unterstützten Endgerät
- When: ich durch die Hauptnavigation und zentrale Funktionen navigiere
- Then: werden alle Bedienelemente korrekt vorgelesen, sind eindeutig beschriftet und vollständig bedienbar

**AC-2:**
- Given: ein Screenreader und eine komplexe Ansicht mit Formularfeldern
- When: ich ein Formular ausfülle und absende
- Then: werden Feldbeschriftungen, Pflichtfelder und Validierungshinweise korrekt vorgelesen und nachvollziehbar angezeigt

**AC-3:**
- Given: ein Screenreader und ein dynamisch aktualisierter Bereich (z. B. Nachrichtenliste)
- When: neue Inhalte geladen oder aktualisiert werden
- Then: werden die Änderungen ohne Fokusverlust angekündigt und sind direkt zugänglich


---

## US-107: Schriftgroesse

**Priority:** MUST
**Linked Requirement:** WA-ACC-002

### User Story

> As a **Endnutzer**
> I want to **die Schriftgröße in der Anwendung anpassen**
> So that **die Bedienung einfacher und intuitiver zu gestalten und Inhalte besser lesen zu können**

### Acceptance Criteria

**AC-1:**
- Given: der Endnutzer ist in der Anwendung und die Anzeigeeinstellungen sind geöffnet
- When: er eine verfügbare Schriftgröße auswählt und bestätigt
- Then: werden alle Texte im aktiven Bereich sofort in der gewählten Schriftgröße angezeigt

**AC-2:**
- Given: der Endnutzer hat die Schriftgröße auf einen extremen Wert gesetzt
- When: der Wert die vordefinierten Mindest- oder Höchstgrenzen überschreitet
- Then: setzt das System die nächstzulässige Schriftgröße und informiert den Endnutzer

**AC-3:**
- Given: der Endnutzer speichert eine neue Schriftgröße
- When: er die Anwendung neu startet oder ein anderes Gerät verwendet
- Then: wird die zuletzt gespeicherte Schriftgröße wiederhergestellt, sofern der Nutzer angemeldet ist


---

## US-108: Kontrast

**Priority:** MUST
**Linked Requirement:** WA-ACC-003

### User Story

> As a **Endnutzer**
> I want to **die Benutzeroberflaeche mit ausreichendem Farbkontrast nutzen**
> So that **damit Inhalte schnell und sicher lesbar sind und die Bedienung intuitiv bleibt**

### Acceptance Criteria

**AC-1:**
- Given: die Standard-Benutzeroberflaeche wird angezeigt
- When: der Endnutzer Texte, Icons und interaktive Elemente betrachtet
- Then: erreichen alle relevanten Vordergrund-Hintergrund-Kombinationen mindestens das Kontrastverhaeltnis 4,5:1

**AC-2:**
- Given: ein interaktives Element hat verschiedene Zustaende
- When: der Endnutzer zwischen normal, Hover, Fokus und deaktiviert wechselt
- Then: bleibt der Kontrast in jedem Zustand ausreichend und die Lesbarkeit erhalten

**AC-3:**
- Given: eine benutzerdefinierte Farbkombination wird angewendet
- When: das System die Darstellung rendert
- Then: wird eine Warnung angezeigt oder eine zugelassene Ersatzfarbe gesetzt, falls das Mindestkontrastverhaeltnis unterschritten wird


---

## US-109: Sprachnachrichten transkribieren

**Priority:** SHOULD
**Linked Requirement:** WA-ACC-004

### User Story

> As a **Endnutzer**
> I want to **Sprachnachrichten automatisch in Text transkribieren lassen**
> So that **Inhalte schnell lesen zu koennen und die Bedienung plattformuebergreifend zu vereinfachen**

### Acceptance Criteria

**AC-1:**
- Given: eine empfangene Sprachnachricht im Chat
- When: die Transkriptionsfunktion aktiviert wird
- Then: wird der Text der Sprachnachricht innerhalb kurzer Zeit angezeigt

**AC-2:**
- Given: eine Sprachnachricht mit geringer Audioqualitaet oder Hintergrundgeraeuschen
- When: die Transkription gestartet wird
- Then: wird ein Transkript bereitgestellt und unklare Passagen werden als solche gekennzeichnet

**AC-3:**
- Given: eine Sprachnachricht in einem nicht unterstuetzten Format oder bei einem Transkriptionsfehler
- When: die Transkription angefordert wird
- Then: erhaelt der Nutzer eine klare Fehlermeldung und die Sprachnachricht bleibt weiterhin abspielbar


---

## US-110: Offline-Modus

**Priority:** MUST
**Linked Requirement:** WA-PERF-001

### User Story

> As a **registrierter Nutzer**
> I want to **grundlegende Funktionen im Offline-Modus nutzen**
> So that **die App auch ohne Internetverbindung zuverlässig verwenden und Arbeitsabläufe fortsetzen zu können**

### Acceptance Criteria

**AC-1:**
- Given: der Nutzer hat sich zuvor online angemeldet und die App ist gestartet
- When: die Internetverbindung ausfällt
- Then: kann der Nutzer die grundlegenden Funktionen weiter nutzen, ohne dass die App abstürzt

**AC-2:**
- Given: die App befindet sich im Offline-Modus
- When: der Nutzer erstellt eine Nachricht oder einen Eintrag, der online gesendet werden muss
- Then: wird der Vorgang lokal gespeichert und als ausstehend markiert

**AC-3:**
- Given: es bestehen ausstehende Vorgänge aus dem Offline-Modus
- When: die Internetverbindung wiederhergestellt wird
- Then: werden die Vorgänge automatisch synchronisiert und der Nutzer erhält eine Bestätigung

**AC-4:**
- Given: die App befindet sich im Offline-Modus
- When: der Nutzer versucht eine Funktion, die zwingend eine Online-Verbindung benötigt
- Then: erhält der Nutzer eine verständliche Fehlermeldung mit Hinweis auf die erforderliche Verbindung


---

## US-111: Schneller App-Start

**Priority:** MUST
**Linked Requirement:** WA-PERF-002

### User Story

> As a **Endnutzer**
> I want to **die App starten und schnell zur Startansicht gelangen**
> So that **um die App ohne Wartezeit zu nutzen und eine gute Nutzererfahrung zu haben**

### Acceptance Criteria

**AC-1:**
- Given: die App ist installiert und das Geraet hat eine stabile Internetverbindung
- When: der Nutzer die App oeffnet
- Then: erscheint die Startansicht innerhalb von 2 Sekunden

**AC-2:**
- Given: die App wurde seit dem letzten Start nicht geoeffnet und der Cache ist leer
- When: der Nutzer die App startet
- Then: erscheint die Startansicht innerhalb von 3 Sekunden

**AC-3:**
- Given: die Internetverbindung ist instabil
- When: der Nutzer die App oeffnet
- Then: wird eine lokale Startansicht innerhalb von 3 Sekunden angezeigt und der Nutzer erhaelt einen Hinweis auf die eingeschraenkte Verbindung


---

## US-112: Effiziente Synchronisation

**Priority:** MUST
**Linked Requirement:** WA-PERF-003

### User Story

> As a **Endnutzer**
> I want to **Nachrichten über alle Geräte hinweg synchronisieren**
> So that **um stets den aktuellen Nachrichtenstand zu haben und zuverlässig antworten zu können**

### Acceptance Criteria

**AC-1:**
- Given: der Nutzer ist auf zwei Geräten angemeldet und beide haben eine aktive Internetverbindung
- When: eine neue Nachricht auf Gerät A eingeht
- Then: wird die Nachricht innerhalb von 5 Sekunden auf Gerät B angezeigt

**AC-2:**
- Given: der Nutzer hat auf Gerät A eine Nachricht gelesen
- When: die Synchronisation abgeschlossen ist
- Then: wird der Lesestatus auf Gerät B korrekt übernommen

**AC-3:**
- Given: eine Instanz ist vorübergehend offline
- When: die Verbindung wiederhergestellt wird
- Then: werden alle während der Offline-Zeit empfangenen Nachrichten automatisch und in korrekter Reihenfolge synchronisiert

**AC-4:**
- Given: die Synchronisation ist durch eine Serverstörung nicht möglich
- When: eine Synchronisation ausgelöst wird
- Then: wird eine verständliche Fehlermeldung angezeigt und ein automatischer Wiederholungsversuch gestartet


---

## US-113: Batterieeffizienz

**Priority:** MUST
**Linked Requirement:** WA-PERF-004

### User Story

> As a **Endnutzer**
> I want to **die App nutzen, ohne dass sie den Akku übermäßig belastet**
> So that **eine längere Akkulaufzeit zu gewährleisten und die Nutzung unterwegs zuverlässig zu ermöglichen**

### Acceptance Criteria

**AC-1:**
- Given: die App ist installiert und im Hintergrund aktiv
- When: über einen Zeitraum von 4 Stunden keine aktive Nutzung erfolgt
- Then: verursacht die App keinen ungewöhnlichen Akkuverbrauch im Vergleich zu vergleichbaren Messenger-Apps

**AC-2:**
- Given: die App wird aktiv genutzt und Nachrichten werden gesendet
- When: innerhalb von 30 Minuten mehrere Nachrichten gesendet und empfangen werden
- Then: bleibt der Akkuverbrauch innerhalb eines definierten, dokumentierten Grenzwerts

**AC-3:**
- Given: das Gerät wechselt in den Energiesparmodus
- When: die App im Hintergrund bleibt
- Then: reduziert die App ihre Hintergrundaktivitäten, ohne dass neue Nachrichten verloren gehen


---

## US-114: Speichereffizienz

**Priority:** MUST
**Linked Requirement:** WA-PERF-005

### User Story

> As a **Systemadministrator**
> I want to **Speicherverbrauch des Systems überwachen und sicherstellen, dass Nachrichten und Medien speichereffizient abgelegt werden**
> So that **Betriebskosten senken und eine schnelle Performance sowie zuverlässige Zustellung sicherstellen**

### Acceptance Criteria

**AC-1:**
- Given: das System verarbeitet Nachrichten und Medien im Normalbetrieb
- When: Daten gespeichert werden
- Then: werden sie komprimiert und dedupliziert abgelegt, sodass der Speicherverbrauch pro Nachricht unter dem definierten Grenzwert liegt

**AC-2:**
- Given: der verfügbare Speicher nähert sich dem Warnschwellwert
- When: neue Inhalte gespeichert werden sollen
- Then: werden Archivierungs- oder Bereinigungsregeln automatisch angewendet und der Betrieb bleibt ohne Ausfälle

**AC-3:**
- Given: eine nicht komprimierbare oder beschädigte Datei wird eingereicht
- When: das System die Speicherung versucht
- Then: wird ein definierter Fehler protokolliert und die Speicherung abgelehnt, ohne andere Daten zu beeinträchtigen


---

## US-115: Share-Extension

**Priority:** MUST
**Linked Requirement:** WA-INT-001

### User Story

> As a **Endnutzer**
> I want to **Inhalte über die systemweite Teilen-Funktion an das System senden**
> So that **eine einfache und sichere Nutzung ohne Plattformwechsel zu ermöglichen**

### Acceptance Criteria

**AC-1:**
- Given: der Nutzer befindet sich in einer Dritt-App mit einer Teilen-Funktion
- When: der Nutzer die System-Sharing-Integration auswählt und den Inhalt teilt
- Then: der Inhalt wird im System übernommen und als neue Nachricht vorbereitet

**AC-2:**
- Given: der geteilte Inhalt ist sehr groß oder enthält mehrere Anhänge
- When: der Nutzer den Inhalt teilt
- Then: das System übernimmt alle unterstützten Anhänge und informiert über nicht unterstützte Dateitypen

**AC-3:**
- Given: die System-Sharing-Integration ist nicht verfügbar oder die Berechtigung fehlt
- When: der Nutzer versucht zu teilen
- Then: das System zeigt eine verständliche Fehlermeldung und bietet einen sicheren Abbruch an


---

## US-116: Siri/Google Assistant

**Priority:** SHOULD
**Linked Requirement:** WA-INT-002

### User Story

> As a **Endnutzer**
> I want to **Nachrichten und Abfragen per Siri oder Google Assistant ausführen**
> So that **die Plattform schnell, intuitiv und plattformuebergreifend nutzen, ohne die App zu oeffnen**

### Acceptance Criteria

**AC-1:**
- Given: der Nutzer hat die Sprachassistenten-Integration aktiviert und Berechtigungen erteilt
- When: der Nutzer gibt einen gueltigen Sprachbefehl zum Senden einer Nachricht
- Then: die Nachricht wird erfolgreich versendet und der Assistent bestaetigt die Zustellung

**AC-2:**
- Given: der Nutzer hat die Sprachassistenten-Integration aktiviert
- When: der Nutzer stellt eine Anfrage nach dem Zustellstatus einer Nachricht
- Then: der Assistent liefert den aktuellen Status in angemessener Zeit

**AC-3:**
- Given: die Integration ist deaktiviert oder der Sprachbefehl ist ungueltig
- When: der Nutzer versucht eine Aktion per Sprachassistent
- Then: das System gibt eine klare Fehlermeldung und bietet an, die Integration zu aktivieren oder den Befehl zu wiederholen


---

## US-117: Widgets

**Priority:** SHOULD
**Linked Requirement:** WA-INT-003

### User Story

> As a **Endnutzer**
> I want to **Home-Screen-Widgets für die App hinzufügen und konfigurieren**
> So that **um wichtige Informationen schnell und plattformübergreifend mit hoher Performance und sicherer Datenverarbeitung zu sehen**

### Acceptance Criteria

**AC-1:**
- Given: der Nutzer hat die App installiert und Widgets sind vom System unterstützt
- When: der Nutzer ein Widget zum Home-Screen hinzufügt und eine verfügbare Ansicht auswählt
- Then: das Widget wird angezeigt und lädt die Inhalte schnell und korrekt

**AC-2:**
- Given: der Nutzer hat keine gültige Session oder den Datenschutz-Berechtigungen nicht zugestimmt
- When: das Widget versucht Daten zu laden
- Then: das Widget zeigt einen Hinweis an, dass eine Anmeldung oder Zustimmung erforderlich ist, ohne Daten preiszugeben

**AC-3:**
- Given: keine Netzwerkverbindung oder der Backend-Service ist nicht erreichbar
- When: das Widget aktualisiert die Inhalte
- Then: das Widget zeigt eine verständliche Fehlermeldung und behält die zuletzt erfolgreichen Daten bei


---

## US-118: Watch-App

**Priority:** SHOULD
**Linked Requirement:** WA-INT-004

### User Story

> As a **Endnutzer**
> I want to **Nachrichten und Benachrichtigungen über die Smartwatch empfangen und lesen**
> So that **um schnell und zuverlässig informiert zu sein und die Bedienung unterwegs einfach zu halten**

### Acceptance Criteria

**AC-1:**
- Given: die Smartwatch ist mit dem Konto gekoppelt und die Integration ist aktiviert
- When: eine neue Nachricht im System eingeht
- Then: wird innerhalb von 5 Sekunden eine Benachrichtigung auf der Smartwatch angezeigt

**AC-2:**
- Given: die Smartwatch ist verbunden und es liegen mehrere neue Nachrichten vor
- When: der Nutzer die Benachrichtigung öffnet
- Then: werden Absender, Zeitstempel und Vorschau der Nachricht korrekt angezeigt

**AC-3:**
- Given: die Smartwatch ist nicht verbunden oder die Integration ist deaktiviert
- When: eine neue Nachricht eingeht
- Then: wird keine Smartwatch-Benachrichtigung gesendet und der Nutzer erhält eine Hinweismeldung in der App


---

## US-119: Desktop-App

**Priority:** MUST
**Linked Requirement:** WA-INT-005

### User Story

> As a **Geschaeftsnutzer**
> I want to **die native Desktop-App auf seinem Betriebssystem installieren und fuer die Kommunikation nutzen**
> So that **um eine einfache, schnelle und sichere Kundenkommunikation plattformuebergreifend zu ermoeglichen**

### Acceptance Criteria

**AC-1:**
- Given: der Geschaeftsnutzer nutzt ein unterstuetztes Betriebssystem (Windows oder macOS)
- When: er die Desktop-App herunterlaedt, installiert und sich anmeldet
- Then: kann er Nachrichten senden und empfangen und die App reagiert performant

**AC-2:**
- Given: der Geschaeftsnutzer hat keine Internetverbindung
- When: er versucht, eine Nachricht in der Desktop-App zu senden
- Then: wird eine klare Fehlermeldung angezeigt und die Nachricht wird nicht versendet

**AC-3:**
- Given: der Geschaeftsnutzer nutzt ein nicht unterstuetztes Betriebssystem
- When: er versucht, die Desktop-App zu installieren
- Then: erhaelt er einen Hinweis auf die nicht verfuegbare Plattform und alternative Zugriffsmöglichkeiten


---

## US-120: Web-Version

**Priority:** MUST
**Linked Requirement:** WA-INT-006

### User Story

> As a **Endnutzer**
> I want to **die Anwendung ueber eine Web-Version im Browser nutzen**
> So that **um plattformuebergreifend und ohne Installation schnell und zuverlaessig kommunizieren zu koennen**

### Acceptance Criteria

**AC-1:**
- Given: ein Endnutzer oeffnet einen unterstuetzten Browser
- When: die Web-Anwendung aufgerufen und ein gueltiger Login durchgefuehrt wird
- Then: die Web-Version wird geladen und alle Kernfunktionen sind verfuegbar

**AC-2:**
- Given: ein Endnutzer nutzt die Web-Version
- When: die Internetverbindung kurzzeitig unterbrochen wird
- Then: der Nutzer erhaelt eine klare Statusmeldung und die Sitzung wird nach Wiederverbindung fortgesetzt

**AC-3:**
- Given: ein Endnutzer versucht den Zugriff
- When: ein nicht unterstuetzter Browser verwendet wird
- Then: es wird ein Hinweis angezeigt und eine Empfehlung zu unterstuetzten Browsern gegeben


---

## US-121: Meta AI Chat

**Priority:** SHOULD
**Linked Requirement:** WA-AI-001

### User Story

> As a **Business-Kundenbetreuer**
> I want to **den integrierten KI-Assistenten im Chat aktivieren und nutzen, um Kundenanfragen automatisiert zu beantworten**
> So that **um schnelle, konsistente und professionelle Kommunikation sicherzustellen und die Bearbeitungszeit zu reduzieren**

### Acceptance Criteria

**AC-1:**
- Given: der Kundenbetreuer ist eingeloggt und der Chat ist geöffnet
- When: er den KI-Assistenten aktiviert und eine Kundenanfrage eingeht
- Then: wird innerhalb akzeptabler Zeit eine passende Antwort vorgeschlagen und kann gesendet werden

**AC-2:**
- Given: eine Kundenanfrage enthält unklare oder mehrdeutige Informationen
- When: der KI-Assistent die Anfrage verarbeitet
- Then: fordert er eine gezielte Rückfrage an, statt eine falsche Antwort zu senden

**AC-3:**
- Given: die KI-Integration ist temporär nicht verfügbar
- When: der Kundenbetreuer den KI-Assistenten nutzen möchte
- Then: wird eine verständliche Fehlermeldung angezeigt und der manuelle Antwortmodus bleibt verfügbar


---

## US-122: Smart Reply

**Priority:** COULD
**Linked Requirement:** WA-AI-002

### User Story

> As a **Geschaeftskundenbetreiber**
> I want to **intelligente Antwortvorschlaege beim Beantworten von Kundennachrichten nutzen**
> So that **schneller und konsistenter auf Kundenanfragen reagieren zu koennen und die Servicequalitaet zu steigern**

### Acceptance Criteria

**AC-1:**
- Given: eine eingehende Kundennachricht ist im Chat geoeffnet
- When: der Nutzer das Antwortfeld fokussiert
- Then: das System zeigt innerhalb von 2 Sekunden mindestens einen relevanten Antwortvorschlag an

**AC-2:**
- Given: der Nutzer waehlt einen vorgeschlagenen Text aus
- When: er den Vorschlag anklickt
- Then: der Text wird in das Eingabefeld uebernommen und kann vor dem Senden bearbeitet werden

**AC-3:**
- Given: die Nachricht enthaelt unklare oder mehrdeutige Informationen
- When: das System keine hinreichend relevanten Vorschlaege generieren kann
- Then: es werden keine Vorschlaege angezeigt und der Nutzer kann weiterhin manuell antworten

**AC-4:**
- Given: der Dienst zur Vorschlagserstellung ist voruebergehend nicht verfuegbar
- When: der Nutzer das Antwortfeld fokussiert
- Then: es erscheint eine neutrale Hinweisnachricht und die normale manuelle Antwortfunktion bleibt nutzbar


---

## US-123: Sticker-Vorschlaege

**Priority:** COULD
**Linked Requirement:** WA-AI-003

### User Story

> As a **Endnutzer**
> I want to **in einem Chat kontextbasierte Sticker-Vorschlaege angezeigt bekommen**
> So that **damit ich schneller und intuitiver auf Nachrichten reagieren kann**

### Acceptance Criteria

**AC-1:**
- Given: der Nutzer befindet sich in einem Chat und tippt eine Nachricht ein
- When: der eingegebene Text einen erkennbaren Kontext enthaelt
- Then: das System zeigt passende Sticker-Vorschlaege an

**AC-2:**
- Given: der Nutzer befindet sich in einem Chat und tippt eine Nachricht ein
- When: der eingegebene Text keinen eindeutigen Kontext hat
- Then: das System zeigt neutrale oder keine Sticker-Vorschlaege an

**AC-3:**
- Given: der Nutzer befindet sich in einem Chat
- When: die Sticker-Vorschlaege aufgrund eines technischen Fehlers nicht geladen werden koennen
- Then: das System zeigt keine Vorschlaege an und beeintraechtigt die Nachrichteneingabe nicht


---

## US-124: RTL-Unterstuetzung

**Priority:** MUST
**Linked Requirement:** WA-LOC-001

### User Story

> As a **Endnutzer**
> I want to **die Benutzeroberflaeche in einer rechts-nach-links Sprache verwenden**
> So that **um die Anwendung intuitiv und fehlerfrei bedienen zu koennen**

### Acceptance Criteria

**AC-1:**
- Given: die Anwendung ist auf eine rechts-nach-links Sprache eingestellt
- When: der Nutzer die Hauptnavigation und Inhaltsseiten oeffnet
- Then: werden Layout, Textausrichtung und Navigation vollstaendig rechts-nach-links dargestellt

**AC-2:**
- Given: der Nutzer erstellt oder bearbeitet Inhalte in einer rechts-nach-links Sprache
- When: Texteingaben gespeichert und erneut geladen werden
- Then: bleiben Richtung, Ausrichtung und Reihenfolge der Inhalte konsistent rechts-nach-links erhalten

**AC-3:**
- Given: es existieren gemischte Inhalte aus rechts-nach-links und links-nach-rechts Text
- When: der Nutzer eine Seite mit gemischten Inhalten aufruft
- Then: werden beide Schreibrichtungen korrekt und ohne Darstellungsfehler wiedergegeben


---

## US-125: Regionale Formate

**Priority:** MUST
**Linked Requirement:** WA-LOC-002

### User Story

> As a **registrierter Nutzer**
> I want to **regionale Formate fuer Datum, Uhrzeit, Zahlen und Waerungen im System verwenden**
> So that **ich Informationen korrekt verstehen und Eingaben fehlerfrei vornehmen kann**

### Acceptance Criteria

**AC-1:**
- Given: die Systemsprache und Region sind auf de-DE eingestellt
- When: der Nutzer Nachrichten, Preise und Zeitstempel im UI ansieht
- Then: werden Datum, Uhrzeit, Zahlen und Waerungen im deutschen Format angezeigt

**AC-2:**
- Given: der Nutzer hat eine andere Region in den Einstellungen gewaehlt
- When: das System Daten wie Beträge und Datumsangaben darstellt oder validiert
- Then: werden Formate gemaess der gewaehlten Region angezeigt und Eingaben entsprechend validiert

**AC-3:**
- Given: der Nutzer gibt eine Zahl oder ein Datum in einem nicht zur Region passenden Format ein
- When: die Eingabe gespeichert werden soll
- Then: zeigt das System eine verständliche Fehlermeldung und weist auf das erwartete regionale Format hin


---

## US-126: Lokale Sticker

**Priority:** COULD
**Linked Requirement:** WA-LOC-003

### User Story

> As a **registrierter Nutzer**
> I want to **ein regionalspezifisches Sticker-Pack auswählen und im Chat verwenden**
> So that **um lokal relevante Inhalte auszudrücken und die Kommunikation persönlicher zu gestalten**

### Acceptance Criteria

**AC-1:**
- Given: der Nutzer befindet sich im Sticker-Bereich und seine Region ist ermittelt
- When: der Nutzer nach Stickern sucht
- Then: werden ihm passende regionalspezifische Sticker-Packs angezeigt

**AC-2:**
- Given: der Nutzer hat ein regionalspezifisches Sticker-Pack ausgewählt
- When: er einen Sticker im Chat sendet
- Then: wird der Sticker korrekt angezeigt und an den Empfänger zugestellt

**AC-3:**
- Given: für die Region des Nutzers sind keine Sticker-Packs verfügbar
- When: der Nutzer den Sticker-Bereich öffnet
- Then: wird eine verständliche Hinweismeldung angezeigt und es werden alternative allgemeine Sticker-Packs angeboten


---

## US-127: End-to-End Encryption and Key Management

**Priority:** MUST
**Linked Requirement:** REQ-016

### User Story

> As a **registered user**
> I want to **send and receive messages and media with end-to-end encryption enabled**
> So that **ensure privacy and secure communication across platforms**

### Acceptance Criteria

**AC-1:**
- Given: a registered user with an active device and a valid encryption key pair
- When: the user sends a message or media to another registered user
- Then: the content is encrypted end-to-end and can only be decrypted by the intended recipient

**AC-2:**
- Given: a user's encryption keys are due for rotation
- When: the system initiates key rotation
- Then: new keys are generated and stored securely without interrupting message delivery

**AC-3:**
- Given: a message is received from a sender with an unverified or mismatched key
- When: the recipient attempts to open the message
- Then: the system blocks decryption and displays a verification warning

### Sub-Stories (4 tasks)

#### US-127.1: E2E Key Generation and Secure Storage

Implement client-side generation of encryption keys and secure local storage using platform-specific keystores.

*Estimated: 6h*

**Acceptance:**
- Given a registered user launches the client for the first time, When the encryption module initializes, Then a unique key pair is generated and stored securely in the platform keystore without exposure to the server

#### US-127.2: Message and Media Encryption/Decryption

Encrypt outgoing messages and media on the client and decrypt incoming content using stored keys.

*Estimated: 8h*

**Acceptance:**
- Given a user composes a message or attaches media, When the content is sent to another user, Then the content is encrypted client-side and only the recipient can decrypt it with their keys

#### US-127.3: Key Rotation and Verification

Implement periodic key rotation and user verification mechanisms to validate peer keys.

*Estimated: 6h*

**Acceptance:**
- Given a key rotation interval is reached or a user requests verification, When the rotation or verification process is initiated, Then new keys are generated, old keys are retired, and peer keys can be verified without breaking existing sessions

#### US-127.4: Cross-Platform E2E Compatibility

Ensure E2E encryption works consistently across supported platforms and devices.

*Estimated: 4h*

**Acceptance:**
- Given a user sends encrypted content from one platform, When the recipient views it on another supported platform, Then the content decrypts correctly and remains unreadable in transit


---

## US-128: Message Delivery and Read Receipts

**Priority:** SHOULD
**Linked Requirement:** REQ-017

### User Story

> As a **messaging user**
> I want to **view sent, delivered, and read receipts for each recipient in a group chat**
> So that **so I can confirm reliable message delivery while preserving clear communication status**

### Acceptance Criteria

**AC-1:**
- Given: I have sent a message in a one-to-one chat
- When: the message is processed by the system and the recipient reads it
- Then: the message status updates in order from sent to delivered to read

**AC-2:**
- Given: I have sent a message in a group chat with multiple recipients
- When: some recipients have received or read the message and others have not
- Then: I can see per-recipient delivery and read status for that message

**AC-3:**
- Given: a message cannot be delivered due to a temporary failure
- When: the delivery attempt fails
- Then: the message shows a failed or pending status without showing a read receipt


---

## US-129: Push Notifications and Notification Controls

**Priority:** MUST
**Linked Requirement:** REQ-018

### User Story

> As a **end user**
> I want to **configure and receive push notifications for new messages with per-chat and per-type controls**
> So that **so that I stay informed without being overwhelmed and can protect my privacy**

### Acceptance Criteria

**AC-1:**
- Given: push notifications are enabled at the device level and the user has notification permission granted
- When: a new message arrives in a chat with notifications enabled
- Then: a push notification is delivered promptly showing the configured content preview level

**AC-2:**
- Given: the user is viewing notification settings for a specific chat
- When: the user disables notifications for that chat
- Then: no push notifications are sent for new messages in that chat while notifications for other chats remain unaffected

**AC-3:**
- Given: the user has set notification types (e.g., mentions, direct messages) to off globally
- When: a message of a disabled type is received
- Then: no push notification is sent for that message type

**AC-4:**
- Given: push notifications are blocked at the device level or permission is denied
- When: the user attempts to enable notifications in the app
- Then: the app shows an error or guidance to enable permissions and does not mark notifications as enabled until permission is granted

### Sub-Stories (3 tasks)

#### US-129.1: Implement push notification delivery for new messages

Enable backend and client integration to send and receive push notifications when a new message arrives.

*Estimated: 6h*

**Acceptance:**
- Given a user has a valid push token and notifications are enabled globally, When a new message is received for that user, Then a push notification is delivered with the message sender and preview

#### US-129.2: Add per-chat notification settings

Allow users to enable or disable push notifications on a per-chat basis and persist the preference.

*Estimated: 4h*

**Acceptance:**
- Given a user is viewing a chat's settings, When they toggle notifications off for that chat, Then no push notifications are sent for new messages in that chat

#### US-129.3: Add per-notification-type controls

Provide controls to enable or disable notification types (e.g., mentions, direct messages) and enforce them during notification dispatch.

*Estimated: 5h*

**Acceptance:**
- Given a user has disabled a specific notification type, When a new message of that type is received, Then no push notification is sent for that event


---

## US-130: Media and File Attachments

**Priority:** MUST
**Linked Requirement:** REQ-019

### User Story

> As a **end user**
> I want to **send and receive media and file attachments with previews within the chat**
> So that **to share information quickly and reliably while ensuring a smooth and secure communication experience**

### Acceptance Criteria

**AC-1:**
- Given: the user is in an active chat and selects a supported file type
- When: the user uploads a file within the size limit and sends it
- Then: the attachment is delivered successfully and a preview is shown to both sender and recipient

**AC-2:**
- Given: the user selects a file that exceeds the size limit
- When: the user attempts to send the file
- Then: the system blocks the upload and displays a clear size limit error message

**AC-3:**
- Given: the user selects an unsupported file type
- When: the user attempts to upload it
- Then: the system rejects the file and informs the user of the supported formats

### Sub-Stories (4 tasks)

#### US-130.1: Define attachment types, size limits, and validation

Specify supported media and file types, maximum size limits, and validation rules for upload and download within chat.

*Estimated: 4h*

**Acceptance:**
- Given a user selects a file to attach, When the file type or size is outside the allowed rules, Then the system blocks the upload and displays a clear validation message

#### US-130.2: Implement file upload and send in chat

Enable users to upload attachments and send them as chat messages, including server-side storage and message metadata.

*Estimated: 6h*

**Acceptance:**
- Given a user selects a valid file, When the user sends the attachment, Then the file is uploaded, stored, and a chat message with attachment metadata is created

#### US-130.3: Implement attachment previews in chat

Display previews for images, videos, and documents in the chat message list with appropriate icons for unsupported preview types.

*Estimated: 5h*

**Acceptance:**
- Given a chat message contains an attachment, When the message is rendered in the chat UI, Then a preview is shown for supported types and a file icon with filename is shown for others

#### US-130.4: Enable receive, download, and open attachments securely

Allow users to receive attachments and download or open them with secure access controls.

*Estimated: 5h*

**Acceptance:**
- Given a user receives a chat message with an attachment, When the user taps the attachment, Then the file downloads or opens securely and access is restricted to authorized users


---

## US-131: Search and Chat History Management

**Priority:** SHOULD
**Linked Requirement:** REQ-020

### User Story

> As a **end user**
> I want to **search across chats and messages with filters for media and contacts**
> So that **to quickly find relevant information while maintaining fast performance and ease of use**

### Acceptance Criteria

**AC-1:**
- Given: the user has multiple chats and messages in history
- When: the user performs a full-text search with a keyword
- Then: matching chats and messages are returned with highlights of the keyword

**AC-2:**
- Given: the user applies filters for media type and a specific contact
- When: the user runs the search
- Then: results are limited to messages that match both the keyword and the selected filters

**AC-3:**
- Given: there are no messages matching the search criteria
- When: the user executes the search
- Then: an empty state is shown with a clear message and no errors

### Sub-Stories (3 tasks)

#### US-131.1: Design search indexing and data model

Define data model and indexing approach for full-text search across chats and messages, including metadata for media types and contact associations.

*Estimated: 6h*

**Acceptance:**
- Given existing chat and message data with media and contact metadata, When the indexing strategy is applied, Then messages and chats are searchable by text, media type, and contact reference

#### US-131.2: Implement backend search API with filters

Create backend endpoint to perform full-text search across chats and messages with filters for media types and contacts, returning ranked results and supporting pagination.

*Estimated: 8h*

**Acceptance:**
- Given a search query with optional media and contact filters, When the search API is called, Then the response includes matching chats/messages filtered and sorted by relevance with pagination metadata

#### US-131.3: Build search UI and filter controls

Implement the user interface to enter search terms, apply media/contact filters, and display chat/message results with clear context and highlighting.

*Estimated: 6h*

**Acceptance:**
- Given the search screen is open, When a user enters a query and selects filters, Then the results list updates to show matching chats/messages with filter indicators and highlighted terms


---

## US-132: Backup, Restore, and Cross-Device Sync

**Priority:** MUST
**Linked Requirement:** REQ-021

### User Story

> As a **registered user**
> I want to **backup and restore my chats to the cloud and keep them synced across my devices**
> So that **so that I can recover data quickly and have a consistent messaging experience on any platform**

### Acceptance Criteria

**AC-1:**
- Given: I am logged in and have enabled cloud backup
- When: a scheduled backup runs successfully
- Then: my latest messages and settings are saved and are available for restore on any of my devices

**AC-2:**
- Given: I install the app on a new device and sign in with the same account
- When: I choose to restore from the most recent backup
- Then: my chat history, media, and settings are restored and the device state matches my other devices

**AC-3:**
- Given: a backup attempt is made while I am offline or storage is unavailable
- When: the backup fails
- Then: I receive a clear error message and the system retries or allows me to retry without data loss

### Sub-Stories (3 tasks)

#### US-132.1: Design backup and restore flow

Define user flows and UI requirements for creating backups (cloud or local) and restoring chats, including status, error handling, and user permissions.

*Estimated: 6h*

**Acceptance:**
- Given a registered user with existing chats, When the user navigates to backup/restore settings, Then the UI presents options for cloud and local backup, restore actions, and clear status/error messages

#### US-132.2: Implement cloud backup and restore process

Implement backend and client logic to create scheduled or manual cloud backups and restore from the latest or selected backup.

*Estimated: 10h*

**Acceptance:**
- Given a registered user with cloud backup enabled, When the user triggers a manual backup or restore, Then the system completes the operation and confirms success with updated chat data

#### US-132.3: Enable cross-device chat sync

Implement real-time or near-real-time sync of chats across user devices, ensuring consistency after login, backup, or restore.

*Estimated: 8h*

**Acceptance:**
- Given a user logged in on two devices, When a message is sent or restored on one device, Then the other device reflects the same chat state within the defined sync interval


---

## US-133: Account Recovery and Number Change

**Priority:** MUST
**Linked Requirement:** REQ-022

### User Story

> As a **registered user**
> I want to **recover my account and change my registered phone number after device loss**
> So that **so that I can securely regain access and continue using the service without losing message delivery**

### Acceptance Criteria

**AC-1:**
- Given: the user has lost their device but can access the recovery channel
- When: the user completes the recovery verification steps
- Then: the account is restored and access is granted to the user

**AC-2:**
- Given: the user is authenticated and requests a number change
- When: the user verifies ownership of the new number
- Then: the account is updated to the new number and future messages are routed correctly

**AC-3:**
- Given: the user enters invalid or expired recovery verification data
- When: the user submits the recovery request
- Then: the recovery is rejected and the user is prompted to retry with valid verification

### Sub-Stories (3 tasks)

#### US-133.1: Design account recovery flow for lost device

Define the user journey and required steps to recover an account after device loss, including identity verification methods, recovery entry points, and security checkpoints.

*Estimated: 6h*

**Acceptance:**
- Given a registered user who has lost their device, When the user initiates account recovery, Then the system guides the user through a documented, secure recovery flow with clearly defined verification steps

#### US-133.2: Specify phone number change procedure

Define the process for changing the registered phone number during recovery, including validation rules, verification of the new number, and constraints to prevent unauthorized changes.

*Estimated: 5h*

**Acceptance:**
- Given a user in the recovery flow, When the user submits a new phone number, Then the system validates the number and requires verification before completing the change

#### US-133.3: Define data retention and message delivery continuity rules

Establish rules for maintaining message delivery continuity and data access after recovery and number change, including any limitations or grace periods.

*Estimated: 4h*

**Acceptance:**
- Given a user completes recovery and changes their number, When the account is restored, Then message delivery resumes according to documented retention and continuity rules


---

## US-134: User Blocking, Reporting, and Moderation Tools

**Priority:** MUST
**Linked Requirement:** REQ-023

### User Story

> As a **support moderator**
> I want to **review reported users and apply moderation actions such as blocking or dismissing the report**
> So that **to prevent abuse and maintain a safe, compliant communication platform**

### Acceptance Criteria

**AC-1:**
- Given: a report exists in the moderation queue with required evidence
- When: the moderator reviews the report and selects 'Block user'
- Then: the reported user is blocked and cannot send messages, and the report status is updated to 'Resolved - Blocked'

**AC-2:**
- Given: a report exists but lacks sufficient evidence
- When: the moderator selects 'Dismiss report' and provides a reason
- Then: the report status is updated to 'Resolved - Dismissed' and the reporter is notified with the reason

**AC-3:**
- Given: a moderator attempts to block a user whose account no longer exists
- When: the moderator submits the action
- Then: the system shows an error message indicating the user is unavailable and the report remains in 'Pending' status

### Sub-Stories (3 tasks)

#### US-134.1: Implement User Reporting Flow

Provide a mechanism for users to report abuse, capturing report reason, reporter, reported user, and timestamp for moderation review.

*Estimated: 6h*

**Acceptance:**
- Given a logged-in user is viewing another user's profile or message, When the user submits a report with a valid reason, Then a report record is created with reporter, reported user, reason, and timestamp

#### US-134.2: Moderation Review Queue

Create an admin/moderator review interface to list reported users with report details and status.

*Estimated: 6h*

**Acceptance:**
- Given a moderator accesses the moderation tool, When the review queue is loaded, Then reported users are listed with report details and current status

#### US-134.3: Apply Moderation Actions

Enable moderators to block a reported user or dismiss a report and update the report status accordingly.

*Estimated: 6h*

**Acceptance:**
- Given a moderator is viewing a specific report, When the moderator selects block or dismiss, Then the user status and report status are updated to reflect the chosen action


---

## US-135: Typing Indicators and Presence

**Priority:** SHOULD
**Linked Requirement:** REQ-024

### User Story

> As a **registered customer**
> I want to **view online status and typing indicators for chat participants and control my visibility settings**
> So that **communicate more efficiently while protecting my privacy**

### Acceptance Criteria

**AC-1:**
- Given: a one-to-one chat is open and both users have enabled presence and typing indicators
- When: the other user starts typing
- Then: a typing indicator is displayed in real time until the message is sent or typing stops

**AC-2:**
- Given: a user has set their status to invisible or disabled typing indicators in privacy settings
- When: another user views the chat
- Then: the user appears offline and no typing indicator is shown for them

**AC-3:**
- Given: presence or typing indicator updates cannot be retrieved due to a network or service error
- When: the system attempts to fetch updates
- Then: the chat remains usable and no stale or incorrect indicators are shown

### Sub-Stories (3 tasks)

#### US-135.1: Display online status for chat participants

Implement UI and data binding to show each participant's online/offline status in chat views.

*Estimated: 6h*

**Acceptance:**
- Given a registered customer is viewing a chat with participants, When participant presence data is available, Then the UI shows each participant's current online/offline status accurately

#### US-135.2: Show typing indicators in active conversations

Implement real-time typing indicators for participants in a chat conversation.

*Estimated: 6h*

**Acceptance:**
- Given a chat conversation is open, When a participant starts or stops typing, Then the typing indicator appears and disappears in real time for other participants

#### US-135.3: Provide privacy controls for presence visibility

Add settings allowing users to control who can see their online status and typing indicators.

*Estimated: 6h*

**Acceptance:**
- Given a registered customer opens privacy settings, When the customer updates presence visibility preferences, Then their online status and typing indicators are shown only according to the selected settings


---

## US-136: Payments and P2P Transfers

**Priority:** COULD
**Linked Requirement:** REQ-025

### User Story

> As a **registered user**
> I want to **send and receive secure in-app P2P payments and view transaction history**
> So that **to transfer money quickly with confidence and keep an auditable record of all transactions**

### Acceptance Criteria

**AC-1:**
- Given: the user has a verified account and a valid payment method on file
- When: the user sends a payment to another registered user with sufficient balance
- Then: the payment is completed, both users receive a confirmation message, and the transaction appears in their history

**AC-2:**
- Given: the user initiates a payment that triggers compliance checks
- When: the compliance flow requires additional verification
- Then: the app prompts for the required information and blocks the payment until verification is completed

**AC-3:**
- Given: the user attempts to send a payment exceeding their available balance
- When: the user confirms the payment
- Then: the payment is rejected with a clear error message and no transaction is recorded

**AC-4:**
- Given: the user opens the transaction history screen
- When: the history is loaded
- Then: all transactions are displayed with status, amount, counterparty, and timestamp, and failed transactions are clearly marked

### Sub-Stories (4 tasks)

#### US-136.1: P2P Payment Initiation and Confirmation

Implement in-app flow to send a P2P payment including recipient selection, amount entry, fee/total display, and confirmation step with secure authorization.

*Estimated: 8h*

**Acceptance:**
- Given a registered user with a verified account and sufficient balance, When the user enters a recipient, amount, and confirms the payment, Then the payment is securely authorized and a success receipt with transaction ID is shown

#### US-136.2: P2P Payment Receipt and Notifications

Enable recipients to receive P2P payments in-app and notify both sender and recipient of transaction status.

*Estimated: 6h*

**Acceptance:**
- Given a successful P2P payment has been initiated, When the payment is processed, Then the recipient balance is updated and both users receive status notifications

#### US-136.3: Transaction History and Detail View

Provide a transaction history list with filters (date range, type, status) and a detailed view for each transaction.

*Estimated: 6h*

**Acceptance:**
- Given a user with past P2P transactions, When the user opens transaction history and selects a transaction, Then the list shows filtered results and the detail view displays amount, parties, date, status, and reference ID

#### US-136.4: Compliance and Security Checks

Implement compliance checks such as KYC verification, transaction limits, and suspicious activity handling before payment execution.

*Estimated: 8h*

**Acceptance:**
- Given a user attempts a P2P transfer, When the system evaluates compliance rules, Then the payment is approved or blocked with a clear reason and appropriate audit logging


---

## US-137: Voice and Video Calling

**Priority:** SHOULD
**Linked Requirement:** REQ-026

### User Story

> As a **primary user**
> I want to **start a one-to-one or group voice/video call and control mute, camera, and speaker during the call**
> So that **to communicate reliably and intuitively across platforms with good call quality and privacy**

### Acceptance Criteria

**AC-1:**
- Given: the user is connected to the internet and has granted microphone/camera permissions
- When: the user initiates a one-to-one or group call with available participants
- Then: the call connects and the user can see and use call controls for mute, camera on/off, and speaker

**AC-2:**
- Given: the call is active and network bandwidth degrades
- When: the system detects reduced quality
- Then: the call adapts audio/video quality to maintain continuity and shows a quality indicator to the user

**AC-3:**
- Given: a participant is unavailable or permissions are denied
- When: the user attempts to start the call
- Then: the system displays a clear error message and the call does not start

### Sub-Stories (4 tasks)

#### US-137.1: Initiate one-to-one voice/video call

Enable a primary user to start a one-to-one voice or video call from a contact or chat, establishing a connection across supported platforms.

*Estimated: 4h*

**Acceptance:**
- Given a primary user is logged in and a contact is available, When the user selects voice or video call for that contact, Then the call is initiated and connects with audio/video as selected

#### US-137.2: Initiate group voice/video call

Enable a primary user to start a group voice or video call with multiple participants from a group chat or contact list.

*Estimated: 4h*

**Acceptance:**
- Given a primary user is logged in and a group with multiple participants exists, When the user starts a group voice or video call, Then all invited participants receive the call and the group call connects for joined users

#### US-137.3: In-call controls for mute, camera, and speaker

Provide in-call controls to toggle microphone mute, camera on/off, and speaker output during voice or video calls.

*Estimated: 4h*

**Acceptance:**
- Given a user is in an active call, When the user toggles mute, camera, or speaker controls, Then the respective audio/video/speaker state changes immediately and is reflected in the UI

#### US-137.4: Adaptive call quality handling

Implement adaptive call quality to maintain stable communication by adjusting audio/video quality based on network conditions.

*Estimated: 4h*

**Acceptance:**
- Given a user is in an active call with fluctuating network conditions, When bandwidth drops or improves, Then the call quality adapts to maintain continuity without unexpected call termination


---

## US-138: Enterprise/Admin Analytics and Audit Logs

**Priority:** SHOULD
**Linked Requirement:** REQ-027

### User Story

> As a **system administrator**
> I want to **view system-level analytics and audit logs for message throughput and compliance events**
> So that **ensure reliable performance, detect issues early, and meet compliance requirements**

### Acceptance Criteria

**AC-1:**
- Given: the administrator has valid admin permissions
- When: they open the analytics dashboard and select a time range
- Then: the system displays throughput metrics, delivery rates, and system health indicators for that period

**AC-2:**
- Given: audit logging is enabled and events exist
- When: the administrator filters audit logs by user, event type, and date range
- Then: the system returns matching log entries with timestamps, actor, action, and outcome

**AC-3:**
- Given: no data exists for the selected time range
- When: the administrator requests analytics or audit logs
- Then: the system shows an empty state message and does not display incorrect or stale data

**AC-4:**
- Given: the administrator attempts to access analytics without sufficient permissions
- When: they request the dashboard or logs
- Then: the system denies access and displays an authorization error

### Sub-Stories (4 tasks)

#### US-138.1: Implement system-level analytics dashboard

Create an admin-only dashboard that displays system-level analytics such as total messages processed, active tenants, and system health indicators.

*Estimated: 6h*

**Acceptance:**
- Given an authenticated system administrator, When they access the analytics dashboard, Then they can view up-to-date system-level metrics in a readable format

#### US-138.2: Add message throughput metrics

Capture and display message throughput metrics (e.g., messages per minute/hour, success/failure rates) with configurable time ranges.

*Estimated: 6h*

**Acceptance:**
- Given message processing is occurring, When the administrator selects a time range, Then the dashboard shows accurate throughput metrics for that period

#### US-138.3: Implement compliance audit logging

Log compliance-related events (e.g., access to sensitive data, configuration changes) with timestamps, actor, and event details.

*Estimated: 8h*

**Acceptance:**
- Given a compliance-relevant action occurs, When the action is completed, Then an audit log entry is created with required details

#### US-138.4: Enable audit log search and export

Provide administrators with filtering, searching, and export options for audit logs to support compliance reviews.

*Estimated: 6h*

**Acceptance:**
- Given audit logs exist, When the administrator applies filters or requests an export, Then the system returns matching logs and provides a downloadable file


---

## US-139: Third-Party Integrations and Bots

**Priority:** COULD
**Linked Requirement:** REQ-028

### User Story

> As a **technical integration engineer**
> I want to **register and configure webhook endpoints for third-party bot integrations via the API**
> So that **enable automated and reliable message processing while maintaining secure external connectivity**

### Acceptance Criteria

**AC-1:**
- Given: a valid API key with integration permissions
- When: the engineer submits a webhook registration with a valid URL and event types
- Then: the webhook is created and receives test event deliveries successfully

**AC-2:**
- Given: a webhook registration request with an invalid URL format
- When: the engineer attempts to create the webhook
- Then: the API rejects the request with a validation error and no webhook is created

**AC-3:**
- Given: the integration exceeds the allowed rate limit
- When: the engineer sends additional webhook registration requests
- Then: the API responds with a rate limit error and includes the retry-after information

### Sub-Stories (3 tasks)

#### US-139.1: Design webhook registration API contract

Define request/response schemas, authentication requirements, and validation rules for registering and updating webhook endpoints for bot integrations.

*Estimated: 6h*

**Acceptance:**
- Given API contract documentation is required, When a technical integration engineer reviews the endpoint definitions, Then request/response schemas, auth method, and validation rules are clearly specified and ready for implementation

#### US-139.2: Implement webhook registration and configuration endpoints

Build API endpoints to create, update, and retrieve webhook configurations, including secure storage of secrets and endpoint metadata.

*Estimated: 10h*

**Acceptance:**
- Given a valid authenticated request with webhook details, When the create or update endpoint is called, Then the webhook configuration is stored securely and returned in the response without exposing secrets

#### US-139.3: Add webhook verification and connectivity checks

Implement optional verification handshake and connectivity validation to ensure external endpoints are reachable and respond correctly.

*Estimated: 8h*

**Acceptance:**
- Given a webhook endpoint is registered with verification enabled, When the system performs verification or connectivity check, Then the endpoint status is updated to verified or failed with an actionable error message


---

## US-140: Verify: Message send latency

**Priority:** MUST
**Linked Requirement:** NFR-029

### User Story

> As a **QA Performance Engineer**
> I want to **validate message send and delivery acknowledgement latency under normal load**
> So that **ensures user messaging experience meets strict latency targets and SLA commitments**

### Acceptance Criteria

**AC-1:**
- Given: the system is under run load test at normal load and measure end-to-end send latency from client request to server acceptance conditions
- When: measuring P95 message send latency
- Then: the result meets target: ≤ 200 ms

**AC-2:**
- Given: the system is under run load test at normal load and measure end-to-end time from send to delivery acknowledgement receipt conditions
- When: measuring P95 delivery acknowledgement latency
- Then: the result meets target: ≤ 500 ms

**AC-3:**
- Given: the system is under collect latency distribution during load test and compute P99 for send latency conditions
- When: measuring P99 message send latency
- Then: the result meets target: ≤ 400 ms

**AC-4:**
- Given: the system is under collect latency distribution during load test and compute P99 for delivery acknowledgements conditions
- When: measuring P99 delivery acknowledgement latency
- Then: the result meets target: ≤ 800 ms


---

## US-141: Verify: Media upload throughput

**Priority:** SHOULD
**Linked Requirement:** NFR-030

### User Story

> As a **Performance QA Engineer**
> I want to **Validate media upload throughput and completion times under expected and peak load**
> So that **Ensures users experience reliable and predictable upload performance**

### Acceptance Criteria

**AC-1:**
- Given: the system is under Run load tests with representative file sizes and measure per-client throughput using network instrumentation conditions
- When: measuring Average upload throughput per client for voice and media files
- Then: the result meets target: ≥ 2.5 Mbps under expected load and ≥ 1.5 Mbps under peak load

**AC-2:**
- Given: the system is under Execute timed uploads in a controlled test environment and compute percentile metrics conditions
- When: measuring 95th percentile upload completion time for 10 MB file
- Then: the result meets target: ≤ 20 seconds under expected load

**AC-3:**
- Given: the system is under Conduct stress tests with concurrent uploads and analyze completion time distributions conditions
- When: measuring 99th percentile upload completion time for 10 MB file
- Then: the result meets target: ≤ 35 seconds under peak load

**AC-4:**
- Given: the system is under Run sustained concurrency tests and track failures vs. total attempts conditions
- When: measuring Upload success rate
- Then: the result meets target: ≥ 99.5% successful uploads during a 1-hour sustained test


---

## US-142: Verify: Concurrent user scaling

**Priority:** MUST
**Linked Requirement:** NFR-031

### User Story

> As a **QA Engineer**
> I want to **verify horizontal scaling maintains low latency under high concurrent user loads**
> So that **ensures the system can handle peak demand without degrading user experience or violating performance expectations**

### Acceptance Criteria

**AC-1:**
- Given: the system is under run load tests with ramp-up to 10,000 concurrent users and measure p95 latency conditions
- When: measuring p95 response time at 10,000 concurrent users
- Then: the result meets target: ≤ 500 ms

**AC-2:**
- Given: the system is under execute sustained load test and record requests per second from test harness conditions
- When: measuring throughput at 10,000 concurrent users
- Then: the result meets target: ≥ 5,000 requests/second

**AC-3:**
- Given: the system is under collect HTTP 5xx and timeout rates during load test conditions
- When: measuring error rate during peak concurrency
- Then: the result meets target: ≤ 0.5%

**AC-4:**
- Given: the system is under compare p95 latency before and after horizontal scaling under identical load conditions
- When: measuring latency impact when scaling from N to 2N instances
- Then: the result meets target: ≤ 10% increase in p95 response time


---

## US-143: Verify: Data growth scalability

**Priority:** SHOULD
**Linked Requirement:** NFR-032

### User Story

> As a **QA Engineer**
> I want to **Validate storage and indexing scalability under increasing message and media volumes without performance degradation**
> So that **Ensures the system can handle data growth while maintaining consistent performance and reliability**

### Acceptance Criteria

**AC-1:**
- Given: the system is under Execute load tests with synthetic data growth and compare indexing latency distributions conditions
- When: measuring Indexing latency at 10x baseline data volume
- Then: the result meets target: P95 indexing latency does not increase by more than 20% compared to baseline

**AC-2:**
- Given: the system is under Run benchmark queries on scaled datasets and measure response times conditions
- When: measuring Query response time at 10x baseline data volume
- Then: the result meets target: P95 query response time remains ≤ 1.2x baseline

**AC-3:**
- Given: the system is under Track storage consumption across incremental data loads and compare to expected linear model conditions
- When: measuring Storage growth efficiency
- Then: the result meets target: Storage utilization increases linearly within ±10% of expected growth rate

**AC-4:**
- Given: the system is under Measure ingestion rate during continuous data loading at scaled volumes conditions
- When: measuring Throughput under growth conditions
- Then: the result meets target: Sustained ingestion throughput remains ≥ 90% of baseline


---

## US-144: Verify: Service uptime SLA

**Priority:** MUST
**Linked Requirement:** NFR-033

### User Story

> As a **DevOps Engineer**
> I want to **verify service uptime meets SLA targets for messaging, authentication, and group services**
> So that **ensure high availability and compliance with business continuity expectations**

### Acceptance Criteria

**AC-1:**
- Given: the system is under analyze monitoring data and incident logs for the calendar month conditions
- When: measuring monthly uptime for messaging service
- Then: the result meets target: >= 99.9%

**AC-2:**
- Given: the system is under analyze monitoring data and incident logs for the calendar month conditions
- When: measuring monthly uptime for authentication service
- Then: the result meets target: >= 99.9%

**AC-3:**
- Given: the system is under analyze monitoring data and incident logs for the calendar month conditions
- When: measuring monthly uptime for group service
- Then: the result meets target: >= 99.9%

**AC-4:**
- Given: the system is under review incident response records and calculate MTTR for the period conditions
- When: measuring mean time to recover (MTTR) for critical incidents
- Then: the result meets target: <= 60 minutes


---

## US-145: Verify: Failover time

**Priority:** SHOULD
**Linked Requirement:** NFR-034

### User Story

> As a **DevOps Engineer**
> I want to **Verify automatic failover time and user impact during node and zone failures**
> So that **Ensures service continuity and minimal disruption to users during infrastructure failures**

### Acceptance Criteria

**AC-1:**
- Given: the system is under Induce controlled node failure in staging and measure time to restore service availability via synthetic monitoring conditions
- When: measuring Failover time (node failure)
- Then: the result meets target: ≤ 60 seconds

**AC-2:**
- Given: the system is under Simulate zone outage and measure time to route traffic to healthy zone using monitoring timestamps conditions
- When: measuring Failover time (zone failure)
- Then: the result meets target: ≤ 120 seconds

**AC-3:**
- Given: the system is under Capture HTTP error rates from APM and load testing during failover drills conditions
- When: measuring User-visible error rate during failover
- Then: the result meets target: ≤ 1% of requests over a 5-minute window

**AC-4:**
- Given: the system is under Track session retention across failover using session logs and synthetic user journeys conditions
- When: measuring Session continuity rate
- Then: the result meets target: ≥ 99% of active sessions preserved


---

## US-146: Verify: Transport and at-rest encryption

**Priority:** MUST
**Linked Requirement:** NFR-035

### User Story

> As a **Security Team**
> I want to **Verify that all data in transit and at rest is encrypted using modern standards across production systems**
> So that **Ensures confidentiality and compliance by preventing data exposure during transmission or storage**

### Acceptance Criteria

**AC-1:**
- Given: the system is under Scan endpoints and service meshes using automated TLS scanners and review configuration baselines conditions
- When: measuring Transport encryption protocol and ciphers
- Then: the result meets target: TLS 1.2+ with strong ciphers (e.g., AES-256-GCM or ChaCha20-Poly1305) for all external and internal endpoints

**AC-2:**
- Given: the system is under Inspect cloud provider settings, database configurations, and storage policies via audits and configuration reports conditions
- When: measuring At-rest encryption coverage
- Then: the result meets target: 100% of databases, object storage, and block storage volumes encrypted with AES-256 or equivalent

**AC-3:**
- Given: the system is under Review KMS/HSM policies, key rotation schedules, and access logs conditions
- When: measuring Key management and rotation
- Then: the result meets target: Centralized key management (KMS/HSM) with rotation at least every 12 months and access controls enforced


---

## US-147: Verify: Authentication hardening

**Priority:** MUST
**Linked Requirement:** NFR-036

### User Story

> As a **Security Team**
> I want to **verify authentication controls and audit logging meet hardening standards**
> So that **ensures strong protection against unauthorized access and provides traceable audit evidence**

### Acceptance Criteria

**AC-1:**
- Given: the system is under review authentication policy configuration and test login flows conditions
- When: measuring MFA enforcement rate for privileged and standard user logins
- Then: the result meets target: 100% for privileged accounts; 95%+ for standard accounts

**AC-2:**
- Given: the system is under execute controlled failed login attempts and verify lockout behavior conditions
- When: measuring Account lockout on repeated failed logins
- Then: the result meets target: lockout after 5 consecutive failures within 10 minutes

**AC-3:**
- Given: the system is under inspect log samples and compare against executed test events conditions
- When: measuring Authentication event audit log completeness
- Then: the result meets target: 100% of login, logout, failure, and password change events logged with user, timestamp, source IP, and outcome

**AC-4:**
- Given: the system is under review log storage configuration and retention policy conditions
- When: measuring Audit log retention period
- Then: the result meets target: minimum 365 days retention with tamper-evident storage


---

## US-148: Verify: Data minimization and retention

**Priority:** MUST
**Linked Requirement:** NFR-037

### User Story

> As a **QA Engineer**
> I want to **Verify that personal data is retained only for defined periods and is deletable upon request**
> So that **Ensures compliance with data minimization principles and user privacy obligations**

### Acceptance Criteria

**AC-1:**
- Given: the system is under Review retention policy mappings and run database queries to compare record timestamps against retention schedules conditions
- When: measuring Retention duration compliance
- Then: the result meets target: 100% of personal data records stored no longer than the approved retention period

**AC-2:**
- Given: the system is under Audit deletion request logs and timestamps from intake to completion conditions
- When: measuring Deletion request fulfillment time
- Then: the result meets target: 95% of deletion requests completed within 30 days; 100% within 45 days

**AC-3:**
- Given: the system is under Perform data discovery scans and backup restoration tests to confirm absence of deleted records conditions
- When: measuring Deletion completeness
- Then: the result meets target: 100% of requested personal data removed from primary and backup systems per policy


---

## US-149: Verify: Compliance reporting

**Priority:** SHOULD
**Linked Requirement:** NFR-038

### User Story

> As a **Security Team**
> I want to **verify that privacy controls and compliance reporting meet GDPR and CCPA requirements**
> So that **to ensure regulatory compliance and reduce legal and reputational risk**

### Acceptance Criteria

**AC-1:**
- Given: the system is under review generated compliance reports against GDPR Article and guideline checklist conditions
- When: measuring GDPR compliance coverage in reporting (data processing, consent, data subject rights, breach notification)
- Then: the result meets target: 100% of required GDPR reporting elements present

**AC-2:**
- Given: the system is under audit compliance reports against CCPA requirement checklist conditions
- When: measuring CCPA compliance coverage in reporting (notice, opt-out, access, deletion, non-discrimination)
- Then: the result meets target: 100% of required CCPA reporting elements present

**AC-3:**
- Given: the system is under sample 30% of report items and verify evidence artifacts and system logs conditions
- When: measuring Evidence traceability for privacy controls
- Then: the result meets target: 100% of reported controls linked to auditable evidence

**AC-4:**
- Given: the system is under trigger report generation in test and measure availability time conditions
- When: measuring Report generation frequency
- Then: the result meets target: Reports available on demand and within 24 hours of request


---

## US-150: Verify: Message delivery reliability

**Priority:** MUST
**Linked Requirement:** NFR-039

### User Story

> As a **QA Engineer**
> I want to **verify reliable message delivery under intermittent network conditions**
> So that **ensures users receive messages consistently despite network instability**

### Acceptance Criteria

**AC-1:**
- Given: the system is under simulate network drops and recoveries in a controlled test environment while tracking delivery outcomes conditions
- When: measuring message delivery success rate during intermittent connectivity
- Then: the result meets target: >= 99.5% of messages delivered within 5 minutes after network restoration

**AC-2:**
- Given: the system is under send a fixed set of messages during intermittent network scenarios and reconcile sender/receiver logs conditions
- When: measuring message loss rate
- Then: the result meets target: <= 0.1% lost messages across 10,000 test messages

**AC-3:**
- Given: the system is under analyze receiver logs for duplicate message IDs after network disruptions conditions
- When: measuring duplicate message rate
- Then: the result meets target: <= 0.05% duplicates


---

## US-151: Verify: Error budget

**Priority:** SHOULD
**Linked Requirement:** NFR-040

### User Story

> As a **DevOps Engineer**
> I want to **verify that reliability targets are defined and enforced through explicit error budgets with monitoring and alerting in place**
> So that **ensures reliability expectations are measurable and enforced, preventing unbounded risk to service availability**

### Acceptance Criteria

**AC-1:**
- Given: the system is under review service catalog and SLO documentation for error budget definitions conditions
- When: measuring documented error budget policy coverage
- Then: the result meets target: 100% of critical services have an explicit error budget aligned to SLOs

**AC-2:**
- Given: the system is under recalculate error budgets from monitoring data and compare to reported values conditions
- When: measuring error budget calculation accuracy
- Then: the result meets target: error budgets are computed correctly from SLOs and actual uptime within ±1% variance

**AC-3:**
- Given: the system is under simulate burn rate breach in monitoring and verify alerting/automation response conditions
- When: measuring enforcement mechanism
- Then: the result meets target: alerts trigger when error budget burn rate exceeds defined thresholds (e.g., 2x for 1 hour)


---

## US-152: Verify: Code quality and coverage

**Priority:** MUST
**Linked Requirement:** NFR-041

### User Story

> As a **QA Engineer**
> I want to **Verify that code quality gates and automated test coverage thresholds are enforced in CI/CD**
> So that **Ensures maintainable code and reduces defects through consistent automated testing standards**

### Acceptance Criteria

**AC-1:**
- Given: the system is under Generate coverage report during CI using the project’s test runner and coverage tool conditions
- When: measuring Unit test coverage
- Then: the result meets target: >= 80% line coverage on core modules

**AC-2:**
- Given: the system is under Review static analysis results in the CI pipeline against configured quality gate conditions
- When: measuring Code quality gate status
- Then: the result meets target: Pass with no blocker or critical issues

**AC-3:**
- Given: the system is under Run full automated test suite in CI and confirm green build status conditions
- When: measuring Automated test execution
- Then: the result meets target: 100% of tests pass on main branch


---

## US-153: Verify: Deployment frequency

**Priority:** SHOULD
**Linked Requirement:** NFR-042

### User Story

> As a **DevOps Engineer**
> I want to **Verify that the deployment pipeline supports frequent, low-risk releases through automation, rollback capability, and short lead times**
> So that **Ensures the system can deliver changes rapidly with minimal disruption, reducing risk and improving responsiveness to stakeholder needs**

### Acceptance Criteria

**AC-1:**
- Given: the system is under Review CI/CD deployment logs over a 4-week period conditions
- When: measuring Deployment frequency
- Then: the result meets target: At least 3 production deployments per week

**AC-2:**
- Given: the system is under Analyze incident and rollback records for the same 4-week period conditions
- When: measuring Change failure rate
- Then: the result meets target: Less than or equal to 5% of deployments require rollback or hotfix

**AC-3:**
- Given: the system is under Measure timestamps from version control merge to production deployment conditions
- When: measuring Lead time for changes
- Then: the result meets target: Median lead time from merge to production under 24 hours

**AC-4:**
- Given: the system is under Audit deployment execution sources in pipeline and audit logs conditions
- When: measuring Automated deployment coverage
- Then: the result meets target: 100% of production deployments executed via CI/CD pipeline


---

## US-154: Verify: Centralized logging

**Priority:** MUST
**Linked Requirement:** NFR-043

### User Story

> As a **DevOps Engineer**
> I want to **verify that all services emit structured logs to the centralized logging pipeline**
> So that **ensures consistent troubleshooting and efficient root cause analysis across services**

### Acceptance Criteria

**AC-1:**
- Given: the system is under audit log samples from each service and validate required fields (timestamp, level, service, correlation_id, message) in JSON format conditions
- When: measuring percentage of services emitting structured logs with required fields
- Then: the result meets target: 100%

**AC-2:**
- Given: the system is under compare emitted log count per service with ingested log count over a 24-hour window conditions
- When: measuring log ingestion success rate into centralized logging system
- Then: the result meets target: >= 99.9%

**AC-3:**
- Given: the system is under execute search queries in the logging platform using a known correlation_id and measure retrieval time conditions
- When: measuring time to locate a log entry by correlation_id
- Then: the result meets target: <= 30 seconds


---

## US-155: Verify: Metrics and alerting

**Priority:** SHOULD
**Linked Requirement:** NFR-044

### User Story

> As a **DevOps Engineer**
> I want to **verify that key service metrics and alerting enable rapid incident detection**
> So that **ensures operational issues are detected quickly to minimize impact and downtime**

### Acceptance Criteria

**AC-1:**
- Given: the system is under trigger a controlled fault and measure alert creation time in the monitoring system conditions
- When: measuring time to alert for critical incidents
- Then: the result meets target: alert generated within 2 minutes of threshold breach

**AC-2:**
- Given: the system is under audit monitoring dashboard and metric ingestion for each critical service conditions
- When: measuring coverage of key metrics
- Then: the result meets target: 100% of defined critical services emit CPU, memory, latency, error rate, and availability metrics

**AC-3:**
- Given: the system is under review alert history and incident tickets for correlation conditions
- When: measuring alert accuracy
- Then: the result meets target: false positive rate below 5% over 30 days


---

## US-156: Verify: WCAG compliance

**Priority:** MUST
**Linked Requirement:** NFR-045

### User Story

> As a **QA Engineer**
> I want to **validate that all user interfaces meet WCAG 2.1 AA accessibility standards**
> So that **ensures users with disabilities can effectively use the system and reduces compliance risk**

### Acceptance Criteria

**AC-1:**
- Given: the system is under run automated accessibility scans and manual audits against WCAG 2.1 AA checklist conditions
- When: measuring WCAG 2.1 AA conformance
- Then: the result meets target: 100% of tested pages pass WCAG 2.1 AA success criteria

**AC-2:**
- Given: the system is under manual keyboard-only navigation tests across core user flows conditions
- When: measuring Keyboard accessibility
- Then: the result meets target: 100% of interactive elements are reachable and operable via keyboard

**AC-3:**
- Given: the system is under manual testing using NVDA or VoiceOver on supported platforms conditions
- When: measuring Screen reader compatibility
- Then: the result meets target: Critical user flows are fully usable with a screen reader

**AC-4:**
- Given: the system is under automated contrast checks and spot manual verification conditions
- When: measuring Color contrast compliance
- Then: the result meets target: Text and UI components meet minimum contrast ratios (4.5:1 for normal text, 3:1 for large text)


---

## US-157: Verify: Assistive technology support

**Priority:** SHOULD
**Linked Requirement:** NFR-046

### User Story

> As a **QA Engineer**
> I want to **Verify that core user flows are fully operable with screen readers and keyboard-only navigation**
> So that **Ensures accessibility compliance and usability for users relying on assistive technologies**

### Acceptance Criteria

**AC-1:**
- Given: the system is under Test with NVDA and VoiceOver using accessibility tree inspection and scripted walkthroughs conditions
- When: measuring Screen reader coverage of core flows
- Then: the result meets target: 100% of core flow screens provide meaningful labels, roles, and focus order

**AC-2:**
- Given: the system is under Execute end-to-end keyboard navigation using Tab/Shift+Tab/Enter/Space and document completion conditions
- When: measuring Keyboard-only task completion rate for core flows
- Then: the result meets target: 100% of core flows can be completed without a mouse

**AC-3:**
- Given: the system is under Manual inspection while tabbing through pages and comparing to visual layout conditions
- When: measuring Focus visibility and order
- Then: the result meets target: Visible focus indicator present and logical focus order on all interactive elements in core flows


---

## US-158: Verify: API standards

**Priority:** MUST
**Linked Requirement:** NFR-047

### User Story

> As a **QA Engineer**
> I want to **verify that all external and internal APIs conform to documented integration standards**
> So that **ensures consistent integration behavior, reduces integration defects, and simplifies onboarding for consumers**

### Acceptance Criteria

**AC-1:**
- Given: the system is under automated linting and schema validation against the API standards checklist conditions
- When: measuring API specification compliance rate
- Then: the result meets target: 100% of published APIs conform to the approved standard schema and style guide

**AC-2:**
- Given: the system is under run contract tests in CI for each API version conditions
- When: measuring Contract test pass rate
- Then: the result meets target: 100% of APIs pass contract tests for request/response formats and error handling

**AC-3:**
- Given: the system is under documentation audit using a checklist and automated OpenAPI spec parsing conditions
- When: measuring Standardized documentation completeness
- Then: the result meets target: 100% of APIs include required documentation sections (auth, endpoints, error codes, versioning)


---

## US-159: Verify: Device interoperability

**Priority:** SHOULD
**Linked Requirement:** NFR-048

### User Story

> As a **QA Engineer**
> I want to **verify multi-device functionality across major OS versions**
> So that **ensure consistent user experience and prevent device-specific failures in supported environments**

### Acceptance Criteria

**AC-1:**
- Given: the system is under execute automated and manual test suites on a device lab covering iOS, Android, Windows, and macOS major versions conditions
- When: measuring functional test pass rate on supported OS versions
- Then: the result meets target: >= 95% pass rate for all critical and high-priority test cases on each major OS version

**AC-2:**
- Given: the system is under run test plan against a published compatibility matrix and record executed devices/OS versions conditions
- When: measuring device coverage
- Then: the result meets target: 100% coverage of defined major OS versions and top 5 devices per OS by usage

**AC-3:**
- Given: the system is under track defects tagged as device/OS-specific in the issue tracker during verification cycle conditions
- When: measuring cross-device defect rate
- Then: the result meets target: <= 2 critical device-specific defects per release


---

## US-160: Verify: User storage limits

**Priority:** MUST
**Linked Requirement:** NFR-049

### User Story

> As a **QA Engineer**
> I want to **Verify per-user storage limits are enforced and exceedance is prevented across all storage operations**
> So that **Ensures fair resource allocation, protects system stability, and meets contractual storage policies**

### Acceptance Criteria

**AC-1:**
- Given: the system is under Provision a test user with a defined quota, upload data until the limit is reached, and confirm total stored bytes do not exceed the limit conditions
- When: measuring Maximum stored data per user
- Then: the result meets target: ≤ configured per-user storage limit

**AC-2:**
- Given: the system is under Attempt to upload additional data after hitting the limit and verify the system rejects the operation with the expected error code/message conditions
- When: measuring Write operation behavior at limit
- Then: the result meets target: Uploads/creates fail with clear quota exceeded response when limit is reached

**AC-3:**
- Given: the system is under Execute storage operations via each supported API/client and confirm identical enforcement of the configured user limit conditions
- When: measuring Quota enforcement consistency
- Then: the result meets target: 100% enforcement across all storage APIs and clients


---

## US-161: Verify: Message and media size limits

**Priority:** MUST
**Linked Requirement:** NFR-050

### User Story

> As a **QA Engineer**
> I want to **Verify that the system enforces message and media size limits under normal and boundary conditions**
> So that **Ensures performance and stability by preventing oversized payloads from degrading the system**

### Acceptance Criteria

**AC-1:**
- Given: the system is under Send messages at limit, just below, and just above; verify HTTP/app response codes and server logs conditions
- When: measuring Maximum message payload size accepted
- Then: the result meets target: Configured limit is enforced; payloads <= limit are accepted and > limit are rejected

**AC-2:**
- Given: the system is under Upload media files at limit, just below, and just above; verify responses and storage behavior conditions
- When: measuring Maximum media upload size accepted
- Then: the result meets target: Configured limit is enforced; uploads <= limit succeed and > limit fail gracefully

**AC-3:**
- Given: the system is under Run performance tests with payloads at the size limit and measure response time conditions
- When: measuring System response time under boundary payloads
- Then: the result meets target: Response time does not exceed agreed SLA when payloads are at the maximum allowed size

**AC-4:**
- Given: the system is under Attempt oversized payloads and validate error codes/messages and system health metrics conditions
- When: measuring Error handling for oversized payloads
- Then: the result meets target: Consistent rejection with documented error code/message without service degradation


---

## US-162: Verify: Backup strategy

**Priority:** MUST
**Linked Requirement:** NFR-051

### User Story

> As a **DevOps Engineer**
> I want to **Verify that backups are executed frequently and are reliable across regions through scheduled checks and restore tests**
> So that **Ensures data resilience and availability in case of regional failures or data loss**

### Acceptance Criteria

**AC-1:**
- Given: the system is under Review backup schedules and system logs for the last 30 days conditions
- When: measuring Backup frequency
- Then: the result meets target: At least every 15 minutes for critical data stores

**AC-2:**
- Given: the system is under Analyze replication job reports and failure logs across regions conditions
- When: measuring Cross-region backup replication success rate
- Then: the result meets target: >= 99.9% successful replications per month

**AC-3:**
- Given: the system is under Execute scheduled restore tests and record outcomes conditions
- When: measuring Restore test success rate
- Then: the result meets target: 100% successful restores in monthly cross-region recovery tests

**AC-4:**
- Given: the system is under Measure data loss window during restore tests conditions
- When: measuring Recovery Point Objective (RPO)
- Then: the result meets target: <= 15 minutes


---

## US-163: Verify: RPO/RTO targets

**Priority:** MUST
**Linked Requirement:** NFR-052

### User Story

> As a **DevOps Engineer**
> I want to **Verify that defined RPO and RTO targets for catastrophic failure are documented, approved, and validated through disaster recovery testing.**
> So that **Ensures the organization can meet business continuity objectives and minimize data loss and downtime after catastrophic events.**

### Acceptance Criteria

**AC-1:**
- Given: the system is under Review disaster recovery policy and approval records conditions
- When: measuring RPO target definition
- Then: the result meets target: RPO documented and approved by primary and secondary stakeholders

**AC-2:**
- Given: the system is under Review disaster recovery policy and approval records conditions
- When: measuring RTO target definition
- Then: the result meets target: RTO documented and approved by primary and secondary stakeholders

**AC-3:**
- Given: the system is under Measure data loss during a full disaster recovery simulation conditions
- When: measuring RPO achievement in DR test
- Then: the result meets target: Achieved RPO <= documented RPO

**AC-4:**
- Given: the system is under Measure time to restore service during a full disaster recovery simulation conditions
- When: measuring RTO achievement in DR test
- Then: the result meets target: Achieved RTO <= documented RTO


---

