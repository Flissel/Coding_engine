@smoke @regression
Feature: Cloud-Backup
  As a Endnutzer
  I want to Chat-Backups in der Cloud aktivieren und ausfuehren
  So that meine Nachrichten plattformuebergreifend sicher wiederherstellen zu koennen und Datenverlust zu vermeiden

  Background:
    Given der Nutzer ist angemeldet
    And die App hat Zugriff auf die Backup-Einstellungen

  @@smoke @@regression @@happy-path
  Scenario: Erfolgreiches Cloud-Backup wird gespeichert und bestaetigt
    # Happy path: Backup mit stabiler Verbindung
    Given eine stabile Internetverbindung ist verfuegbar
    And Cloud-Speicher ist verfuegbar und ausreichend
    When der Nutzer ein Cloud-Backup ausloest
    Then das Chat-Backup wird erfolgreich in der Cloud gespeichert
    And der Nutzer erhaelt eine Bestaetigungsmeldung

  @@regression @@negative
  Scenario: Backup wird abgebrochen wenn Cloud-Speicher nicht verfuegbar ist
    # Error scenario: kein Speicher oder Kontingent erschöpft
    Given Cloud-Speicher ist nicht verfuegbar oder das Kontingent ist erschoepft
    When der Nutzer ein Cloud-Backup startet
    Then der Vorgang wird abgebrochen
    And eine klare Fehlermeldung mit Hinweis auf das Problem wird angezeigt

  @@regression @@edge
  Scenario: Bestehendes Backup wird gemaess Systemkonfiguration ueberschrieben oder versioniert
    # Edge case: Vorhandenes Backup wird behandelt
    Given ein bestehendes Cloud-Backup ist vorhanden
    And die Systemeinstellung fuer Backup-Verhalten ist gesetzt
    When der Nutzer ein neues Cloud-Backup startet
    Then das vorherige Backup wird sicher ueberschrieben oder versionsbasiert gespeichert gemaess den Systemeinstellungen

  @@regression @@boundary
  Scenario: Backup mit minimalem freien Speicherplatz
    # Boundary condition: genau ausreichender Speicher
    Given Cloud-Speicher ist verfuegbar mit freiem Platz genau in Hoehe der Backup-Groesse
    And eine stabile Internetverbindung ist verfuegbar
    When der Nutzer ein Cloud-Backup ausloest
    Then das Backup wird erfolgreich gespeichert
    And der verbleibende freie Speicherplatz wird als null angezeigt

  @@regression @@edge
  Scenario Outline: Backup-Verhalten nach Systemkonfiguration
    # Scenario Outline: Ueberschreiben vs Versionierung
    Given ein bestehendes Cloud-Backup ist vorhanden
    And die Systemeinstellung fuer Backup-Verhalten ist auf <backup_mode> gesetzt
    When der Nutzer ein neues Cloud-Backup startet
    Then das vorherige Backup wird <expected_behavior>

    Examples:
      | backup_mode | expected_behavior |
      | ueberschreiben | sicher ueberschrieben |
      | versionieren | versionsbasiert gespeichert |

  @@regression @@negative
  Scenario Outline: Fehlermeldungstext bei Speicherproblemen
    # Scenario Outline: Fehlermeldung variieren je nach Ursache
    Given Cloud-Speicherstatus ist <storage_status>
    When der Nutzer ein Cloud-Backup startet
    Then der Vorgang wird abgebrochen
    And eine Fehlermeldung <error_message> wird angezeigt

    Examples:
      | storage_status | error_message |
      | nicht verfuegbar | Cloud-Speicher nicht verfuegbar |
      | Kontingent erschoepft | Cloud-Kontingent erschoepft |
