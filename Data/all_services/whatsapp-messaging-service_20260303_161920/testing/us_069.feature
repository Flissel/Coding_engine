@@smoke @@regression
Feature: Reaktionsbenachrichtigungen
  As a registrierter Nutzer
  I want to Benachrichtigungen über Reaktionen auf meine eigenen Nachrichten erhalten
  So that damit ich schnell auf Feedback reagieren kann und die Kommunikation effizient bleibt

  Background:
    Given ein registrierter Nutzer ist angemeldet und befindet sich in einem Chat

  @@happy-path @@smoke @@regression
  Scenario: Echtzeit-Benachrichtigung bei unterstützter Reaktion
    # Happy path: Benachrichtigung wird in Echtzeit mit allen erforderlichen Details gesendet
    Given der Nutzer hat eine eigene Nachricht im Chat gesendet
    And Benachrichtigungen für Reaktionen sind in den Einstellungen aktiviert
    When ein anderer Nutzer reagiert mit einer unterstützten Reaktion auf diese Nachricht
    Then der Nutzer erhält eine Reaktionsbenachrichtigung in Echtzeit
    And die Benachrichtigung enthält Absender, Nachrichtenvorschau und Reaktion

  @@edge @@regression
  Scenario: Keine Benachrichtigung bei deaktivierten Reaktionsbenachrichtigungen
    # Edge case: Einstellungen verhindern die Zustellung
    Given der Nutzer hat eine eigene Nachricht im Chat gesendet
    And Benachrichtigungen für Reaktionen sind in den Einstellungen deaktiviert
    When ein anderer Nutzer reagiert auf diese Nachricht
    Then es wird keine Reaktionsbenachrichtigung an den Nutzer gesendet

  @@negative @@regression
  Scenario: Zwischenspeicherung bei gestörter Zustellung und spätere Zustellung
    # Error scenario: Benachrichtigung wird gepuffert und später zugestellt
    Given der Nutzer hat eine eigene Nachricht im Chat gesendet
    And Benachrichtigungen für Reaktionen sind aktiviert
    And die Benachrichtigungszustellung ist vorübergehend gestört
    When ein anderer Nutzer reagiert auf diese Nachricht
    Then die Reaktionsbenachrichtigung wird zwischengespeichert
    And die Benachrichtigung wird zugestellt, sobald die Verbindung wiederhergestellt ist

  @@regression
  Scenario Outline: Unterstützte Reaktionen senden Benachrichtigungen in Echtzeit
    # Boundary condition: alle unterstützten Reaktionen werden akzeptiert
    Given der Nutzer hat eine eigene Nachricht im Chat gesendet
    And Benachrichtigungen für Reaktionen sind aktiviert
    When ein anderer Nutzer reagiert mit einer unterstützten Reaktion <reaction>
    Then der Nutzer erhält eine Reaktionsbenachrichtigung mit der Reaktion <reaction>

    Examples:
      | reaction |
      | 👍 |
      | ❤️ |
      | 😂 |

  @@negative @@regression
  Scenario Outline: Nicht unterstützte Reaktionen erzeugen keine Benachrichtigung
    # Error/edge: ungültige Reaktion wird ignoriert
    Given der Nutzer hat eine eigene Nachricht im Chat gesendet
    And Benachrichtigungen für Reaktionen sind aktiviert
    When ein anderer Nutzer reagiert mit einer nicht unterstützten Reaktion <reaction>
    Then es wird keine Reaktionsbenachrichtigung gesendet

    Examples:
      | reaction |
      | unsupported_emoji |
      | custom_reaction_code |
