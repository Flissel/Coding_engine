@@smoke @@regression
Feature: Telefonnummer-Registrierung
  As a Endnutzer
  I want to mich mit meiner Telefonnummer registrieren und verifizieren
  So that damit ich schnell und sicher Zugriff auf den Dienst erhalte

  Background:
    Given der Endnutzer befindet sich auf der Registrierungsseite

  @@smoke @@regression @@happy-path
  Scenario: Erfolgreiche Registrierung und Verifizierung mit gueltiger Telefonnummer
    # Happy path: Konto wird erstellt und Telefonnummer verifiziert
    Given der Endnutzer ist nicht registriert
    When er gibt eine gueltige Telefonnummer ein und startet die Registrierung
    And er gibt den erhaltenen Verifizierungscode korrekt ein
    Then wird das Konto erfolgreich erstellt
    And die Telefonnummer wird als verifiziert markiert

  @@regression @@negative
  Scenario: Registrierung mit ungueltigem Telefonnummernformat
    # Error scenario: klare Fehlermeldung und keine Fortsetzung
    Given der Endnutzer ist nicht registriert
    When er sendet die Registrierung mit einer Telefonnummer in ungueltigem Format ab
    Then erhaelt er eine klare Fehlermeldung zum Format
    And die Registrierung wird nicht fortgesetzt

  @@regression @@negative
  Scenario: Verifizierung mit falschem oder abgelaufenem Code
    # Error scenario: Verifizierung wird abgelehnt und neuer Code kann angefordert werden
    Given der Endnutzer hat einen Verifizierungscode erhalten
    When er gibt einen falschen oder abgelaufenen Code ein
    Then wird die Verifizierung abgelehnt
    And er kann einen neuen Code anfordern

  @@regression @@negative @@edge
  Scenario Outline: Telefonnummernformat-Validierung als Scenario Outline
    # Edge cases und Boundary Conditions fuer Telefonnummernformat
    Given der Endnutzer ist nicht registriert
    When er sendet die Registrierung mit der Telefonnummer <phone>
    Then erhaelt er die Fehlermeldung <error_message>
    And die Registrierung wird nicht fortgesetzt

    Examples:
      | phone | error_message |
      | 12345 | Telefonnummer zu kurz |
      | +491234567890123456789 | Telefonnummer zu lang |
      | 0049-ABC-123 | Telefonnummer enthaelt ungueltige Zeichen |
      |  | Telefonnummer ist erforderlich |

  @@regression @@negative @@boundary
  Scenario Outline: Verifizierungscode-Gueltigkeit als Scenario Outline
    # Boundary conditions fuer Verifizierungscode
    Given der Endnutzer hat einen Verifizierungscode erhalten
    When er gibt den Code <code> nach <minutes_passed> Minuten ein
    Then ist das Ergebnis der Verifizierung <verification_result>
    And der Status ist <status_message>

    Examples:
      | code | minutes_passed | verification_result | status_message |
      | 123456 | 4 | erfolgreich | Telefonnummer verifiziert |
      | 123456 | 10 | abgelehnt | Code abgelaufen |
      | 000000 | 2 | abgelehnt | Code falsch |
