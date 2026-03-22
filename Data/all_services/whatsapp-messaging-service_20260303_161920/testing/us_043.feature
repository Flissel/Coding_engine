@smoke @regression
Feature: Status anzeigen
  As a Endnutzer
  I want to den Status eines Kontakts anzeigen
  So that den Erreichbarkeitszustand schnell zu erkennen und die Kommunikation effizient zu planen

  Background:
    Given der Endnutzer ist angemeldet und die Kontaktliste ist geladen

  @@smoke @@regression @@happy-path
  Scenario: Aktuellen Status beim Oeffnen eines Kontakts anzeigen
    # Happy Path: Ein gueltiger Kontakt-Status wird klar angezeigt
    Given der Kontakt hat einen verfuegbaren Status
    When der Endnutzer den Kontakt in der Liste oeffnet
    Then zeigt das System den aktuellen Kontakt-Status klar und eindeutig an
    And der Statusindikator entspricht dem Status des Kontakts

  @@regression @@edge-case
  Scenario: Statusindikator fuer fehlenden Status anzeigen
    # Edge Case: Kontakt ohne verfuegbaren oder freigegebenen Status
    Given der Kontakt hat keinen verfuegbaren oder freigegebenen Status
    When der Endnutzer den Kontakt im Chat oeffnet
    Then zeigt das System einen neutralen Statusindikator oder den Hinweis 'Status nicht verfuegbar' an
    And es wird kein veralteter Status angezeigt

  @@regression @@negative @@error
  Scenario: Fehler bei nicht erreichbarem Statusdienst behandeln
    # Error Scenario: Kein Netzwerk oder Statusdienst nicht erreichbar
    Given es besteht keine Netzwerkverbindung oder der Statusdienst ist nicht erreichbar
    When der Endnutzer den Kontakt-Status anfordert
    Then informiert das System den Endnutzer ueber den Fehler
    And das System behaelt den zuletzt bekannten Status bei

  @@regression @@boundary @@data-driven
  Scenario Outline: Statusanzeige fuer verschiedene gueltige Statuswerte
    # Boundary: Unterstuetzte Statuswerte werden korrekt angezeigt
    Given der Kontakt hat den Status <status>
    When der Endnutzer den Kontakt oeffnet
    Then zeigt das System den Statusindikator fuer <status> klar und eindeutig an
    And der Statusindikator ist konsistent in Liste und Chat

    Examples:
      | status |
      | verfuegbar |
      | beschaeftigt |
      | abwesend |
      | offline |

  @@regression @@boundary @@negative
  Scenario: Status bleibt bei kurzzeitigem Verbindungsverlust erhalten
    # Boundary/Edge: Letztbekannter Status bleibt erhalten bei transienten Fehlern
    Given der Kontakt hat einen zuletzt bekannten Status 'verfuegbar'
    And die Netzwerkverbindung faellt kurzzeitig aus
    When der Endnutzer den Kontakt erneut oeffnet
    Then zeigt das System den zuletzt bekannten Status 'verfuegbar' an
    And das System informiert den Endnutzer ueber den Verbindungsfehler
