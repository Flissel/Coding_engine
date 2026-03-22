@@smoke @@regression
Feature: Datennutzung
  As a Endnutzer
  I want to meinen Datenverbrauch für Nachrichten anzeigen und begrenzen
  So that damit ich Datenschutz wahren und die App zuverlässig sowie performant nutzen kann

  Background:
    Given der Nutzer ist angemeldet

  @@smoke @@regression @@happy-path
  Scenario: Datennutzung anzeigen mit aktuellem und historischem Verbrauch
    # Happy path: Anzeige des aktuellen und historischen Datenverbrauchs pro Zeitraum
    Given die Datennutzungserfassung ist aktiv
    When der Nutzer die Ansicht "Datennutzung" öffnet
    Then zeigt das System den aktuellen Datenverbrauch pro Zeitraum an
    And zeigt das System den historischen Datenverbrauch pro Zeitraum an

  @@regression @@boundary
  Scenario Outline: Datenlimit erreicht oder überschritten
    # Boundary condition: Nutzer wird informiert und Datennutzung reduziert bei Erreichen/Überschreitung
    Given die Datennutzungserfassung ist aktiv
    And der Nutzer hat ein Datenlimit von <limit_mb> MB definiert
    And die reduzierte Datennutzung ist auf <reduction_mode> eingestellt
    When der Datenverbrauch <comparison> dem Limit ist
    Then informiert das System den Nutzer über das erreichte oder überschrittene Limit
    And reduziert das System die Datennutzung gemäß der gewählten Einstellung

    Examples:
      | limit_mb | comparison | reduction_mode |
      | 500 | gleich | Nur Textnachrichten |
      | 500 | über | Medien-Download deaktivieren |

  @@regression @@negative
  Scenario: Keine Datennutzungserfassung verfügbar
    # Error scenario: verständliche Fehlermeldung und erneute Versuchsmöglichkeit
    Given die Datennutzungserfassung ist nicht verfügbar
    When der Nutzer versucht die Ansicht "Datennutzung" zu öffnen
    Then zeigt das System eine verständliche Fehlermeldung an
    And bietet das System eine erneute Versuchsmöglichkeit an

  @@regression @@edge-case
  Scenario Outline: Historische Zeiträume ohne Datenverbrauch
    # Edge case: Zeiträume ohne Verbrauch werden korrekt angezeigt
    Given die Datennutzungserfassung ist aktiv
    And für den Zeitraum <period> liegt kein Datenverbrauch vor
    When der Nutzer die Ansicht "Datennutzung" öffnet
    Then zeigt das System für den Zeitraum <period> einen Verbrauch von 0 MB an
    And bleibt die Ansicht ohne Fehlermeldung nutzbar

    Examples:
      | period |
      | letzte Woche |
      | letzter Monat |
