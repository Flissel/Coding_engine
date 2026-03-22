@@smoke @@regression
Feature: Speichernutzung anzeigen und verwalten
  As a Systemadministrator
  I want to die Speichernutzung einsehen und Speicher verwalten
  So that um Speicherengpaesse fruehzeitig zu erkennen und eine stabile Performance sicherzustellen

  Background:
    Given der Systemadministrator ist angemeldet und besitzt Berechtigung zur Speicherverwaltung

  @@smoke @@regression @@happy-path
  Scenario: Uebersicht zeigt Gesamtverbrauch, Nutzung pro Bereich und verbleibenden Speicher
    # Happy Path: Uebersichtsdaten werden korrekt angezeigt
    When er die Uebersichtsseite zur Speichernutzung oeffnet
    Then werden Gesamtverbrauch, Nutzung pro Bereich und verbleibender Speicher in einer klaren Uebersicht angezeigt
    And die Summen der Bereichsnutzung entsprechen dem Gesamtverbrauch

  @@regression @@happy-path
  Scenario Outline: Filter nach Bereich oder Zeitraum aktualisiert Verbrauchswerte und Gesamtsumme
    # Happy Path mit Datenvarianten: Filter liefern korrekte Werte
    Given es existieren Daten in unterschiedlichen Bereichen mit hohem Speicherverbrauch
    When der Systemadministrator den Filter nach <filter_typ> mit Wert <filter_wert> anwendet
    Then zeigt das System die gefilterten Verbrauchswerte korrekt
    And die angezeigte Gesamtsumme entspricht der Summe der gefilterten Bereiche

    Examples:
      | filter_typ | filter_wert |
      | Bereich | Dokumente |
      | Bereich | Backups |
      | Zeitraum | Letzte 7 Tage |
      | Zeitraum | Letzte 30 Tage |

  @@regression @@edge-case
  Scenario: Detailansicht eines Bereichs ohne Daten zeigt 0 Verbrauch
    # Edge Case: Bereich ohne gespeicherte Daten
    Given ein Bereich hat keine gespeicherten Daten
    When der Systemadministrator die Detailansicht dieses Bereichs aufruft
    Then zeigt das System den Verbrauch als 0
    And es wird keine Fehlermeldung angezeigt

  @@regression @@negative
  Scenario: Speichernutzungsdaten voruebergehend nicht verfuegbar
    # Error Scenario: System zeigt klare Fehlermeldung
    Given die Speichernutzungsdaten sind voruebergehend nicht verfuegbar
    When der Systemadministrator die Uebersicht aufruft
    Then zeigt das System eine klare Fehlermeldung mit Hinweis zur spaeteren erneuten Abfrage

  @@regression @@boundary
  Scenario Outline: Grenzwerte der Speichernutzung werden korrekt dargestellt
    # Boundary Conditions: 0 und 100 Prozent Auslastung
    Given der Bereich <bereich> hat den Speicherverbrauch <verbrauch>
    When der Systemadministrator die Detailansicht des Bereichs <bereich> oeffnet
    Then zeigt das System den Verbrauch als <verbrauch>
    And die Anzeige fuer verbleibenden Speicher ist konsistent

    Examples:
      | bereich | verbrauch |
      | Archiv | 0 |
      | Archiv | 100 |
