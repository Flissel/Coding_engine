# User Flows

## FLOW-001: Flow 1

**Actor:** Erik Scholz
**Trigger:** 



### Steps

| # | Action | Screen | Expected Result |
|---|--------|--------|-----------------|

### Success Criteria



### Error Scenarios


**Diagram:** See `user_flows/flow-001.mmd`

---

## FLOW-002: Flow 2

**Actor:** Sofia Neumann
**Trigger:** 



### Steps

| # | Action | Screen | Expected Result |
|---|--------|--------|-----------------|

### Success Criteria



### Error Scenarios


**Diagram:** See `user_flows/flow-002.mmd`

---

## FLOW-003: Flow 3

**Actor:** Helmut Kramer
**Trigger:** 



### Steps

| # | Action | Screen | Expected Result |
|---|--------|--------|-----------------|

### Success Criteria



### Error Scenarios


**Diagram:** See `user_flows/flow-003.mmd`

---

## FLOW-004: Flow 4

**Actor:** Mira Patel
**Trigger:** 



### Steps

| # | Action | Screen | Expected Result |
|---|--------|--------|-----------------|

### Success Criteria



### Error Scenarios


**Diagram:** See `user_flows/flow-004.mmd`

---

## FLOW-005: Verschlüsselten Videoanruf starten und empfangen

**Actor:** Jonas Weber
**Trigger:** User tippt in einem Chat auf das Videoanruf-Icon

Flow zum Starten eines E2E-verschlüsselten Videoanrufs inklusive Onboarding, Error-Recovery und Edge-Cases

### Steps

| # | Action | Screen | Expected Result |
|---|--------|--------|-----------------|
| 1 | User öffnet die App (Decision) | Start/Login | App lädt und prüft den Login-Status |
| 2 | Wenn First-Time-User: Onboarding wird angezeigt und erklärt Videoanruf-Funktionen (Decision) | Onboarding | User versteht Grundlagen und wird zu Berechtigungen geführt |
| 3 | User erteilt Kamera- und Mikrofonberechtigungen (Decision) | Berechtigungsdialog | Berechtigungen werden erteilt und gespeichert |
| 4 | System prüft Kontostatus und Session-Gültigkeit (Decision) | Session-Check | User ist eingeloggt und Account gültig |
| 5 | System prüft Netzwerkstatus (Decision) | Netzwerk-Check | Netzwerk ist verfügbar und stabil |
| 6 | User öffnet einen Chat und tippt auf Videoanruf-Icon | Chat | Anrufanfrage wird initiiert |
| 7 | System prüft Verfügbarkeit des Empfängers (Decision) | Anruf wird aufgebaut | Empfänger ist online und erhält die Anrufanfrage |
| 8 | Empfänger nimmt den Videoanruf an (Decision) | Eingehender Anruf | Anruf wird akzeptiert |
| 9 | System baut E2E-verschlüsselten Videoanruf auf | Verbindungsaufbau | Beide Nutzer sehen und hören sich in hoher Qualität |
| 10 | Während des Anrufs überwacht das System die Netzwerkqualität (Decision) | Aktiver Anruf | Stabile Verbindung bleibt bestehen |
| 11 | Wenn Reconnect fehlschlägt, informiert das System und beendet den Anruf (Decision) | Verbindungsfehler | User erhält verständliche Fehlermeldung und Option zum erneuten Versuch |
| 12 | Edge-Case: User wechselt Gerät während des aktiven Anrufs (Decision) | Gerätewechsel-Hinweis | System zeigt Hinweis, dass Anruf nicht übertragen werden kann oder bietet Übergabe an |

### Success Criteria

Der Videoanruf wird erfolgreich mit Ende-zu-Ende-Verschlüsselung aufgebaut und beide Teilnehmer können sehen und hören

### Error Scenarios

- Empfänger offline oder nicht verfügbar
- Netzwerkverbindung instabil oder unterbrochen
- Kamera-/Mikrofonberechtigung verweigert
- Session abgelaufen → Account-Recovery erforderlich
- Gerätewechsel während aktivem Anruf nicht möglich

**Diagram:** See `user_flows/flow-005.mmd`

