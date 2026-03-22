@@smoke @@regression
Feature: Status erstellen
  As a Endnutzer
  I want to einen 24-Stunden-Status erstellen und veröffentlichen
  So that aktuelle Informationen schnell und zuverlässig mit Kontakten zu teilen

  Background:
    Given der Nutzer ist angemeldet
    And der Nutzer hat eine gültige Internetverbindung

  @@smoke @@regression @@happy-path
  Scenario Outline: Erfolgreiche Veröffentlichung eines neuen Status
    # Happy path: Status wird gespeichert und 24 Stunden sichtbar
    When der Nutzer erstellt einen neuen Status mit Inhalt "<content>"
    And der Nutzer tippt auf „Veröffentlichen“
    Then der Status wird gespeichert
    And der Status ist für Kontakte 24 Stunden sichtbar

    Examples:
      | content |
      | Hallo Kontakte! |
      | Status mit Emoji 🙂 |

  @@regression @@negative @@edge-case
  Scenario Outline: Veröffentlichung wird ohne Inhalt verhindert
    # Edge case: leere Inhalte dürfen nicht veröffentlicht werden
    When der Nutzer erstellt einen neuen Status mit Inhalt "<content>"
    And der Nutzer tippt auf „Veröffentlichen“
    Then das System verhindert die Veröffentlichung
    And eine verständliche Fehlermeldung wird angezeigt

    Examples:
      | content |
      |  |
      |     |

  @@regression @@negative @@error
  Scenario: Internetverbindung bricht während der Veröffentlichung ab
    # Error scenario: Veröffentlichung schlägt fehl und Wiederholen ist möglich
    Given die Internetverbindung wird während der Veröffentlichung unterbrochen
    When der Nutzer tippt auf „Veröffentlichen“
    Then das System zeigt einen Fehler an
    And das System bietet die Möglichkeit, den Vorgang zu wiederholen

  @@regression @@boundary
  Scenario Outline: Grenzwerte für Inhaltslänge
    # Boundary conditions: minimale und maximale erlaubte Inhaltslänge
    When der Nutzer erstellt einen neuen Status mit Inhalt "<content>"
    And der Nutzer tippt auf „Veröffentlichen“
    Then der Status wird gemäß den Längenregeln verarbeitet
    And das System zeigt eine passende Rückmeldung

    Examples:
      | content |
      | A |
      | <MAX_LENGTH_CONTENT> |
      | <MAX_LENGTH_PLUS_ONE_CONTENT> |
