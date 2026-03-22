@smoke @regression
Feature: Sicherheitscode-Verifizierung
  As a Endnutzer
  I want to einen Sicherheitscode manuell verifizieren
  So that die Ende-zu-Ende-Verschluesselung nachvollziehen und Vertrauen in die Nachrichtensicherheit gewinnen

  Background:
    Given eine bestehende Unterhaltung ist geoeffnet und der aktuelle Sicherheitscode ist sichtbar

  @@smoke @@regression @@happy-path
  Scenario: Erfolgreiche manuelle Verifizierung des Sicherheitscodes
    # Happy path: Der Nutzer gleicht den Code ab und bestaetigt erfolgreich
    Given der Sicherheitscode des Kommunikationspartners liegt zum Vergleich vor
    When der Endnutzer den Sicherheitscode manuell abgleicht und als bestaetigt markiert
    Then zeigt das System den Verifizierungsstatus als erfolgreich an
    And die Unterhaltung wird als verifiziert gekennzeichnet

  @@regression @@edge
  Scenario: Erneute Verifizierung nach geaendertem Sicherheitscode
    # Edge case: Sicherheitscode aendert sich und erfordert neue Bestaetigung
    Given der Sicherheitscode der Unterhaltung hat sich seit der letzten Verifizierung geaendert
    When der Endnutzer die Verifizierung erneut startet
    Then fordert das System eine erneute manuelle Bestaetigung des neuen Sicherheitscodes an
    And der vorherige Verifizierungsstatus wird als nicht mehr gueltig angezeigt

  @@regression @@negative
  Scenario: Warnung bei nicht uebereinstimmendem Sicherheitscode
    # Error scenario: Verifizierung wird abgeschlossen, obwohl Codes nicht uebereinstimmen
    Given der Endnutzer vergleicht einen Sicherheitscode, der nicht mit dem des Partners uebereinstimmt
    When er die Verifizierung abschliesst
    Then zeigt das System eine Warnung an
    And markiert die Verifizierung als fehlgeschlagen

  @@regression @@boundary
  Scenario Outline: Scenario Outline: Verifizierungsstatus fuer unterschiedliche Code-Zustaende
    # Boundary conditions: Statusanzeige fuer aktuelle und geaenderte Codes
    Given der Sicherheitscode-Status ist <code_status>
    When der Endnutzer die manuelle Verifizierung startet
    Then zeigt das System die Aufforderung <expected_prompt>
    And setzt das System den Verifizierungsstatus auf <expected_status>

    Examples:
      | code_status | expected_prompt | expected_status |
      | aktuell und noch nicht verifiziert | manuelle Bestaetigung erforderlich | ausstehend |
      | geaendert seit letzter Verifizierung | erneute manuelle Bestaetigung erforderlich | ausstehend |

  @@regression @@data-driven
  Scenario Outline: Scenario Outline: Abschluss der Verifizierung bei Code-Abgleich
    # Data-driven Happy/Negative: Ergebnis je nach Uebereinstimmung
    Given der Endnutzer hat den Sicherheitscode <match_state> mit dem Partnercode
    When der Endnutzer die Verifizierung abschliesst
    Then zeigt das System den Verifizierungsstatus als <expected_status>
    And zeigt das System <expected_message>

    Examples:
      | match_state | expected_status | expected_message |
      | abgeglichen und uebereinstimmend | erfolgreich | keine Warnung |
      | abgeglichen und nicht uebereinstimmend | fehlgeschlagen | Warnung |
