@@smoke @@regression
Feature: Anrufbenachrichtigungen getrennt konfigurieren
  As a Endnutzer
  I want to separate Einstellungen für Anrufbenachrichtigungen konfigurieren
  So that um Anrufe zuverlässig und nach meinen Datenschutzpräferenzen zu erhalten, ohne andere Benachrichtigungen zu beeinflussen

  Background:
    Given der Nutzer ist angemeldet und befindet sich in den Benachrichtigungseinstellungen

  @@smoke @@happy-path @@regression
  Scenario: Aktivieren von Anrufbenachrichtigungen ohne Einfluss auf andere Typen
    # Happy path: Anrufbenachrichtigungen aktivieren, andere Benachrichtigungstypen bleiben unverändert
    Given andere Benachrichtigungstypen sind aktiviert
    When der Nutzer aktiviert die Anrufbenachrichtigungen
    Then Anrufbenachrichtigungen sind aktiv
    And andere Benachrichtigungstypen bleiben unverändert

  @@happy-path @@regression
  Scenario: Deaktivieren ausschließlich der Anrufbenachrichtigungen
    # Happy path: Anrufbenachrichtigungen deaktivieren, andere Benachrichtigungen bleiben aktiv
    Given Anrufbenachrichtigungen sind aktiviert
    And andere Benachrichtigungstypen sind aktiviert
    When der Nutzer deaktiviert ausschließlich die Anrufbenachrichtigungen
    Then Anrufbenachrichtigungen werden nicht zugestellt
    And andere Benachrichtigungen bleiben aktiv

  @@negative @@regression
  Scenario: Netzwerkunterbrechung beim Speichern der Einstellungen
    # Error scenario: Speichern schlägt fehl, vorherige Einstellungen bleiben erhalten
    Given der Nutzer hat geänderte Benachrichtigungseinstellungen
    When der Nutzer speichert die Benachrichtigungseinstellungen und es tritt eine Netzwerkunterbrechung auf
    Then das System zeigt eine Fehlermeldung an
    And die vorherigen Einstellungen bleiben erhalten

  @@edge @@regression
  Scenario Outline: Beibehaltung des Zustands anderer Benachrichtigungstypen bei Umstellung der Anrufbenachrichtigung
    # Edge case: unterschiedliche Ausgangszustände anderer Benachrichtigungstypen bleiben unverändert
    Given andere Benachrichtigungstypen sind im Zustand <others_state>
    When der Nutzer schaltet die Anrufbenachrichtigungen auf <call_state>
    Then Anrufbenachrichtigungen sind <call_state>
    And andere Benachrichtigungstypen bleiben im Zustand <others_state>

    Examples:
      | others_state | call_state |
      | aktiviert | aktiviert |
      | deaktiviert | deaktiviert |
      | aktiviert | deaktiviert |

  @@boundary @@regression
  Scenario: Boundary: Speichern ohne Änderungen
    # Boundary condition: Speichern ohne Änderungen darf Zustand nicht verändern
    Given die aktuellen Benachrichtigungseinstellungen sind geladen
    When der Nutzer speichert die Benachrichtigungseinstellungen ohne Änderungen
    Then alle Benachrichtigungseinstellungen bleiben unverändert
    And das System bestätigt das erfolgreiche Speichern