---

## FLOW-006: Kontakt blockieren

**Actor:** Anika Schreiber
**Trigger:** User waehlt im Kontaktprofil die Option 'Blockieren'

Flow zum Blockieren eines Kontakts, inklusive Onboarding, Error-Recovery und Edge-Cases

### Steps

| # | Action | Screen | Expected Result |
|---|--------|--------|-----------------|
| 1 | User oeffnet die App und sieht den Startbildschirm (Decision) | Start/Chats | App laedt und zeigt Chatliste |
| 2 | System prueft, ob dies die erste Nutzung der Blockierfunktion ist (Decision) | Hinweis-Overlay | Onboarding-Hinweis zur Blockierfunktion wird optional angezeigt |
| 3 | User oeffnet einen bestehenden Kontakt oder Chat (Decision) | Kontaktprofil/Chat | Kontaktprofil wird angezeigt |
| 4 | User tippt auf 'Mehr' und waehlt 'Blockieren' | Kontaktoptionen | Bestaetigungsdialog wird angezeigt |
| 5 | User bestaetigt die Blockierung (Decision) | Bestaetigungsdialog | Blockierungsanfrage wird an den Server gesendet |
| 6 | System verarbeitet die Blockierung (Decision) | System/Backend | Kontakt wird blockiert und Status aktualisiert |
| 7 | UI aktualisiert den Kontaktstatus | Kontaktprofil/Chat | Kontakt wird als blockiert angezeigt; Eingabe gesperrt |
| 8 | Blockierter Kontakt versucht eine Nachricht zu senden | Absender-Client | Nachricht wird nicht zugestellt; Absender erhaelt Rueckmeldung 'Nachricht nicht zugestellt' |
| 9 | Edge-Case: User wechselt Geraet oder stellt Account wieder her (Decision) | Login/Account-Recovery | Blockierliste wird synchronisiert und bleibt erhalten |

### Success Criteria

Kontakt ist blockiert, kann keine Nachrichten senden, und der Absender erhaelt eine Rueckmeldung

### Error Scenarios

- Kontakt existiert nicht: Fehlermeldung und keine Aenderung
- Offline-Modus: Blockierung wird nicht gesendet, Retry-Option
- Serverfehler: Blockierung fehlgeschlagen, Wiederholung moeglich
- Synchronisationsfehler bei Geraetewechsel: Blockierliste nicht aktuell
- Status-Refresh fehlgeschlagen: UI zeigt veralteten Zustand

**Diagram:** See `user_flows/flow-006.mmd`

---

## FLOW-008: Flow 8

**Actor:** Erik Scholz
**Trigger:** 



### Steps

| # | Action | Screen | Expected Result |
|---|--------|--------|-----------------|

### Success Criteria



### Error Scenarios


**Diagram:** See `user_flows/flow-008.mmd`

---

## FLOW-009: Business-Profil erstellen und verwalten (Onboarding)

**Actor:** Sofia Neumann
**Trigger:** User oeffnet erstmals die Profilverwaltung als Business-Nutzer

Flow zur erstmaligen Erstellung und späteren Verwaltung eines erweiterten Business-Profils inkl. Validierung, Upload-Pruefung, Synchronisation und Error-Recovery.

### Steps

| # | Action | Screen | Expected Result |
|---|--------|--------|-----------------|
| 1 | User oeffnet die App und landet im Dashboard | Dashboard | Dashboard wird angezeigt |
| 2 | System prueft, ob Session gueltig ist (Decision) | Session Check | User bleibt eingeloggt und kann fortfahren |
| 3 | User navigiert zu 'Business-Profil verwalten' | Profilverwaltung | Profilverwaltung wird angezeigt |
| 4 | Onboarding-Hinweis wird angezeigt und User startet das Erstellen | Onboarding/Intro | User sieht kurze Einfuehrung und startet den Flow |
| 5 | User fuellt Pflichtfelder (Name, Kategorie, Kontakt) aus | Business-Profil Formular | Pflichtfelder sind befuellt |
| 6 | System validiert Pflichtfelder (Decision) | Business-Profil Formular | Validierung erfolgreich; User kann fortfahren |
| 7 | User fuegt optionale Infos hinzu und laedt Profilbild/Dokument hoch (Decision) | Business-Profil Formular | Uploads werden hinzugefuegt und Vorschau angezeigt |
| 8 | User klickt auf 'Speichern' (Decision) | Business-Profil Formular | Profil wird gespeichert |
| 9 | Profil wird im Profilbereich angezeigt (Decision) | Profilbereich | Erweitertes Business-Profil ist sichtbar |
| 10 | User bearbeitet spaeter das Profil auf einem anderen Geraet und speichert (Decision) | Profilverwaltung (anderes Geraet) | Aenderungen werden sofort uebernommen und plattformuebergreifend sichtbar |

