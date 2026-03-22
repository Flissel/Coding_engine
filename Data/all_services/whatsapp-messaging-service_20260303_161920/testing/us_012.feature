@@smoke @@regression
Feature: Sprachnachricht senden
  As a Endnutzer
  I want to eine Sprachnachricht aufnehmen und senden
  So that um schnell und intuitiv zu kommunizieren, auch wenn Tippen unpraktisch ist

  Background:
    Given der Endnutzer ist in einem Chat mit einem Empfaenger

  @@smoke @@regression @@happy-path
  Scenario: Sprachnachricht erfolgreich aufnehmen und senden
    # Happy path: Aufnahme wird gesendet und zugestellt
    Given der Endnutzer hat Mikrofonzugriff erteilt
    When der Endnutzer startet eine Aufnahme und tippt auf Senden
    Then die Sprachnachricht wird verschluesselt uebertragen
    And die Sprachnachricht wird dem Empfaenger zugestellt

  @@regression @@edge
  Scenario: Abgebrochene Aufnahme wird nicht gesendet
    # Edge case: Aufnahme vor dem Senden abgebrochen
    Given der Endnutzer hat Mikrofonzugriff erteilt
    When der Endnutzer startet eine Aufnahme und bricht sie vor dem Senden ab
    Then es wird keine Sprachnachricht gesendet
    And es bleibt keine unvollstaendige Nachricht im Verlauf

  @@regression @@negative @@error
  Scenario: Senden bei Netzwerkunterbrechung
    # Error scenario: Netzwerk unterbrochen beim Senden
    Given die Netzwerkverbindung ist unterbrochen
    When der Endnutzer nimmt eine Sprachnachricht auf und tippt auf Senden
    Then der Endnutzer erhaelt eine Fehlermeldung
    And die Nachricht wird lokal zwischengespeichert oder ein erneuter Sendeversuch wird angeboten

  @@regression @@boundary
  Scenario Outline: Senden verschiedener Nachrichtenlaengen
    # Boundary conditions: minimale und maximale Laenge
    Given der Endnutzer hat Mikrofonzugriff erteilt
    When der Endnutzer nimmt eine Sprachnachricht mit Laenge <duration> Sekunden auf und tippt auf Senden
    Then die Sprachnachricht wird akzeptiert und gesendet

    Examples:
      | duration |
      | 1 |
      | 300 |

  @@regression @@negative @@error
  Scenario: Senden ohne Mikrofonzugriff
    # Error scenario: Mikrofonzugriff nicht erteilt
    Given der Endnutzer hat Mikrofonzugriff nicht erteilt
    When der Endnutzer versucht eine Sprachnachricht aufzunehmen
    Then die Aufnahme wird nicht gestartet
    And der Endnutzer erhaelt einen Hinweis zum Erteilen des Mikrofonzugriffs
