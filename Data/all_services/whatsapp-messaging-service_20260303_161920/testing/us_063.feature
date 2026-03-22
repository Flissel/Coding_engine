@@smoke @@regression
Feature: Spam-Erkennung
  As a Support-Mitarbeiter fuer Content-Moderation
  I want to automatische Spam-Erkennung fuer eingehende und ausgehende Nachrichten aktiv nutzen
  So that um Missbrauch zu verhindern und die Zustellqualitaet sowie Sicherheit fuer Nutzer zu erhoehen

  Background:
    Given das System zur Nachrichtenverarbeitung ist aktiv
    And die Spam-Muster und Schwellenwerte sind im System konfiguriert

  @@smoke @@regression @@happy-path
  Scenario: Automatische Markierung und Filterung bei eindeutigen Spam-Mustern
    # Nachrichten mit bekannten Spam-Mustern oder ueberschrittenen Schwellenwerten werden als Spam markiert
    Given eine Nachricht enthaelt ein bekanntes Spam-Muster oder ueberschreitet definierte Schwellenwerte
    When die Nachricht vom System verarbeitet wird
    Then die Nachricht wird als Spam markiert
    And die Nachricht wird gefiltert und nicht zugestellt

  @@regression @@happy-path
  Scenario: Legitime Nachricht mit teilweiser Aehnlichkeit wird zugestellt
    # Legitime Inhalte mit nur teilweiser Aehnlichkeit zu Spam-Mustern werden nicht blockiert
    Given eine legitime Nachricht aehnelt nur teilweise einem Spam-Muster
    When die Nachricht analysiert wird
    Then die Nachricht wird als nicht-spam klassifiziert
    And die Nachricht wird zugestellt

  @@regression @@negative @@error
  Scenario: Fallback bei Ausfall der Spam-Erkennung
    # Bei nicht verfuegbarer Spam-Erkennung wird die Nachricht zugestellt und der Ausfall protokolliert
    Given die Spam-Erkennung ist voruebergehend nicht verfuegbar
    When eine Nachricht eingeht
    Then die Nachricht wird zugestellt
    And der Ausfall wird im System-Monitoring protokolliert

  @@regression @@edge @@boundary
  Scenario Outline: Schwellenwertgrenzen fuer Spam-Erkennung
    # Grenzwerte werden korrekt behandelt und klassifizieren Nachrichten entsprechend der Konfiguration
    Given eine Nachricht hat einen Spam-Score von "<spam_score>" bei einem Schwellwert von "<threshold>"
    When die Nachricht vom System verarbeitet wird
    Then die Nachricht wird als "<expected_classification>" klassifiziert
    And die Nachricht wird entsprechend "<expected_delivery>"

    Examples:
      | spam_score | threshold | expected_classification | expected_delivery |
      | 0.49 | 0.50 | nicht-spam | zugestellt |
      | 0.50 | 0.50 | Spam | gefiltert |
      | 0.51 | 0.50 | Spam | gefiltert |

  @@regression @@edge
  Scenario Outline: Teilweise Musteruebereinstimmung mit minimalen Verdachtsindikatoren
    # Edge Case: minimale Indikatoren duerfen nicht zu False Positives fuehren
    Given eine Nachricht enthaelt nur "<pattern_match_percent>%" Uebereinstimmung mit einem Spam-Muster
    When die Nachricht analysiert wird
    Then die Nachricht wird als nicht-spam klassifiziert
    And die Nachricht wird zugestellt

    Examples:
      | pattern_match_percent |
      | 10 |
      | 20 |
