@smoke @regression
Feature: Smart Reply
  As a Geschaeftskundenbetreiber
  I want to intelligente Antwortvorschlaege beim Beantworten von Kundennachrichten nutzen
  So that schneller und konsistenter auf Kundenanfragen reagieren zu koennen und die Servicequalitaet zu steigern

  Background:
    Given eine eingehende Kundennachricht ist im Chat geoeffnet

  @@smoke @@regression @@happy-path
  Scenario: Relevante Antwortvorschlaege erscheinen innerhalb von 2 Sekunden
    # Happy path: Vorschlaege werden rechtzeitig angezeigt
    When der Nutzer das Antwortfeld fokussiert
    Then das System zeigt innerhalb von 2 Sekunden mindestens einen relevanten Antwortvorschlag an
    And die Vorschlaege sind sichtbar und auswählbar

  @@regression @@happy-path
  Scenario: Ausgewaehlter Vorschlag wird ins Eingabefeld uebernommen
    # Happy path: Vorschlag anklicken und bearbeiten
    Given relevante Antwortvorschlaege werden angezeigt
    When der Nutzer einen vorgeschlagenen Text anklickt
    Then der Text wird in das Eingabefeld uebernommen
    And der Text kann vor dem Senden bearbeitet werden

  @@regression @@edge
  Scenario: Keine Vorschlaege bei unklarer Nachricht
    # Edge case: mehrdeutige Inhalte liefern keine Vorschlaege
    Given die Nachricht enthaelt unklare oder mehrdeutige Informationen
    When der Nutzer das Antwortfeld fokussiert
    Then es werden keine Vorschlaege angezeigt
    And der Nutzer kann weiterhin manuell antworten

  @@regression @@negative
  Scenario: Vorschlagsdienst nicht verfuegbar zeigt Hinweis
    # Error scenario: Dienst ist nicht erreichbar
    Given der Dienst zur Vorschlagserstellung ist voruebergehend nicht verfuegbar
    When der Nutzer das Antwortfeld fokussiert
    Then es erscheint eine neutrale Hinweisnachricht
    And die normale manuelle Antwortfunktion bleibt nutzbar

  @@regression @@data-driven
  Scenario Outline: Antwortvorschlaege fuer verschiedene Nachrichtentypen
    # Scenario outline: unterschiedliche Nachrichtentypen erzeugen relevante Vorschlaege
    Given die Nachricht entspricht dem Typ <message_type>
    When der Nutzer das Antwortfeld fokussiert
    Then mindestens ein relevanter Antwortvorschlag wird innerhalb von 2 Sekunden angezeigt

    Examples:
      | message_type |
      | Lieferverzoegerung |
      | Rueckgabefrage |
      | Rechnungsanfrage |

  @@regression @@boundary
  Scenario Outline: Zeitliche Grenze fuer Anzeige der Vorschlaege
    # Boundary condition: Anzeigezeit bei Grenzwert
    When der Nutzer das Antwortfeld fokussiert
    Then die Vorschlaege erscheinen spaetestens nach <seconds> Sekunden

    Examples:
      | seconds |
      | 2 |
