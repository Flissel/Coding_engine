@smoke @regression
Feature: Standort teilen im Chat
  As a registrierter Nutzer
  I want to einen aktuellen oder ausgewählten Standort in einem Chat teilen
  So that damit Empfänger den Ort zuverlässig finden und Absprachen schneller erfolgen

  Background:
    Given der Nutzer ist registriert, angemeldet und befindet sich in einem geöffneten Chat

  @happy-path @smoke @regression
  Scenario: Aktuellen Standort erfolgreich senden
    # Happy Path: Standort wird mit Kartenvorschau und Koordinaten gesendet
    Given die Standortfreigabe wurde erteilt
    When der Nutzer wählt „Standort teilen“ und sendet den aktuellen Standort
    Then der Empfänger erhält eine Nachricht mit Kartenvorschau
    And die Nachricht enthält die Koordinaten des gesendeten Standorts

  @happy-path @regression
  Scenario: Ausgewählten Standort erfolgreich senden
    # Happy Path: ausgewählter Standort wird korrekt zugestellt
    Given die Standortfreigabe wurde erteilt
    And der Nutzer hat einen Standort auf der Karte ausgewählt
    When der Nutzer sendet den ausgewählten Standort
    Then der Empfänger erhält eine Nachricht mit Kartenvorschau
    And die Nachricht enthält die Koordinaten des ausgewählten Standorts

  @negative @regression
  Scenario: Berechtigung abgelehnt zeigt Freigabeaufforderung
    # Error: Standortfreigabe verweigert
    Given die Standortfreigabe wurde abgelehnt oder nicht erteilt
    When der Nutzer wählt „Standort teilen“
    Then der Standort wird nicht geteilt
    And eine verständliche Aufforderung zur Freigabe wird angezeigt

  @negative @regression
  Scenario: Instabile Netzwerkverbindung beim Senden
    # Error: Versand schlägt fehl und Retry ist möglich
    Given die Standortfreigabe wurde erteilt
    And die Netzwerkverbindung ist instabil
    When der Nutzer sendet den Standort
    Then eine Fehlermeldung wird angezeigt
    And die Fehlermeldung bietet die Möglichkeit zum erneuten Versuch

  @edge @regression
  Scenario Outline: Grenzwerte der Koordinaten werden korrekt dargestellt
    # Boundary: gültige Extremwerte von Koordinaten werden korrekt angezeigt
    Given die Standortfreigabe wurde erteilt
    When der Nutzer sendet einen Standort mit den Koordinaten <latitude>, <longitude>
    Then der Empfänger erhält eine Nachricht mit Kartenvorschau
    And die Nachricht enthält exakt die Koordinaten <latitude>, <longitude>

    Examples:
      | latitude | longitude |
      | 90.000000 | 0.000000 |
      | -90.000000 | 0.000000 |
      | 0.000000 | 180.000000 |
      | 0.000000 | -180.000000 |

  @edge @regression
  Scenario Outline: Schnelles wiederholtes Senden
    # Edge Case: Mehrfaches Senden in kurzer Zeit erzeugt separate Nachrichten
    Given die Standortfreigabe wurde erteilt
    When der Nutzer sendet den Standort <send_count> mal innerhalb von 5 Sekunden
    Then es werden <send_count> separate Standortnachrichten gesendet
    And jede Nachricht enthält eine Kartenvorschau und Koordinaten

    Examples:
      | send_count |
      | 2 |
      | 3 |
