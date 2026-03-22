@@smoke @@regression
Feature: Reaktionen
  As a Primärnutzer
  I want to auf Nachrichten mit Emoji reagieren
  So that um schnell und intuitiv Rückmeldung zu geben und die Kommunikation zu beschleunigen

  Background:
    Given ein aktiver Chat mit mindestens zwei Teilnehmern ist geöffnet
    And es existiert mindestens eine gesendete oder empfangene Nachricht im Chat

  @@smoke @@regression @@happy-path
  Scenario: Emoji-Reaktion wird erfolgreich hinzugefügt und synchronisiert
    # Happy path: Nutzer wählt eine unterstützte Emoji-Reaktion und alle Teilnehmer sehen sie
    Given die Nachricht hat noch keine Reaktion vom Nutzer
    When der Nutzer eine unterstützte Emoji-Reaktion auswählt und bestätigt
    Then die Reaktion wird an der Nachricht angezeigt
    And die Reaktion wird an alle Chatteilnehmer synchronisiert

  @@regression @@edge
  Scenario: Vorherige Emoji-Reaktion wird durch eine neue ersetzt
    # Edge case: Nutzer ersetzt seine bestehende Reaktion durch eine andere
    Given die Nachricht hat bereits eine Emoji-Reaktion vom Nutzer
    When der Nutzer eine andere unterstützte Emoji-Reaktion auswählt und bestätigt
    Then die vorherige Reaktion des Nutzers wird entfernt
    And die neue Reaktion wird angezeigt und für alle Teilnehmer aktualisiert

  @@regression @@negative
  Scenario: Ungültige Emoji-Reaktion wird abgewiesen
    # Error scenario: System lehnt nicht unterstützte Emojis ab
    Given der Nutzer versucht eine nicht unterstützte Emoji-Reaktion zu senden
    When der Nutzer die Reaktion bestätigt
    Then das System weist die Reaktion zurück
    And eine verständliche Fehlermeldung wird angezeigt

  @@regression @@boundary
  Scenario Outline: Mehrere unterstützte Emojis können verwendet werden
    # Boundary condition: Prüft die zulässige Emoji-Auswahl mit mehreren Eingaben
    Given die Nachricht ist sichtbar und der Nutzer kann reagieren
    When der Nutzer eine Emoji-Reaktion auswählt
    Then die ausgewählte Reaktion wird angezeigt und synchronisiert

    Examples:
      | emoji |
      | 👍 |
      | ❤️ |
      | 😂 |

  @@regression @@edge
  Scenario Outline: Ersetzen der Reaktion mit datengetriebenen Emojis
    # Scenario outline: Nutzer ersetzt Reaktion durch verschiedene Emojis
    Given die Nachricht hat bereits eine Reaktion vom Nutzer
    When der Nutzer die Emoji-Reaktion <neue_emoji> auswählt und bestätigt
    Then die vorherige Reaktion wird ersetzt und aktualisiert

    Examples:
      | neue_emoji |
      | 😮 |
      | 🎉 |

  @@regression @@negative
  Scenario Outline: Nicht unterstützte Emoji-Varianten werden abgelehnt
    # Scenario outline: verschiedene ungültige Emojis führen zu Fehler
    Given der Nutzer hat eine Nachricht ausgewählt
    When der Nutzer eine ungültige Emoji-Reaktion <ungueltig> sendet
    Then die Reaktion wird abgelehnt und eine Fehlermeldung angezeigt

    Examples:
      | ungueltig |
      | unsupported_emoji_code |
      |  |
