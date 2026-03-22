@@smoke @@regression
Feature: WhatsApp Pay In-App-Zahlung
  As a Privatnutzer
  I want to eine In-App-Zahlung über WhatsApp Pay durchführen
  So that damit ich schnell und sicher bezahlen kann, ohne die App zu verlassen

  Background:
    Given der Nutzer ist bei WhatsApp angemeldet

  @@smoke @@regression @@happy-path
  Scenario: Erfolgreiche Zahlung im unterstützten Markt
    # Prüft die erfolgreiche Verarbeitung einer Zahlung und Bestätigung im Chat
    Given der Nutzer befindet sich in einem unterstützten Markt
    And der Nutzer hat eine gültige Zahlungsmethode hinterlegt
    When er initiiert eine Zahlung im Chat über WhatsApp Pay
    And er bestätigt die Zahlung
    Then die Zahlung wird erfolgreich verarbeitet
    And im Chat wird eine Bestätigung angezeigt

  @@regression @@negative
  Scenario: Dienst in nicht unterstütztem Markt
    # Prüft die Meldung bei Versuch WhatsApp Pay in einem nicht unterstützten Markt zu öffnen
    Given der Nutzer befindet sich in einem nicht unterstützten Markt
    When er versucht WhatsApp Pay zu öffnen
    Then es wird eine verständliche Meldung angezeigt, dass der Dienst in diesem Markt nicht verfügbar ist

  @@regression @@negative @@error
  Scenario: Zahlung vom Zahlungsanbieter abgelehnt
    # Prüft den Abbruch und die Fehlermeldung bei Ablehnung durch den Zahlungsanbieter
    Given der Nutzer hat eine gültige Zahlungsmethode hinterlegt
    And der Zahlungsanbieter lehnt die Zahlung ab
    When er bestätigt die Zahlung
    Then die Zahlung wird abgebrochen
    And eine Fehlermeldung mit Hinweis auf erneuten Versuch oder andere Zahlungsmethode wird angezeigt

  @@regression @@boundary @@outline
  Scenario Outline: Zahlung mit Grenzbetrag im unterstützten Markt
    # Prüft die Verarbeitung von Zahlungen an den Betragsgrenzen
    Given der Nutzer befindet sich in einem unterstützten Markt
    And der Nutzer hat eine gültige Zahlungsmethode hinterlegt
    When er initiiert eine Zahlung im Chat über WhatsApp Pay mit dem Betrag <amount>
    And er bestätigt die Zahlung
    Then die Zahlung wird gemäß den Betragsregeln verarbeitet
    And im Chat wird eine entsprechende Bestätigung oder Fehlermeldung angezeigt

    Examples:
      | amount | expected |
      | 0,01 | Bestätigung |
      | 1000,00 | Bestätigung |
      | 1000,01 | Fehlermeldung |
