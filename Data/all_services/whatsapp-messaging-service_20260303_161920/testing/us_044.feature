@smoke @regression
Feature: US-044 Status-Antwort
  As a Kundenservice-Mitarbeiter
  I want to auf eine Statusnachricht mit einer Status-Antwort reagieren
  So that damit Kunden schnell und zuverlässig eine Rückmeldung erhalten und die Kommunikation professionell bleibt

  Background:
    Given ein Kundenservice-Mitarbeiter ist im Chat angemeldet und sieht eine Statusnachricht

  @@smoke @@regression @@happy-path
  Scenario: Status-Antwort wird erfolgreich gesendet und gekennzeichnet
    # Happy path: Status-Antwort wird zugestellt und im Verlauf als Status-Antwort markiert
    Given die Statusnachricht liegt innerhalb des zulässigen Antwortfensters
    When der Kundenservice-Mitarbeiter eine Status-Antwort sendet
    Then wird die Antwort zugestellt
    And die Antwort erscheint im Chatverlauf als Status-Antwort gekennzeichnet

  @@regression @@happy-path
  Scenario Outline: Senden einer Status-Antwort mit verschiedenen Inhalten
    # Datengetriebener Happy Path für unterschiedliche Antworttexte
    Given die Statusnachricht liegt innerhalb des zulässigen Antwortfensters
    When der Kundenservice-Mitarbeiter eine Status-Antwort mit dem Text <antwort_text> sendet
    Then wird die Antwort zugestellt
    And die Antwort erscheint im Chatverlauf als Status-Antwort gekennzeichnet

    Examples:
      | antwort_text |
      | Danke, wir prüfen den Status. |
      | Der Status ist aktualisiert. |

  @@regression @@negative
  Scenario: Antwortfenster überschritten verhindert das Senden
    # Error: Senden wird blockiert, wenn die Statusnachricht zu alt ist
    Given die Statusnachricht ist älter als das zulässige Antwortfenster
    When der Kundenservice-Mitarbeiter versucht eine Status-Antwort zu senden
    Then wird das Senden verhindert
    And eine verständliche Meldung wird angezeigt

  @@regression @@edge
  Scenario: Grenzfall: Antwortfenster genau erreicht
    # Boundary: Statusnachricht genau am Ende des Antwortfensters
    Given die Statusnachricht ist genau so alt wie das zulässige Antwortfenster
    When der Kundenservice-Mitarbeiter eine Status-Antwort sendet
    Then wird die Antwort zugestellt
    And die Antwort erscheint im Chatverlauf als Status-Antwort gekennzeichnet

  @@regression @@negative @@error
  Scenario: Verbindungsabbruch während des Sendens
    # Error: Netzwerkfehler zeigt Fehlermeldung und erneuten Sendeversuch
    Given die Verbindung wird während des Sendens unterbrochen
    When die Status-Antwort gesendet werden soll
    Then wird eine Fehlermeldung angezeigt
    And das System bietet einen erneuten Sendeversuch an

  @@regression @@edge
  Scenario: Grenzfall: Wiederholter Sendeversuch nach Verbindungsfehler
    # Boundary: Erneuter Versuch nach Fehler stellt Zustellung sicher
    Given ein vorheriger Sendeversuch ist wegen Verbindungsabbruch fehlgeschlagen
    When der Kundenservice-Mitarbeiter den erneuten Sendeversuch startet
    Then wird die Status-Antwort zugestellt
    And die Antwort erscheint im Chatverlauf als Status-Antwort gekennzeichnet