### Success Criteria

Das erweiterte Business-Profil wurde erfolgreich erstellt/aktualisiert und ist plattformuebergreifend sichtbar.

### Error Scenarios

- Validierungsfehler bei Pflichtfeldern verhindern das Speichern
- Upload abgelehnt wegen Richtlinienverstoss
- Verbindung verloren waehrend des Speicherns -> Retry/Draft
- Synchronisation/Plattform-Sync fehlgeschlagen
- Session abgelaufen -> Login/Account-Recovery erforderlich
- Offline-Modus verhindert den Abschluss des Flows

**Diagram:** See `user_flows/flow-009.mmd`

---

## FLOW-010: Flow 10

**Actor:** Helmut Kramer
**Trigger:** 



### Steps

| # | Action | Screen | Expected Result |
|---|--------|--------|-----------------|

### Success Criteria



### Error Scenarios


**Diagram:** See `user_flows/flow-010.mmd`

---

## FLOW-011: Passkey-Login

**Actor:** Mira Patel
**Trigger:** User waehlt auf dem Login-Screen die Option 'Mit Passkey anmelden'

Flow zur Anmeldung mit Passkey inkl. Onboarding, Fehlerbehandlung und Edge-Cases

### Steps

| # | Action | Screen | Expected Result |
|---|--------|--------|-----------------|
| 1 | User oeffnet Login-Screen | Login | Login-Optionen (Passkey, Passwort, SSO) werden angezeigt |
| 2 | User klickt 'Mit Passkey anmelden' (Decision) | Login | System prueft, ob ein Passkey fuer das Konto existiert |
| 3 | If Passkey vorhanden: System startet Passkey-Dialog (Decision) | Passkey-Dialog (OS) | Biometrie/PIN-Abfrage erscheint |
| 4 | User bestaetigt Passkey (Biometrie/PIN) (Decision) | Passkey-Dialog (OS) | Authentifizierung wird in <=3 Sekunden abgeschlossen |
| 5 | System erstellt Session und leitet ins Dashboard | Dashboard | User ist eingeloggt und Session aktiv |
| 6 | If kein Passkey vorhanden: System zeigt Hinweis und bietet Alternativen (Decision) | Login | Hinweismeldung + Optionen 'Passwort' und 'Passkey einrichten' |
| 7 | Onboarding: User waehlt 'Passkey einrichten' (Decision) | Passkey-Onboarding | Setup-Assistent erklaert Nutzen und startet Registrierung |
| 8 | Edge-Case: User ist offline waehrend Passkey-Login (Decision) | Login | Offline-Hinweis mit 'Erneut versuchen' und 'Passwort' Option |
| 9 | Error-Recovery: Passkey-Authentifizierung fehlgeschlagen (Decision) | Login | Klare Fehlermeldung + Button 'Erneut versuchen' und 'Alternativer Login' |
| 10 | Edge-Case: User wechselt Geraet ohne Passkey (Decision) | Account Recovery | User kann ueber E-Mail/OTP Passkey neu einrichten |

### Success Criteria

User meldet sich innerhalb von 3 Sekunden erfolgreich mit Passkey an und Session wird erstellt

### Error Scenarios

- Servertimeout bei Passkey-Pruefung
- Passkey-Dialog erscheint nicht (Geraet inkompatibel)
- Authentifizierung fehlgeschlagen/abgebrochen
- Keine Verbindung (Offline-Modus)
- Session-Erstellung fehlgeschlagen
- Passkey nicht vorhanden
- Geraetewechsel ohne Passkey
- Account-Recovery fehlgeschlagen (OTP abgelaufen)

