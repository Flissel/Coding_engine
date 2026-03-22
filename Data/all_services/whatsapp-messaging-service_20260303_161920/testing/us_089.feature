@smoke @regression
Feature: Sprachauswahl und Persistenz
  As a registrierter Nutzer
  I want to die Anwendungssprache auswählen und jederzeit ändern
  So that die Anwendung intuitiv in meiner bevorzugten Sprache nutzen zu können

  Background:
    Given der Nutzer ist angemeldet
    And die Anwendung unterstützt mehrere Sprachen

  @smoke @regression @happy-path
  Scenario Outline: Sprache wechseln zeigt vollständige Übersetzung
    # Happy path: UI wird vollständig in der gewählten Sprache angezeigt
    Given der Nutzer befindet sich in den Spracheinstellungen
    When der Nutzer die Sprache "<language>" auswählt
    Then die Benutzeroberfläche wird vollständig in "<language>" angezeigt
    And alle Navigations- und Systemtexte sind in "<language>" übersetzt

    Examples:
      | language |
      | Deutsch |
      | Englisch |
      | Französisch |

  @regression @happy-path
  Scenario Outline: Zuletzt gewählte Sprache bleibt nach Neustart erhalten
    # Happy path: Sprache wird über Sitzungen hinweg gespeichert
    Given der Nutzer hat die Sprache "<language>" ausgewählt
    When der Nutzer die Anwendung neu lädt oder später erneut öffnet
    Then die Anwendung wird in "<language>" angezeigt
    And die gespeicherte Spracheinstellung ist weiterhin "<language>"

    Examples:
      | language |
      | Deutsch |
      | Englisch |

  @regression @negative
  Scenario Outline: Nicht unterstützte Sprache wird abgewiesen
    # Error scenario: nicht verfügbare Sprache führt zu Fehlermeldung und kein Wechsel
    Given die aktuelle Sprache ist "<current_language>"
    When der Nutzer versucht die nicht unterstützte Sprache "<unsupported_language>" zu aktivieren
    Then das System zeigt eine verständliche Fehlermeldung
    And die Anwendung bleibt in "<current_language>"

    Examples:
      | current_language | unsupported_language |
      | Deutsch | Klingonisch |
      | Englisch | Elbisch |

  @regression @edge
  Scenario Outline: Auswahl der bereits aktiven Sprache
    # Edge case: erneute Auswahl der aktuellen Sprache ändert nichts
    Given die aktuelle Sprache ist "<current_language>"
    When der Nutzer erneut "<current_language>" auswählt
    Then die Benutzeroberfläche bleibt in "<current_language>"
    And es wird keine Fehlermeldung angezeigt

    Examples:
      | current_language |
      | Deutsch |
      | Englisch |

  @regression @boundary
  Scenario Outline: Nur eine verfügbare Sprache
    # Boundary condition: Anwendung unterstützt genau eine Sprache
    Given die Anwendung unterstützt nur die Sprache "<only_language>"
    When der Nutzer die Spracheinstellungen öffnet
    Then nur "<only_language>" wird als auswählbar angezeigt
    And die Benutzeroberfläche bleibt in "<only_language>"

    Examples:
      | only_language |
      | Deutsch |
