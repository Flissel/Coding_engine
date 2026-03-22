@@smoke @@regression
Feature: Passkey-Anmeldung
  As a registrierter Nutzer
  I want to mich mit einem Passkey anmelden
  So that um mich schnell, sicher und ohne Passwort auf allen Plattformen einzuloggen

  Background:
    Given der Nutzer befindet sich auf der Login-Seite

  @@smoke @@regression @@happy-path
  Scenario: Erfolgreiche Passkey-Anmeldung mit eingerichtetem Passkey
    # Prueft die erfolgreiche Anmeldung und Sitzungserstellung mit bestaetigtem Passkey
    Given der Nutzer hat auf seinem Geraet einen Passkey fuer das Konto eingerichtet
    When er die Passkey-Anmeldung startet und den Passkey bestaetigt
    Then wird der Nutzer erfolgreich eingeloggt
    And es wird eine Sitzung erstellt

  @@regression @@edge
  Scenario: Hinweis bei fehlendem Passkey und alternativer Login
    # Prueft die Anzeige einer Hinweismeldung und das Angebot eines alternativen Logins
    Given der Nutzer hat keinen Passkey fuer das Konto eingerichtet
    When er die Passkey-Anmeldung auswaehlt
    Then wird eine verstaendliche Hinweismeldung angezeigt
    And ein alternativer Login wird angeboten

  @@regression @@negative @@error
  Scenario: Passkey-Authentifizierung schlaegt fehl oder wird abgebrochen
    # Prueft Fehlermeldung und dass keine Sitzung erstellt wird
    Given der Nutzer hat einen Passkey fuer das Konto eingerichtet
    When die Passkey-Authentifizierung fehlschlaegt oder abgebrochen wird
    Then wird keine Sitzung erstellt
    And der Nutzer erhaelt eine klare Fehlermeldung mit erneuter Versuchsmoeglichkeit

  @@regression @@edge
  Scenario Outline: Passkey-Anmeldung auf verschiedenen Plattformen
    # Prueft die Anmeldung mit gueltigem Passkey auf mehreren Plattformen
    Given der Nutzer hat einen Passkey fuer das Konto eingerichtet
    When er die Passkey-Anmeldung auf <plattform> startet und den Passkey bestaetigt
    Then wird der Nutzer erfolgreich eingeloggt
    And es wird eine Sitzung erstellt

    Examples:
      | plattform |
      | iOS |
      | Android |
      | Windows |
      | macOS |

  @@regression @@negative @@boundary
  Scenario Outline: Boundary: Passkey-Anmeldung mit leerem oder abgelaufenem Challenge
    # Prueft, dass keine Sitzung erstellt wird, wenn der WebAuthn-Challenge-Status ungueltig ist
    Given der Nutzer hat einen Passkey fuer das Konto eingerichtet
    And die Passkey-Challenge ist <challenge_status>
    When er die Passkey-Anmeldung startet und den Passkey bestaetigt
    Then wird keine Sitzung erstellt
    And der Nutzer erhaelt eine klare Fehlermeldung mit erneuter Versuchsmoeglichkeit

    Examples:
      | challenge_status |
      | leer |
      | abgelaufen |