**Diagram:** See `user_flows/flow-011.mmd`

---

## FLOW-012: Flow 12

**Actor:** Jonas Weber
**Trigger:** 



### Steps

| # | Action | Screen | Expected Result |
|---|--------|--------|-----------------|

### Success Criteria



### Error Scenarios


**Diagram:** See `user_flows/flow-012.mmd`

---

## FLOW-013: Flow 13

**Actor:** Anika Schreiber
**Trigger:** 



### Steps

| # | Action | Screen | Expected Result |
|---|--------|--------|-----------------|

### Success Criteria



### Error Scenarios


**Diagram:** See `user_flows/flow-013.mmd`

---

## FLOW-014: Flow 14

**Actor:** Lena Fischer
**Trigger:** 



### Steps

| # | Action | Screen | Expected Result |
|---|--------|--------|-----------------|

### Success Criteria



### Error Scenarios


**Diagram:** See `user_flows/flow-014.mmd`

---

## FLOW-015: Flow 15

**Actor:** Erik Scholz
**Trigger:** 



### Steps

| # | Action | Screen | Expected Result |
|---|--------|--------|-----------------|

### Success Criteria



### Error Scenarios


**Diagram:** See `user_flows/flow-015.mmd`

---

## FLOW-016: End-to-End Encryption Onboarding und sichere Nachrichten

**Actor:** Sofia Neumann
**Trigger:** User schliesst Registrierung ab und oeffnet erstmals den Chat

Onboarding, Schluesselverwaltung und sicheres Senden/Empfangen mit E2EE inklusive Fehler- und Edge-Case-Behandlung

### Steps

| # | Action | Screen | Expected Result |
|---|--------|--------|-----------------|
| 1 | User oeffnet die App und startet das Onboarding | Welcome / Onboarding | Onboarding wird angezeigt und fordert zur Einrichtung von E2EE auf |
| 2 | User bestaetigt E2EE-Einrichtung und startet Schluesselgenerierung (Decision) | E2EE Setup | Schluesselpaar wird generiert und sicher im Key Store abgelegt |
| 3 | System prueft Netzwerkverbindung und synchronisiert Public Key mit Server (Decision) | E2EE Setup | Public Key wird hochgeladen und mit Konto verknuepft |
| 4 | User oeffnet einen Chat und tippt eine Nachricht oder waehlt Medien | Chat | Nachricht/Medien sind zum Senden vorbereitet |
| 5 | User tippt auf Senden; System verschluesselt Nachricht mit Empfaenger-Public-Key (Decision) | Chat | Nachricht wird E2EE verschluesselt und in die Outbox gestellt |
| 6 | System versucht Nachricht zu senden; bei Offline-Modus wird sie gepuffert (Decision) | Chat | Nachricht gesendet oder als 'Wartet auf Verbindung' markiert |
| 7 | Empfaenger erhaelt Nachricht; System validiert Sender-Key (Decision) | Chat | Nachricht wird entschluesselt, falls Key verifiziert |
| 8 | System startet automatische Schluesselrotation bei Ablauf (Decision) | Sicherheitseinstellungen (im Hintergrund) | Neue Schluessel werden generiert, gespeichert und synchronisiert ohne Unterbrechung |
| 9 | User wechselt Geraet und startet Wiederherstellung (Decision) | Geraetewechsel / Account-Recovery | Identitaet wird verifiziert und neue Schluessel werden erzeugt |
| 10 | User bestaetigt Sicherheitswarnung bei Key-Mismatch oder verifiziert Kontakt (Decision) | Sicherheitswarnung | Kommunikation wird erst nach Verifizierung fortgesetzt |

### Success Criteria

User kann Nachrichten/Medien E2EE senden und empfangen, Schluessel werden sicher verwaltet und Warnungen bei Key-Problemen korrekt angezeigt

### Error Scenarios

