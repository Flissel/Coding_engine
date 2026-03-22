@@smoke @@regression
Feature: US-022 Formatierte Texte im Nachrichten-Editor
  As a Kundenservice-Mitarbeiter
  I want to Nachrichten mit grundlegender Textformatierung (fett, kursiv, Aufzählungen) verfassen und senden
  So that um Informationen klar und professionell zu strukturieren und die Verständlichkeit für Kunden zu erhöhen

  Background:
    Given der Nutzer ist als Kundenservice-Mitarbeiter angemeldet
    And der Nutzer befindet sich im Nachrichten-Editor

  @@smoke @@regression @@happy-path
  Scenario: Nachricht mit unterstützter Formatierung wird korrekt angezeigt
    # Happy Path für fett, kursiv und Aufzählungen beim Senden
    Given der Editor unterstützt fett, kursiv und Aufzählungen
    When der Nutzer erstellt eine Nachricht mit fett, kursiv und einer Aufzählung und sendet sie
    Then die Nachricht wird beim Empfänger mit korrekter Formatierung angezeigt
    And der gesendete Nachrichtentext entspricht dem eingegebenen Inhalt

  @@regression @@happy-path
  Scenario: Formatierung entfernen und Nachricht senden
    # Happy Path für das Entfernen von Formatierungen vor dem Senden
    Given der Nutzer markiert einen Textabschnitt mit Formatierung
    When der Nutzer entfernt die Formatierung und sendet die Nachricht
    Then der Textabschnitt wird ohne Formatierung angezeigt
    And keine Rest-Formatierung ist im gesendeten Text vorhanden

  @@regression @@edge-case
  Scenario: Nicht unterstützte Formatierungen werden entfernt
    # Edge Case für nicht unterstützte Formatierungen beim Senden
    Given der Nutzer fügt eine nicht unterstützte Formatierung in den Text ein
    When der Nutzer sendet die Nachricht
    Then nicht unterstützte Formatierungen werden entfernt oder in Klartext umgewandelt
    And die Zustellung der Nachricht wird nicht verhindert

  @@regression @@boundary
  Scenario: Nachricht mit gemischter Formatierung über mehrere Absätze
    # Boundary Condition für Text mit mehreren Absätzen und gemischter Formatierung
    Given der Nutzer erstellt eine mehrabsätzige Nachricht mit gemischter Formatierung
    When der Nutzer sendet die Nachricht
    Then jeder Absatz wird mit der korrekten Formatierung angezeigt
    And keine Formatierung läuft in andere Absätze über

  @@regression @@edge-case
  Scenario: Leerer formatierter Abschnitt wird korrekt verarbeitet
    # Edge Case für leere Formatierungsmarker
    Given der Nutzer fügt eine Formatierung ein ohne Text einzugeben
    When der Nutzer sendet die Nachricht
    Then die Nachricht wird ohne leere Formatierung angezeigt
    And die Zustellung wird nicht verhindert

  @@regression @@negative
  Scenario: Ungültige Formatierungs-Tags werden bereinigt
    # Error Scenario für ungültige Formatierungs-Tags im Editor
    Given der Nutzer fügt ungültige oder kaputte Formatierungs-Tags ein
    When der Nutzer sendet die Nachricht
    Then die ungültigen Tags werden bereinigt oder als Klartext angezeigt
    And die Nachricht wird weiterhin zugestellt

  @@smoke @@regression
  Scenario Outline: Formatierungsvarianten als Szenario-Outline
    # Data-driven Test für unterstützte Formatierungen
    Given der Nutzer gibt den Text <text> ein
    When der Nutzer wendet die Formatierung <formatierung> an und sendet die Nachricht
    Then der Empfänger sieht den Text mit der Formatierung <formatierung> korrekt dargestellt

    Examples:
      | text | formatierung |
      | Wichtige Information | fett |
      | Hinweis | kursiv |
      | Punkt 1; Punkt 2 | Aufzählungen |
