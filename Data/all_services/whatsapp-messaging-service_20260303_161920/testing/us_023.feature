@@smoke @@regression
Feature: Erwaehnung im Gruppenchat
  As a Gruppenchat-Nutzer
  I want to andere Teilnehmer in einem Gruppenchchat per @-Erwähnung markieren
  So that um gezielt Aufmerksamkeit zu erzeugen und die Kommunikation effizienter zu gestalten

  Background:
    Given ich bin als Gruppenchat-Nutzer angemeldet
    And ich befinde mich in einem Gruppenchchat mit mehreren Teilnehmern

  @@smoke @@happy-path @@regression
  Scenario: Erfolgreiche Einzel-Erwähnung eines gültigen Teilnehmers
    # Prüft, dass eine einzelne gültige @-Erwähnung hervorgehoben und die Nachricht zugestellt wird
    When ich tippe @ und wähle einen gültigen Teilnehmer aus der Vorschlagsliste aus
    And ich sende die Nachricht
    Then die Nachricht wird im Gruppenchat zugestellt
    And der erwähnte Teilnehmer wird als @-Erwähnung hervorgehoben

  @@happy-path @@regression
  Scenario: Mehrere gültige Erwähnungen in einer Nachricht
    # Prüft, dass mehrere gültige @-Erwähnungen in derselben Nachricht korrekt markiert werden
    When ich füge mehrere gültige @-Erwähnungen in derselben Nachricht hinzu
    And ich sende die Nachricht
    Then alle erwähnten Teilnehmer werden korrekt markiert
    And die Nachricht wird an alle Teilnehmer zugestellt

  @@negative @@regression
  Scenario: Ungültige Erwähnung verhindert oder entfernt
    # Prüft, dass ein nicht im Gruppenchat vorhandener Name nicht erwähnt werden kann
    When ich tippe @ gefolgt von einem Namen, der nicht im Gruppenchat ist
    And ich versuche die Nachricht zu senden
    Then das System verhindert die ungültige Erwähnung oder entfernt sie
    And ich werde über den Fehler informiert

  @@edge @@regression
  Scenario Outline: Scenario Outline: Erwähnungsauswahl mit ähnlichen Namen
    # Edge Case: Auswahl des korrekten Teilnehmers bei ähnlichen Namenspräfixen
    Given im Gruppenchat existieren Teilnehmer mit ähnlichen Namen
    When ich tippe @ gefolgt von <prefix> und wähle <selected_name> aus der Liste
    And ich sende die Nachricht
    Then genau <selected_name> wird als @-Erwähnung hervorgehoben

    Examples:
      | prefix | selected_name |
      | ann | Anna |
      | ann | Anne |

  @@boundary @@regression
  Scenario Outline: Scenario Outline: Maximale Anzahl von Erwähnungen in einer Nachricht
    # Boundary Condition: Prüfung der erlaubten Höchstanzahl an @-Erwähnungen
    Given die Plattform erlaubt maximal <max_mentions> Erwähnungen pro Nachricht
    When ich füge <mention_count> gültige @-Erwähnungen in derselben Nachricht hinzu
    And ich sende die Nachricht
    Then die Nachricht wird <delivery_result>
    And <system_feedback>

    Examples:
      | max_mentions | mention_count | delivery_result | system_feedback |
      | 5 | 5 | zugestellt | alle Erwähnungen sind markiert |
      | 5 | 6 | nicht zugestellt | ich erhalte einen Hinweis zur maximalen Anzahl von Erwähnungen |