- Schluesselgenerierung fehlgeschlagen
- Keine Netzwerkverbindung beim Key-Upload
- Versand fehlgeschlagen wegen Offline-Modus
- Empfaenger-Key fehlt oder ist ungueltig
- Unverifizierter/mismatch Key blockiert Entschluesselung
- Schluesselrotation fehlschlaegt
- Account-Recovery oder Geraetewechsel scheitert

**Diagram:** See `user_flows/flow-016.mmd`

---

## FLOW-017: Flow 17

**Actor:** Helmut Kramer
**Trigger:** 



### Steps

| # | Action | Screen | Expected Result |
|---|--------|--------|-----------------|

### Success Criteria



### Error Scenarios


**Diagram:** See `user_flows/flow-017.mmd`

---

## FLOW-018: Flow 18

**Actor:** Mira Patel
**Trigger:** 



### Steps

| # | Action | Screen | Expected Result |
|---|--------|--------|-----------------|

### Success Criteria



### Error Scenarios


**Diagram:** See `user_flows/flow-018.mmd`

---

## FLOW-019: Verify Authentication Hardening

**Actor:** Jonas Weber
**Trigger:** Jonas startet ein Security Review fuer Authentifizierung

Flow zur Ueberpruefung von MFA-Enforcement, Lockout-Policy, Audit-Logging und Log-Retention im Rahmen eines Security Reviews

### Steps

| # | Action | Screen | Expected Result |
|---|--------|--------|-----------------|
| 1 | Jonas oeffnet das Security-Dashboard | Security Dashboard | Dashboard mit Authentifizierungs- und Logging-Kennzahlen wird angezeigt |
| 2 | Jonas waehlt den Bereich 'Authentication Hardening Review' | Security Dashboard | Review-Ansicht mit Testsuite und Konfigurationen wird geladen |
| 3 | Jonas startet den MFA-Enforcement-Test fuer privilegierte und Standard-Accounts | Auth Review – MFA Tests | System fuehrt Test-Logins aus und sammelt MFA-Enforcement-Rate |
| 4 | Jonas vergleicht die MFA-Enforcement-Rate mit den Zielwerten (Decision) | Auth Review – MFA Results | Anzeige: Privileged 100%, Standard ≥95% |
| 5 | Jonas startet den Lockout-Test mit 5 Fehlversuchen in 10 Minuten | Auth Review – Lockout Tests | Account wird nach 5 Fehlversuchen gesperrt |
| 6 | Jonas prueft Audit-Logs gegen Test-Events (Login, Logout, Failure, Passwortwechsel) (Decision) | Audit Log Viewer | 100% der Events mit User, Timestamp, Source IP und Outcome vorhanden |
| 7 | Jonas prueft Log-Retention und Tamper-Evidence-Konfiguration (Decision) | Logging & Retention Settings | Retention >= 365 Tage, tamper-evident aktiviert |
| 8 | Jonas generiert den Compliance-Report | Review Summary | Report mit Pass/Fail je Kriterium wird erzeugt und gespeichert |

### Success Criteria

Alle Authentifizierungs- und Logging-Kriterien erfuellen die Hardening-Standards und der Report ist gespeichert

### Error Scenarios

- MFA-Enforcement unter Zielwerten
- Lockout-Policy greift nicht korrekt
- Audit-Logs unvollstaendig
- Retention-Policy unter Mindestdauer
- Report konnte nicht gespeichert werden

**Diagram:** See `user_flows/flow-019.mmd`

---

## FLOW-020: Bild in bestehendem Chat senden

**Actor:** Anika Schreiber
**Trigger:** User tippt im Chat auf das Attachment-Icon

Flow zum Senden eines Bildes inkl. Onboarding, Fehlerbehandlung und Edge-Cases

### Steps

