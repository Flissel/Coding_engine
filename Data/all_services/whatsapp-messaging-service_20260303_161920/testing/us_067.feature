@smoke @regression
Feature: Schnellantwort aus Benachrichtigung
  As a registrierter Nutzer
  I want to eine Antwort direkt aus der Benachrichtigung senden
  So that um schnell und bequem zu kommunizieren, ohne die App öffnen zu müssen

  Background:
    Given ein registrierter Nutzer ist auf dem Gerät angemeldet

  @@smoke @@regression @@happy-path
  Scenario: Schnellantwort wird erfolgreich gesendet
    # Erfolgreiches Senden einer Antwort direkt aus der Benachrichtigung
    Given der Nutzer erhält eine neue Nachricht und eine Benachrichtigung wird angezeigt
    When der Nutzer tippt auf „Antworten“ und sendet die Nachricht aus der Benachrichtigung
    Then die Antwort wird gesendet
    And der Empfänger erhält die Antwort zuverlässig

  @@regression @@negative @@edge-case
  Scenario: Antwort wird bei Offline-Status verzögert gesendet
    # Antwort aus Benachrichtigung bei fehlender Verbindung wird gepuffert und später gesendet
    Given der Nutzer erhält eine Benachrichtigung während das Gerät offline ist
    When der Nutzer versucht aus der Benachrichtigung zu antworten
    Then das System zeigt einen Hinweis auf fehlende Verbindung
    And die Antwort wird erst nach Wiederherstellung der Verbindung gesendet

  @@regression @@negative @@error
  Scenario: Antwort wird verhindert wenn Chat gelöscht ist
    # Antwort aus Benachrichtigung darf nicht gesendet werden wenn der Chat nicht verfügbar ist
    Given die Benachrichtigung ist älter und der zugehörige Chat wurde gelöscht
    When der Nutzer versucht aus der Benachrichtigung zu antworten
    Then das System verhindert das Senden der Antwort
    And das System informiert den Nutzer, dass der Chat nicht verfügbar ist

  @@regression @@boundary
  Scenario Outline: Schnellantwort mit verschiedenen Nachrichtentextlängen
    # Grenzwerte für Nachrichtentextlänge bei Schnellantwort
    Given der Nutzer erhält eine neue Nachricht und eine Benachrichtigung wird angezeigt
    When der Nutzer sendet eine Schnellantwort mit dem Text "<message_text>"
    Then das System verarbeitet die Schnellantwort entsprechend der zulässigen Länge
    And die Rückmeldung zeigt den Status "<status>"

    Examples:
      | message_text | status |
      | OK | gesendet |
      | A | gesendet |
      | Nachricht mit 500 Zeichen | gesendet |
