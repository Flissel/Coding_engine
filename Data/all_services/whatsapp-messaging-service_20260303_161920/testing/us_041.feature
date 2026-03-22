@smoke @regression
Feature: Anrufverlauf einsehen
  As a registrierter Nutzer
  I want to den Anrufverlauf einsehen
  So that um vergangene Anrufe nachvollziehen und schnell wieder Kontakt aufnehmen zu koennen

  Background:
    Given der Nutzer ist registriert und erfolgreich angemeldet

  @@smoke @@regression @@happy-path
  Scenario: Anrufverlauf mit gespeicherten Anrufen anzeigen
    # Happy Path: gespeicherte Anrufe werden chronologisch mit Datum, Uhrzeit und Kontakt angezeigt
    Given es existieren gespeicherte Anrufe fuer den Nutzer
    When der Nutzer den Anrufverlauf oeffnet
    Then werden die Anrufe chronologisch sortiert angezeigt
    And jeder Eintrag zeigt Datum, Uhrzeit und Kontakt

  @@regression @@edge
  Scenario: Anrufverlauf ohne gespeicherte Anrufe
    # Edge Case: leere Ansicht mit Hinweis
    Given es existieren keine gespeicherten Anrufe fuer den Nutzer
    When der Nutzer den Anrufverlauf oeffnet
    Then wird eine leere Ansicht angezeigt
    And ein Hinweis informiert, dass kein Anrufverlauf vorhanden ist

  @@negative @@regression
  Scenario: Zugriff ohne Berechtigung wird verweigert
    # Error Scenario: fehlende Berechtigung
    Given der Nutzer hat keine Berechtigung auf den Anrufverlauf
    When der Nutzer versucht den Anrufverlauf zu oeffnen
    Then wird der Zugriff verweigert
    And eine entsprechende Fehlermeldung wird angezeigt

  @@regression @@boundary
  Scenario: Chronologische Sortierung bei Grenzwerten
    # Boundary Condition: Anrufe um Mitternacht und am Monatswechsel korrekt sortiert
    Given es existieren gespeicherte Anrufe mit Zeitstempeln am Tages- und Monatswechsel
    When der Nutzer den Anrufverlauf oeffnet
    Then werden die Anrufe korrekt chronologisch sortiert angezeigt
    And die Sortierung beruecksichtigt Datum und Uhrzeit

  @@regression @@data-driven
  Scenario Outline: Anrufverlauf datengetrieben anzeigen
    # Scenario Outline: verschiedene Anruflisten werden korrekt dargestellt
    Given es existieren <anzahl> gespeicherte Anrufe fuer den Nutzer
    When der Nutzer den Anrufverlauf oeffnet
    Then werden genau <anzahl> Anrufe angezeigt
    And jeder Eintrag zeigt Datum, Uhrzeit und Kontakt

    Examples:
      | anzahl |
      | 1 |
      | 5 |
      | 50 |
