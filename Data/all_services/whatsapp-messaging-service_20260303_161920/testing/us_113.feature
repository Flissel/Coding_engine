@@smoke @@regression
Feature: Batterieeffizienz
  As a Endnutzer
  I want to die App nutzen, ohne dass sie den Akku übermäßig belastet
  So that eine längere Akkulaufzeit zu gewährleisten und die Nutzung unterwegs zuverlässig zu ermöglichen

  Background:
    Given die App ist installiert und die Messung des Akkuverbrauchs ist aktiviert

  @@smoke @@regression @@happy-path
  Scenario: Hintergrundbetrieb verursacht keinen ungewöhnlichen Akkuverbrauch
    # Happy Path: Vergleich des Akkuverbrauchs im Leerlauf mit Referenz-Apps über 4 Stunden
    Given die App ist im Hintergrund aktiv und keine Interaktion findet statt
    When über einen Zeitraum von 4 Stunden der Akkuverbrauch gemessen wird
    Then liegt der Akkuverbrauch der App nicht über dem Durchschnitt vergleichbarer Messenger-Apps
    And keine ungewöhnlichen Hintergrundaktivitäten werden protokolliert

  @@regression @@happy-path
  Scenario: Aktive Nutzung bleibt innerhalb dokumentierter Grenzwerte
    # Happy Path: Senden und Empfangen mehrerer Nachrichten innerhalb von 30 Minuten
    Given die App ist im Vordergrund aktiv und die Netzwerkverbindung ist stabil
    When innerhalb von 30 Minuten mehrere Nachrichten gesendet und empfangen werden
    Then bleibt der Akkuverbrauch innerhalb des dokumentierten Grenzwerts
    And die Messwerte werden für den Testbericht gespeichert

  @@regression @@edge
  Scenario: Energiesparmodus reduziert Hintergrundaktivität ohne Nachrichtenverlust
    # Edge Case: Gerät wechselt in den Energiesparmodus während die App im Hintergrund bleibt
    Given die App ist im Hintergrund aktiv und es sind neue Nachrichten unterwegs
    When das Gerät in den Energiesparmodus wechselt
    Then reduziert die App ihre Hintergrundaktivitäten gemäß Energiesparrichtlinien
    And keine neuen Nachrichten gehen verloren

  @@regression @@boundary
  Scenario Outline: Grenzwertprüfung bei hoher Nachrichtenlast
    # Boundary Condition: Akkuverbrauch nahe am Grenzwert bei hoher Aktivität
    Given die App ist im Vordergrund aktiv und die Messung des Akkuverbrauchs läuft
    When innerhalb von 30 Minuten eine hohe Anzahl Nachrichten gesendet und empfangen wird
    Then liegt der Akkuverbrauch bei oder unter dem definierten Grenzwert
    And der Grenzwert wird nicht überschritten

    Examples:
      | message_count | time_window_minutes |
      | 100 | 30 |

  @@regression @@negative
  Scenario: Fehlerfall: Überschreitung des Grenzwerts wird erkannt und gemeldet
    # Error Scenario: Akkuverbrauch überschreitet den dokumentierten Grenzwert
    Given die App ist im Vordergrund aktiv und der Grenzwert für Akkuverbrauch ist konfiguriert
    When der gemessene Akkuverbrauch den Grenzwert überschreitet
    Then wird der Überschreitungsfall im Monitoring protokolliert
    And ein Hinweis wird für das QA-Reporting erstellt
