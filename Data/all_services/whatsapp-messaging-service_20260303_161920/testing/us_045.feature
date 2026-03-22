@smoke @regression
Feature: Status-Datenschutz
  As a registrierter Nutzer
  I want to die Sichtbarkeit meines Status konfigurierbar einstellen
  So that meine Privatsphäre schützen und gleichzeitig eine einfache Bedienung beibehalten

  Background:
    Given der Nutzer ist angemeldet und befindet sich in den Datenschutzeinstellungen

  @@smoke @@regression @@happy-path
  Scenario Outline: Status-Sichtbarkeit erfolgreich speichern
    # Überprüft, dass die Sichtbarkeit korrekt gespeichert und angewendet wird
    When der Nutzer setzt die Status-Sichtbarkeit auf "<sichtbarkeit>" und speichert
    Then die Einstellung wird erfolgreich gespeichert
    And die Sichtbarkeit des Status entspricht "<erwartete_sichtbarkeit>"

    Examples:
      | sichtbarkeit | erwartete_sichtbarkeit |
      | Niemand | für andere Nutzer nicht sichtbar |
      | Nur Kontakte | ausschließlich für Kontakte sichtbar |

  @@regression @@edge
  Scenario Outline: Erneutes Speichern derselben Einstellung
    # Edge Case: Das Speichern der bereits gesetzten Sichtbarkeit erzeugt keine unerwarteten Änderungen
    Given die aktuelle Status-Sichtbarkeit ist bereits auf "<sichtbarkeit>" gesetzt
    When der Nutzer speichert die Status-Sichtbarkeit erneut
    Then die Einstellung bleibt auf "<sichtbarkeit>"
    And es wird keine zusätzliche Änderung am Status angezeigt

    Examples:
      | sichtbarkeit |
      | Niemand |
      | Nur Kontakte |

  @@regression @@negative
  Scenario Outline: Speichern ohne Netzwerkverbindung
    # Error Scenario: Speichern schlägt fehl und die vorherige Einstellung bleibt erhalten
    Given es besteht keine Netzwerkverbindung
    And die aktuelle Status-Sichtbarkeit ist auf "<vorherige_sichtbarkeit>" gesetzt
    When der Nutzer versucht die Status-Sichtbarkeit auf "<neue_sichtbarkeit>" zu setzen und zu speichern
    Then eine Fehlermeldung wird angezeigt
    And die Status-Sichtbarkeit bleibt auf "<vorherige_sichtbarkeit>"

    Examples:
      | vorherige_sichtbarkeit | neue_sichtbarkeit |
      | Nur Kontakte | Niemand |

  @@regression @@boundary
  Scenario Outline: Boundary: Wechsel der Sichtbarkeit direkt hintereinander
    # Boundary Condition: Mehrfache schnelle Änderungen speichern den zuletzt gewählten Wert
    When der Nutzer ändert die Sichtbarkeit in der Reihenfolge "<folge>" und speichert am Ende
    Then die gespeicherte Status-Sichtbarkeit ist "<erwartete_sichtbarkeit>"
    And nur die zuletzt gewählte Einstellung wird angewendet

    Examples:
      | folge | erwartete_sichtbarkeit |
      | Nur Kontakte, Niemand | Niemand |
      | Niemand, Nur Kontakte | Nur Kontakte |