| # | Action | Screen | Expected Result |
|---|--------|--------|-----------------|
| 1 | User öffnet App und prüft, ob er angemeldet ist (Decision) | Login/Chat-Übersicht | Bei gültiger Session wird die Chat-Übersicht angezeigt |
| 2 | First-Time-User Onboarding für Medienzugriff wird angezeigt (Berechtigungen) (Decision) | Onboarding/Permission Prompt | User erteilt Zugriff auf Fotos/Dateien |
| 3 | User öffnet einen bestehenden Chat | Chat-Übersicht | Chat-Thread wird geöffnet |
| 4 | User tippt auf Attachment-Icon und wählt Bildquelle (Galerie/Kamera) (Decision) | Chat-Thread / Attachment-Menü | Dateiauswahl öffnet sich |
| 5 | User wählt eine Bilddatei (Decision) | Dateiauswahl | Bild wird als Vorschau im Chat angezeigt |
| 6 | System prüft Dateigröße gegen Maximalgröße (Decision) | Bildvorschau | Bild ist sendebereit |
| 7 | User tippt auf „Senden“ (Decision) | Chat-Thread | Upload startet mit Fortschrittsanzeige |
| 8 | System bestätigt Versand und zeigt Bild im Chat für Sender | Chat-Thread | Bildnachricht erscheint im Chat mit Status „gesendet“ |
| 9 | Empfänger erhält Bildnachricht | Chat-Thread (Empfänger) | Bild wird im Chat angezeigt |

### Success Criteria

Bild wurde erfolgreich gesendet und ist im Chat bei Sender und Empfänger sichtbar

### Error Scenarios

- Session abgelaufen -> Login erforderlich
- Berechtigungen für Medienzugriff verweigert
- Nicht unterstütztes Dateiformat
- Bilddatei überschreitet Maximalgröße
- Instabile Netzwerkverbindung -> Versand fehlgeschlagen
- Offline-Modus verhindert Chat-Laden
- Serverfehler beim Versand
- Gerätewechsel/Account-Recovery führt zu verzögerter Synchronisierung

**Diagram:** See `user_flows/flow-020.mmd`

---

## FLOW-021: Flow 21

**Actor:** Lena Fischer
**Trigger:** 



### Steps

| # | Action | Screen | Expected Result |
|---|--------|--------|-----------------|

### Success Criteria



### Error Scenarios


**Diagram:** See `user_flows/flow-021.mmd`

---

## FLOW-022: Flow 22

**Actor:** Erik Scholz
**Trigger:** 



### Steps

| # | Action | Screen | Expected Result |
|---|--------|--------|-----------------|

### Success Criteria



### Error Scenarios


**Diagram:** See `user_flows/flow-022.mmd`

---

## FLOW-023: Admin Analytics & Audit Logs anzeigen (Onboarding)

**Actor:** Sofia Neumann
**Trigger:** User startet Onboarding und wählt 'Analytics & Audit Logs'

Flow für einen neuen Administrator, der erstmals das Analytics-Dashboard und Audit-Logs aufruft, filtert und mögliche Fehlerfälle behandelt

### Steps

| # | Action | Screen | Expected Result |
|---|--------|--------|-----------------|
| 1 | User öffnet Admin-Konsole über Onboarding-Hinweis | Onboarding > Admin-Konsole | Admin-Konsole lädt mit Hinweis auf Analytics-Bereich |
| 2 | System prüft Admin-Berechtigungen des Users (Decision) | Berechtigungsprüfung | User wird als Admin erkannt und Zugriff erlaubt |
| 3 | User öffnet Analytics-Dashboard und wählt Zeitraum (Decision) | Analytics Dashboard | System lädt Durchsatzmetriken, Zustellraten und System Health für den Zeitraum |
| 4 | System prüft, ob Daten für Zeitraum vorhanden sind (Decision) | Analytics Dashboard | Bei vorhandenen Daten werden Metriken angezeigt; bei fehlenden Daten wird Empty State angezeigt |
| 5 | User navigiert zu Audit Logs und setzt Filter (User, Eventtyp, Zeitraum) (Decision) | Audit Logs | Gefilterte Log-Einträge mit Zeitstempel, Actor, Aktion und Ergebnis werden angezeigt |
| 6 | User exportiert Logs oder aktualisiert Filter (Decision) | Audit Logs | Export startet oder Logs werden neu geladen |
| 7 | User wechselt Gerät und meldet sich erneut an (Decision) | Login > Admin-Konsole | Session wird wiederhergestellt und Analytics-Dashboard ist zugänglich |

