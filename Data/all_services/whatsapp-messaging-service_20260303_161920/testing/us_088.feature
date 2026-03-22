@@smoke @@regression
Feature: Dark Mode
  As a Endnutzer
  I want to den Dark Mode in der App aktivieren und deaktivieren
  So that eine komfortable und augenschonende Nutzung bei wenig Licht sowie bessere Lesbarkeit zu erreichen

  Background:
    Given der Nutzer ist in der App angemeldet und befindet sich in den Einstellungen

  @@happy-path @@smoke @@regression
  Scenario: Dark Mode aktivieren
    # Prueft den erfolgreichen Wechsel in das dunkle Farbschema
    When der Nutzer aktiviert den Dark Mode
    Then wechselt die gesamte Benutzeroberflaeche sofort in das dunkle Farbschema
    And alle Texte und Icons bleiben lesbar und kontrastreich

  @@happy-path @@regression
  Scenario: Dark Mode bleibt nach App-Neustart aktiv
    # Prueft die Persistenz der Einstellung nach dem Schliessen der App
    Given der Dark Mode ist aktiviert
    When der Nutzer schliesst die App und oeffnet sie erneut
    Then bleibt der Dark Mode aktiv und die Einstellung ist gespeichert

  @@happy-path @@regression
  Scenario: Dark Mode deaktivieren
    # Prueft den Rueckwechsel in das helle Farbschema
    Given der Dark Mode ist aktiviert
    When der Nutzer deaktiviert den Dark Mode
    Then wechselt die Benutzeroberflaeche zurueck in das helle Farbschema ohne Darstellungsfehler

  @@edge @@regression
  Scenario: Schnelles Umschalten des Dark Mode
    # Edge Case: mehrfaches schnelles Aktivieren/Deaktivieren ohne UI-Fehler
    When der Nutzer schaltet den Dark Mode schnell mehrfach um
    Then bleibt die Benutzeroberflaeche stabil und konsistent im zuletzt gewaehlten Zustand
    And es treten keine Flackereffekte oder Darstellungsfehler auf

  @@negative @@regression
  Scenario: Persistenzfehler beim Speichern der Dark Mode Einstellung
    # Error Scenario: Speichern der Einstellung schlaegt fehl
    Given der Dark Mode ist aktiviert
    And das lokale Speichern der Einstellungen ist nicht verfuegbar
    When der Nutzer schliesst die App und oeffnet sie erneut
    Then wird der Nutzer informiert, dass die Einstellung nicht gespeichert werden konnte
    And laedt die App mit dem zuletzt gespeicherten Farbschema

  @@regression @@boundary
  Scenario Outline: Darstellungsqualitaet in verschiedenen Screens nach Umschalten
    # Boundary Condition: Prueft UI-Konsistenz auf kritischen Bildschirmen
    When der Nutzer aktiviert den Dark Mode
    And der Nutzer navigiert zu einem Screen
    Then ist der Screen vollstaendig im dunklen Farbschema dargestellt
    And sind alle interaktiven Elemente klar erkennbar

    Examples:
      | screen |
      | Startseite |
      | Profil |
      | Einstellungen |

  @@regression @@boundary
  Scenario Outline: Scenario Outline: Persistenz nach App-Neustart unter verschiedenen Zustandswechseln
    # Boundary Condition: prueft Persistenz nach Toggle-Sequenzen
    Given der Dark Mode ist initial <initial_state>
    When der Nutzer setzt den Dark Mode auf <final_state>
    And der Nutzer schliesst die App und oeffnet sie erneut
    Then ist der Dark Mode <final_state> und die Einstellung ist gespeichert

    Examples:
      | initial_state | final_state |
      | deaktiviert | aktiv |
      | aktiv | deaktiviert |
