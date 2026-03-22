@smoke @regression
Feature: Status stumm schalten
  As a registrierter Nutzer
  I want to den Status eines Kontakts stumm schalten
  So that Benachrichtigungen gezielt zu steuern und die Kommunikation übersichtlich zu halten

  Background:
    Given der Nutzer ist registriert und angemeldet

  @@smoke @@regression @@happy-path
  Scenario: Stummschalten eines aktiven Kontakts
    # Überprüft, dass ein aktiver Kontakt erfolgreich stumm geschaltet wird und der Status sichtbar gesetzt ist
    Given der Nutzer befindet sich in der Kontaktansicht eines aktiven Kontakts
    When er die Option "Status stumm schalten" auswählt
    Then werden Status-Benachrichtigungen dieses Kontakts nicht mehr angezeigt
    And der Stummschalt-Status ist sichtbar gesetzt

  @@regression @@edge
  Scenario: Kontakt ist bereits stumm geschaltet
    # Stellt sicher, dass das System einen bereits stumm geschalteten Kontakt erkennt und den Zustand nicht ändert
    Given ein Kontakt ist bereits stumm geschaltet
    When der Nutzer erneut "Status stumm schalten" auswählt
    Then zeigt das System an, dass der Kontakt bereits stumm geschaltet ist
    And der bestehende Stummschalt-Status bleibt unverändert

  @@regression @@negative
  Scenario: Fehler beim Speichern des Stummschalt-Status
    # Validiert, dass bei Netzwerk- oder Speicherausfällen eine Fehlermeldung angezeigt wird und der Status unverändert bleibt
    Given der Nutzer befindet sich in der Kontaktansicht eines aktiven Kontakts
    When er die Option "Status stumm schalten" auswählt und der Speichervorgang fehlschlägt
    Then erhält er eine Fehlermeldung
    And der Stummschalt-Status bleibt unverändert

  @@regression @@negative
  Scenario Outline: Datengetriebene Varianten der Netzwerkverfügbarkeit
    # Prüft unterschiedliche Fehlerursachen beim Stummschalten als Szenario-Outline
    Given der Nutzer befindet sich in der Kontaktansicht eines aktiven Kontakts
    When er die Option "Status stumm schalten" auswählt und <fehlerursache> auftritt
    Then erhält er eine Fehlermeldung
    And der Stummschalt-Status bleibt unverändert

    Examples:
      | fehlerursache |
      | die Netzwerkverbindung unterbrochen ist |
      | der Speichervorgang fehlschlägt |

  @@regression @@boundary
  Scenario: Boundary-Condition: Status-Benachrichtigungen erscheinen nicht mehr
    # Bestätigt, dass nach dem Stummschalten keine neuen Status-Benachrichtigungen des Kontakts angezeigt werden
    Given ein aktiver Kontakt ist stumm geschaltet
    When der Kontakt veröffentlicht einen neuen Status
    Then werden keine Status-Benachrichtigungen für diesen Kontakt angezeigt
    And der Stummschalt-Status bleibt sichtbar gesetzt
