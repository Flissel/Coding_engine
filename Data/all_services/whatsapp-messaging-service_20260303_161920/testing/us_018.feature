@@smoke @@regression
Feature: Verschwindende Nachrichten
  As a registrierter Nutzer
  I want to eine Nachricht mit einer festgelegten Selbstloeschungszeit senden
  So that damit vertrauliche Inhalte automatisch entfernt werden und der Datenschutz erhoeht wird

  Background:
    Given der Nutzer ist registriert und angemeldet
    And der Empfaenger ist ein registrierter Nutzer

  @@smoke @@regression @@happy-path
  Scenario: Nachricht mit gueltiger Selbstloeschungszeit wird zugestellt und automatisch entfernt
    # Happy path fuer das Senden und automatisches Entfernen nach Ablauf
    Given der Nutzer erstellt eine neue Nachricht mit Inhalt
    When er waehlt eine gueltige Selbstloeschungszeit von 10 Minuten und sendet die Nachricht
    Then die Nachricht wird dem Empfaenger zugestellt
    And nach Ablauf von 10 Minuten ist die Nachricht fuer Sender und Empfaenger nicht mehr sichtbar und nicht mehr abrufbar

  @@regression @@happy-path
  Scenario Outline: Nachricht wird nach Ablauf verschiedener gueltiger Zeiten entfernt
    # Datengetriebener Test fuer mehrere gueltige Selbstloeschungszeiten
    Given der Nutzer erstellt eine neue Nachricht mit Inhalt
    When er waehlt die Selbstloeschungszeit <selbstloeschungszeit> und sendet die Nachricht
    Then die Nachricht wird zugestellt
    And nach Ablauf der Zeit <selbstloeschungszeit> ist die Nachricht fuer Sender und Empfaenger nicht mehr sichtbar und nicht mehr abrufbar

    Examples:
      | selbstloeschungszeit |
      | 1 Minute |
      | 1 Stunde |
      | 24 Stunden |

  @@regression @@edge @@boundary
  Scenario Outline: Grenzwerte fuer minimale und maximale Selbstloeschungszeit
    # Boundary test fuer erlaubte Minimal- und Maximalwerte
    Given der Nutzer erstellt eine neue Nachricht mit Inhalt
    When er waehlt die Grenzzeit <grenzzeit> und sendet die Nachricht
    Then die Nachricht wird zugestellt
    And nach Ablauf der Zeit <grenzzeit> ist die Nachricht fuer Sender und Empfaenger nicht mehr sichtbar und nicht mehr abrufbar

    Examples:
      | grenzzeit |
      | 1 Minute (Minimum) |
      | 30 Tage (Maximum) |

  @@regression @@negative @@error
  Scenario Outline: Ungueltige Selbstloeschungszeit verhindert das Senden
    # Fehlerfall fuer nicht unterstuetzte oder ungueltige Zeiten
    Given der Nutzer erstellt eine neue Nachricht mit Inhalt
    When er waehlt die ungueltige Selbstloeschungszeit <ungueltige_zeit> und versucht zu senden
    Then das System zeigt eine Fehlermeldung zur ungueltigen Selbstloeschungszeit
    And die Nachricht wird nicht gesendet

    Examples:
      | ungueltige_zeit |
      | 0 Minuten |
      | -5 Minuten |
      | 999 Tage |
      | nicht numerischer Wert |
