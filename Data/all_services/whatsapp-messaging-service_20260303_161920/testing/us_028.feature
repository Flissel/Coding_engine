@@smoke @@regression
Feature: Gruppeneinstellungen verwalten
  As a Gruppenadministrator
  I want to Gruppeneinstellungen konfigurieren und speichern
  So that um die Nutzung der Gruppe sicher, effizient und an die Bedürfnisse der Mitglieder angepasst zu gestalten

  Background:
    Given der Gruppenadministrator ist angemeldet
    And er befindet sich in der Gruppenverwaltung

  @@smoke @@regression @@happy-path
  Scenario: Erfolgreiches Speichern erlaubter Gruppeneinstellungen
    # Happy Path: gültige Einstellungen werden gespeichert und sofort angewendet
    When der Gruppenadministrator ändert erlaubte Gruppeneinstellungen
    And er speichert die Gruppeneinstellungen
    Then werden die neuen Gruppeneinstellungen gespeichert
    And die Änderungen werden sofort angewendet

  @@regression @@happy-path
  Scenario: Sicherheitsrelevante restriktive Option aktiviert
    # Happy Path: restriktive Option schränkt Zugriffsrechte ein und wird protokolliert
    Given die Gruppeneinstellungen enthalten sicherheitsrelevante Optionen
    When der Gruppenadministrator aktiviert eine restriktive Option
    Then werden die Zugriffsrechte entsprechend eingeschränkt
    And die Änderung wird im System protokolliert

  @@regression @@negative
  Scenario: Ungültige Eingaben in Pflichtfeldern verhindern das Speichern
    # Error Scenario: Pflichtfelder leer oder ungültig
    Given der Gruppenadministrator bearbeitet die Gruppeneinstellungen
    When er Pflichtfelder leer lässt oder ungültige Werte eingibt
    And er versucht die Gruppeneinstellungen zu speichern
    Then zeigt das System eine verständliche Fehlermeldung an
    And das Speichern wird verhindert

  @@regression @@boundary @@negative
  Scenario Outline: Grenzwerte für numerische Einstellungen
    # Boundary Conditions: numerische Limits werden validiert
    Given der Gruppenadministrator bearbeitet eine numerische Einstellung mit Grenzen
    When er den Wert <wert> eingibt
    And er die Gruppeneinstellungen speichert
    Then ist das Ergebnis <ergebnis>
    And wird die Meldung <meldung> angezeigt

    Examples:
      | wert | ergebnis | meldung |
      | 0 | erfolgreich gespeichert | keine |
      | 1 | erfolgreich gespeichert | keine |
      | 100 | erfolgreich gespeichert | keine |
      | 101 | nicht gespeichert | Wert liegt außerhalb des erlaubten Bereichs |

  @@regression @@edge
  Scenario: Edge Case: Keine Änderungen vor dem Speichern
    # Edge Case: Speichern ohne Änderungen führt zu keiner Aktualisierung
    Given die aktuellen Gruppeneinstellungen sind geladen
    When der Gruppenadministrator keine Änderungen vornimmt
    And er die Gruppeneinstellungen speichert
    Then bleiben die Gruppeneinstellungen unverändert
    And es wird keine neue Protokollierung erstellt
