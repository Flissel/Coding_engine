@smoke @regression
Feature: Info-Sichtbarkeit in Datenschutzeinstellungen
  As a registrierter Nutzer
  I want to die Sichtbarkeit von Info- und Status-Texten in den Einstellungen konfigurieren
  So that die eigene Privatsphäre zu schützen und die Kommunikation passend zu steuern

  Background:
    Given der Nutzer ist angemeldet und befindet sich in den Datenschutzeinstellungen

  @@smoke @@regression @@happy-path
  Scenario: Sichtbarkeit auf „Nur Kontakte“ speichern
    # Happy path: Sichtbarkeit wird korrekt gespeichert und wirkt nur für Kontakte
    When der Nutzer die Sichtbarkeit für Info- und Status-Texte auf „Nur Kontakte“ setzt und speichert
    Then sind Info- und Status-Texte nur für seine Kontakte sichtbar
    And die Auswahl ist dauerhaft gespeichert

  @@regression @@happy-path
  Scenario: Sichtbarkeit auf „Niemand“ speichern
    # Happy path: Sichtbarkeit ist für andere Nutzer deaktiviert
    When der Nutzer die Sichtbarkeit auf „Niemand“ setzt und speichert
    Then sind Info- und Status-Texte für andere Nutzer nicht sichtbar
    And die Auswahl ist dauerhaft gespeichert

  @@regression @@negative @@error
  Scenario: Systemfehler beim Speichern der Sichtbarkeit
    # Error scenario: Speichern schlägt fehl und vorherige Einstellung bleibt
    Given die aktuelle Sichtbarkeit ist auf „Nur Kontakte“ gesetzt
    When der Nutzer die Sichtbarkeit auf „Niemand“ setzt und der Speichervorgang fehlschlägt
    Then wird eine Fehlermeldung angezeigt
    And die vorherige Einstellung bleibt unverändert

  @@regression @@edge-case
  Scenario Outline: Sichtbarkeitseinstellungen als Scenario Outline
    # Edge cases: valide Auswahlwerte werden korrekt gespeichert
    When der Nutzer die Sichtbarkeit auf „<sichtbarkeit>“ setzt und speichert
    Then ist die Sichtbarkeit der Info- und Status-Texte auf „<erwartung>“ gesetzt
    And die Auswahl ist dauerhaft gespeichert

    Examples:
      | sichtbarkeit | erwartung |
      | Nur Kontakte | nur Kontakte |
      | Niemand | niemand |

  @@regression @@boundary
  Scenario: Boundary: Speicherung ohne Änderung der Einstellung
    # Boundary condition: Speichern ohne Änderung verändert den Status nicht
    Given die aktuelle Sichtbarkeit ist auf „Nur Kontakte“ gesetzt
    When der Nutzer ohne Änderung der Auswahl speichert
    Then bleibt die Sichtbarkeit auf „Nur Kontakte“
    And es wird kein Fehler angezeigt
