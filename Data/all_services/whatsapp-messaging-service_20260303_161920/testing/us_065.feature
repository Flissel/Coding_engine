@smoke @regression
Feature: Push-Benachrichtigungen
  As a registrierter Nutzer
  I want to Push-Benachrichtigungen auf meinem Geraet empfangen
  So that wichtige Informationen zuverlaessig und zeitnah zu erhalten

  Background:
    Given der Nutzer ist registriert und in der App angemeldet

  @@smoke @@regression @@happy-path
  Scenario Outline: Push-Benachrichtigung wird innerhalb der SLA zugestellt
    # Happy path: Benachrichtigung wird bei aktivierten Pushes und bestehender Internetverbindung rechtzeitig zugestellt
    Given Push-Benachrichtigungen sind in der App aktiviert
    And eine stabile Internetverbindung besteht
    When das System eine Benachrichtigung mit Prioritaet <prioritaet> versendet
    Then die Push-Benachrichtigung wird innerhalb der SLA von <sla_sekunden> Sekunden zugestellt
    And die Benachrichtigung wird auf dem Geraet angezeigt

    Examples:
      | prioritaet | sla_sekunden |
      | hoch | 5 |
      | normal | 10 |

  @@regression @@negative
  Scenario: Keine Push-Benachrichtigung bei deaktivierten Pushes
    # Error/negative: Bei deaktivierten Pushes darf keine Benachrichtigung angezeigt werden
    Given Push-Benachrichtigungen sind in der App deaktiviert
    And eine Internetverbindung besteht
    When das System eine Benachrichtigung versendet
    Then es wird keine Push-Benachrichtigung auf dem Geraet angezeigt
    And es erfolgt kein Eintrag im Benachrichtigungsverlauf des Geraets

  @@regression @@negative
  Scenario: Zwischenspeicherung bei nicht erreichbarem Push-Dienst
    # Error recovery: Benachrichtigung wird gepuffert und nach Wiederherstellung zugestellt
    Given Push-Benachrichtigungen sind aktiviert
    And der Push-Dienst ist temporaer nicht erreichbar
    When das System eine Benachrichtigung versendet
    Then die Benachrichtigung wird im System zwischengespeichert
    And nach Wiederherstellung des Push-Dienstes wird die Benachrichtigung zugestellt

  @@regression @@boundary
  Scenario Outline: Grenzfall: Zustellung genau am SLA-Limit
    # Boundary condition: Zustellung am exakten SLA-Grenzwert gilt als erfolgreich
    Given Push-Benachrichtigungen sind aktiviert
    And eine Internetverbindung besteht
    When das System eine Benachrichtigung versendet
    Then die Push-Benachrichtigung wird genau nach <sla_sekunden> Sekunden zugestellt
    And die Zustellung wird als innerhalb der SLA gewertet

    Examples:
      | sla_sekunden |
      | 10 |