### Success Criteria

Administrator kann Analytics-Metriken und Audit-Logs für einen gewählten Zeitraum einsehen und filtern

### Error Scenarios

- Autorisierungsfehler bei fehlenden Admin-Rechten
- Keine Daten im gewählten Zeitraum (Empty State)
- Verlorene Verbindung beim Laden der Analytics (Retry-Dialog)
- Fehlgeschlagener Export der Logs (Retry-Option)
- Offline-Modus blockiert Zugriff
- Gerätewechsel erfordert Account-Recovery

**Diagram:** See `user_flows/flow-023.mmd`

---

## FLOW-024: Flow 24

**Actor:** Helmut Kramer
**Trigger:** 



### Steps

| # | Action | Screen | Expected Result |
|---|--------|--------|-----------------|

### Success Criteria



### Error Scenarios


**Diagram:** See `user_flows/flow-024.mmd`

---

## FLOW-025: Flow 25

**Actor:** Mira Patel
**Trigger:** 



### Steps

| # | Action | Screen | Expected Result |
|---|--------|--------|-----------------|

### Success Criteria



### Error Scenarios


**Diagram:** See `user_flows/flow-025.mmd`

---

## FLOW-026: Flow 26

**Actor:** Jonas Weber
**Trigger:** 



### Steps

| # | Action | Screen | Expected Result |
|---|--------|--------|-----------------|

### Success Criteria



### Error Scenarios


**Diagram:** See `user_flows/flow-026.mmd`

---

## FLOW-027: Status-Antwort senden

**Actor:** Anika Schreiber
**Trigger:** Kundenservice-Mitarbeiter öffnet einen Chat mit einer eingehenden Statusnachricht

Flow zum Antworten auf eine eingehende Statusnachricht mit Validierung des Antwortfensters, Fehlerbehandlung und Edge-Cases

### Steps

| # | Action | Screen | Expected Result |
|---|--------|--------|-----------------|
| 1 | User öffnet die Messaging-App (Decision) | Login / Session Check | App prüft aktive Session und Berechtigungen |
| 2 | User meldet sich an (falls Session abgelaufen) (Decision) | Login | Erfolgreiche Authentifizierung und Zugriff auf Chats |
| 3 | System prüft, ob es der erste Login auf diesem Gerät ist (Decision) | Onboarding | Onboarding-Hinweise zu Status-Antworten werden angezeigt |
| 4 | User öffnet Chat mit eingehender Statusnachricht | Chatliste / Chat | Chatverlauf mit Statusnachricht wird angezeigt |
| 5 | User wählt die Statusnachricht und klickt auf 'Status-Antwort' (Decision) | Chat | Antwortfeld für Status-Antwort wird geöffnet |
| 6 | System prüft Antwortfenster-Zeitlimit (Decision) | Chat | Antwort erlaubt, wenn innerhalb des Zeitfensters |
| 7 | User verfasst die Status-Antwort und klickt 'Senden' (Decision) | Chat | System startet Sendevorgang |
| 8 | System sendet Nachricht und bestätigt Zustellung | Chat | Antwort wird zugestellt und als Status-Antwort gekennzeichnet |
| 9 | User versucht bei Fehlern erneut zu senden (Decision) | Chat | Nachricht wird erneut gesendet und erfolgreich zugestellt |
| 10 | System erkennt Gerätewechsel und fordert Re-Authentifizierung an (Decision) | Security Check | User bestätigt Identität und setzt Flow fort |

### Success Criteria

Status-Antwort wurde erfolgreich gesendet, zugestellt und im Chatverlauf als Status-Antwort gekennzeichnet angezeigt

### Error Scenarios

- Antwortfenster abgelaufen → Senden verhindert und Hinweis angezeigt
- Verbindung unterbrochen → Fehlermeldung mit Option 'Erneut senden'
- Serverfehler → Nachricht bleibt als 'Nicht zugestellt' markiert
- Offline-Modus → Nachricht wird in Warteschlange gehalten
- Gerätewechsel → Re-Authentifizierung erforderlich
- Account-Recovery notwendig bei fehlgeschlagenem Login

