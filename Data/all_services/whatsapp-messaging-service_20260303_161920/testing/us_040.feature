@smoke @regression
Feature: Anruf ablehnen mit Nachricht
  As a primärer Nutzer
  I want to einen eingehenden Anruf ablehnen und eine schnelle Antwortnachricht senden
  So that damit der Anrufer sofort informiert wird und die Kommunikation zuverlässig und professionell bleibt

  Background:
    Given der Nutzer ist im Anrufbildschirm mit einem eingehenden Anruf

  @smoke @regression @happy-path
  Scenario: Schnellantwort senden und Anruf ablehnen innerhalb von 2 Sekunden
    # Happy path: Anruf wird abgelehnt und die gewählte Schnellantwort wird rechtzeitig versendet
    Given der Nutzer ist online und Schnellantworten sind verfügbar
    When der Nutzer wählt die Schnellantwort "Bin in einem Meeting" und lehnt den Anruf ab
    Then der Anruf wird abgelehnt
    And die Nachricht wird innerhalb von 2 Sekunden gesendet

  @regression @edge-case
  Scenario: Standardnachricht senden wenn keine Schnellantworten verfügbar sind
    # Edge case: keine vordefinierten Schnellantworten vorhanden
    Given keine vordefinierten Schnellantworten sind verfügbar
    When der Nutzer lehnt den Anruf ab
    Then der Anruf wird abgelehnt
    And eine Standardnachricht wird gesendet

  @regression @negative
  Scenario: Nachrichtenversand schlägt fehl wenn der Nachrichtendienst nicht verfügbar ist
    # Error scenario: Nachrichtendienst temporär nicht verfügbar
    Given der Nachrichtendienst ist vorübergehend nicht verfügbar
    When der Nutzer wählt eine Schnellantwort und lehnt den Anruf ab
    Then der Anruf wird abgelehnt
    And eine Fehlermeldung zur fehlgeschlagenen Nachrichtenzustellung wird angezeigt

  @regression @boundary
  Scenario Outline: Schnellantworten Auswahl und Versandzeit an der 2-Sekunden-Grenze
    # Boundary condition: Versand erfolgt exakt an der Zeitgrenze
    Given der Nutzer ist online und Schnellantworten sind verfügbar
    When der Nutzer wählt eine Schnellantwort und lehnt den Anruf ab
    Then der Anruf wird abgelehnt
    And die Nachricht wird in genau "2" Sekunden gesendet

    Examples:
      | message | send_time_seconds |
      | Rufe später zurück | 2 |

  @regression @happy-path
  Scenario Outline: Schnellantworten Versandzeit datengesteuert prüfen
    # Scenario outline: verschiedene Schnellantworten werden innerhalb der Zeitgrenze gesendet
    Given der Nutzer ist online und Schnellantworten sind verfügbar
    When der Nutzer wählt die Schnellantwort "<message>" und lehnt den Anruf ab
    Then der Anruf wird abgelehnt
    And die Nachricht wird innerhalb von "<send_time_seconds>" Sekunden gesendet

    Examples:
      | message | send_time_seconds |
      | Bin gleich zurück | 2 |
      | Kann gerade nicht sprechen | 1 |
