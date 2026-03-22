@@smoke @@regression
Feature: Verschluesseltes Backup
  As a registrierter Nutzer
  I want to ein Ende-zu-Ende verschluesseltes Backup meiner Daten erstellen und wiederherstellen
  So that damit meine Daten auch bei Verlust oder Geraetwechsel sicher und vertraulich bleiben

  Background:
    Given der Nutzer ist registriert und angemeldet
    And eine stabile Internetverbindung ist verfuegbar

  @@smoke @@happy-path
  Scenario: Backup erfolgreich erstellen und bestaetigen
    # Happy path: Ende-zu-Ende verschluesseltes Backup wird erstellt
    When der Nutzer startet ein Backup
    Then wird ein Ende-zu-Ende verschluesseltes Backup erstellt
    And der Nutzer erhaelt eine Erfolgsbestaetigung

  @@regression @@happy-path
  Scenario: Wiederherstellung aus gueltigem verschluesseltem Backup
    # Happy path: Daten werden vollstaendig und korrekt wiederhergestellt
    Given ein gueltiges Ende-zu-Ende verschluesseltes Backup ist vorhanden
    When der Nutzer waehlt die Wiederherstellung
    Then werden alle Daten vollstaendig und korrekt wiederhergestellt
    And der Nutzer erhaelt eine erfolgreiche Abschlussmeldung

  @@regression @@negative
  Scenario: Wiederherstellung mit falschem Entschluesselungsschluessel
    # Error scenario: Wiederherstellung wird abgebrochen und Fehlermeldung angezeigt
    Given ein gueltiges Ende-zu-Ende verschluesseltes Backup ist vorhanden
    And der Nutzer gibt einen falschen Entschluesselungsschluessel an
    When die Wiederherstellung gestartet wird
    Then wird die Wiederherstellung sicher abgebrochen
    And eine verstaendliche Fehlermeldung wird angezeigt

  @@regression @@negative
  Scenario: Netzwerkabbruch waehrend Backup
    # Error scenario: Backup wird sicher beendet und Neustart angeboten
    Given der Nutzer startet ein Backup
    When die Netzwerkverbindung waehrend der Sicherung abbricht
    Then wird der Backup-Vorgang sicher beendet
    And der Nutzer erhaelt eine Meldung mit der Moeglichkeit, das Backup erneut zu starten

  @@regression @@edge-case
  Scenario Outline: Backup mit Datenumfang an Grenzwerte anpassen
    # Boundary condition: Backup bei minimalem und grossem Datenumfang
    Given der Nutzer hat einen Datenumfang von <data_size> in seinem Konto
    When der Nutzer startet ein Backup
    Then wird ein Ende-zu-Ende verschluesseltes Backup erfolgreich erstellt
    And die Erfolgsbestaetigung wird angezeigt

    Examples:
      | data_size |
      | 0 MB |
      | 10 GB |