**Diagram:** See `user_flows/flow-027.mmd`

---

## FLOW-028: Media-Upload-Throughput verifizieren

**Actor:** Lena Fischer
**Trigger:** User startet neue Performance-Test-Session

Flow zur Validierung von Upload-Throughput und Completion Times unter erwarteter und Peak-Last inkl. Error-Recovery, Onboarding und Edge Cases

### Steps

| # | Action | Screen | Expected Result |
|---|--------|--------|-----------------|
| 1 | User oeffnet das Performance QA Portal zum ersten Mal und startet Onboarding (Decision) | Welcome / Onboarding | Onboarding erklaert Testziele, Metriken und benoetigte Zugriffe |
| 2 | User meldet sich an oder stellt Account wieder her (Decision) | Login / Account Recovery | User ist authentifiziert und sieht Dashboard |
| 3 | User wechselt Geraet und verknuepft neues Testgeraet fuer Instrumentierung (Decision) | Device Management | Neues Geraet ist registriert und Instrumentierungsstatus ist 'bereit' |
| 4 | User erstellt eine neue Test-Session und waehlt Lastprofil 'Expected' und 'Peak' (Decision) | New Test Session | Testkonfiguration gespeichert mit Dateigroessen (Voice/Media, 10 MB) und Metriken |
| 5 | User fordert Testressourcen/Cloud-Credits an (Decision) | Resources & Billing | Ressourcen sind genehmigt und Testumgebung wird provisioniert |
| 6 | User startet Instrumentierung und fuehrt einen Netzwerk-Check durch (Decision) | Instrumentation Setup | Per-Client Throughput Messung aktiv und Status 'Ready' |
| 7 | User startet Upload-Tests (Expected Load) und misst Durchschnitts-Throughput (Decision) | Run Test - Expected Load | Durchschnitts-Throughput ≥ 2.5 Mbps und Ergebnisse werden protokolliert |
| 8 | User startet Upload-Tests (Peak Load) und misst Durchschnitts-Throughput (Decision) | Run Test - Peak Load | Durchschnitts-Throughput ≥ 1.5 Mbps und Ergebnisse werden protokolliert |
| 9 | User fuehrt timed Uploads fuer 10 MB aus und berechnet 95. Perzentil Completion Time (Decision) | Timed Uploads - Expected Load | 95. Perzentil ≤ 20 Sekunden |
| 10 | User fuehrt Stress-Tests mit hoher Konkurrenz aus und berechnet 99. Perzentil Completion Time (Decision) | Stress Test - Peak Load | 99. Perzentil ≤ 35 Sekunden |
| 11 | User startet 1-stuendigen Sustained Concurrency Test und misst Erfolgsrate (Decision) | Sustained Test | Upload Success Rate ≥ 99.5% |
| 12 | User exportiert Bericht und teilt ihn mit Stakeholdern | Results & Reporting | Bericht enthaelt Durchsatz, Perzentile, Fehlerquote und Empfehlung |

### Success Criteria

Alle Zielmetriken sind erreicht und der Bericht wird erfolgreich gespeichert und geteilt

### Error Scenarios

- Offline-Modus verhindert Onboarding oder Instrumentierung
- Account-Recovery erforderlich wegen Login-Fehler
- Geraetewechsel fehlgeschlagen
- Zahlung/Abrechnung abgelehnt bei Ressourcen-Anforderung
- Netzwerkverbindung verloren waehrend Tests
- Upload fehlgeschlagen mit automatischem Retry

**Diagram:** See `user_flows/flow-028.mmd`

---

## FLOW-029: Flow 29

**Actor:** Erik Scholz
**Trigger:** 



### Steps

| # | Action | Screen | Expected Result |
|---|--------|--------|-----------------|

### Success Criteria



### Error Scenarios


**Diagram:** See `user_flows/flow-029.mmd`

---

## FLOW-030: Flow 30

**Actor:** Sofia Neumann
**Trigger:** 



### Steps

| # | Action | Screen | Expected Result |
|---|--------|--------|-----------------|

### Success Criteria



### Error Scenarios


**Diagram:** See `user_flows/flow-030.mmd`

---

