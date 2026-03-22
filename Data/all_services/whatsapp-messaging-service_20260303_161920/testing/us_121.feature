@@smoke @@regression
Feature: Meta AI Chat
  As a Business-Kundenbetreuer
  I want to den integrierten KI-Assistenten im Chat aktivieren und nutzen, um Kundenanfragen automatisiert zu beantworten
  So that um schnelle, konsistente und professionelle Kommunikation sicherzustellen und die Bearbeitungszeit zu reduzieren

  Background:
    Given der Kundenbetreuer ist eingeloggt und der Chat ist geöffnet

  @@smoke @@regression @@happy-path
  Scenario: Vorgeschlagene KI-Antwort kann gesendet werden
    # Happy path für die KI-Antwortgenerierung und Versand
    Given der KI-Assistent ist aktiviert
    When eine Kundenanfrage mit klarer Absicht eingeht
    Then innerhalb akzeptabler Zeit wird eine passende Antwort vorgeschlagen
    And der Kundenbetreuer kann den Vorschlag senden

  @@regression @@edge
  Scenario: KI fordert Rückfrage bei mehrdeutiger Anfrage
    # Edge case für unklare oder mehrdeutige Informationen
    Given der KI-Assistent ist aktiviert
    When eine Kundenanfrage mit mehrdeutigen Informationen eingeht
    Then der KI-Assistent schlägt eine gezielte Rückfrage vor
    And es wird keine endgültige Antwort automatisch gesendet

  @@regression @@negative @@error
  Scenario: KI-Integration nicht verfügbar
    # Error scenario wenn die KI-Integration nicht erreichbar ist
    Given die KI-Integration ist temporär nicht verfügbar
    When der Kundenbetreuer versucht den KI-Assistenten zu nutzen
    Then es wird eine verständliche Fehlermeldung angezeigt
    And der manuelle Antwortmodus bleibt verfügbar

  @@regression @@boundary
  Scenario Outline: Antwortzeit innerhalb akzeptabler Grenze
    # Boundary condition für maximale Antwortzeit
    Given der KI-Assistent ist aktiviert
    When eine Kundenanfrage mit klarer Absicht eingeht
    Then die Antwort wird innerhalb von <max_time_seconds> Sekunden vorgeschlagen
    And die Antwort ist für den Kundenbetreuer sichtbar

    Examples:
      | max_time_seconds |
      | 2 |
      | 5 |

  @@regression @@happy-path
  Scenario Outline: Antwortvorschlag bei verschiedenen Anfragearten
    # Data-driven happy path für unterschiedliche Anfragearten
    Given der KI-Assistent ist aktiviert
    When eine Kundenanfrage der Art <request_type> eingeht
    Then eine passende Antwort für <request_type> wird vorgeschlagen
    And der Kundenbetreuer kann den Vorschlag senden

    Examples:
      | request_type |
      | Produktverfügbarkeit |
      | Preisnachfrage |
      | Lieferstatus |
