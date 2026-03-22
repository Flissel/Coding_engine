@smoke @regression
Feature: Abwesenheitsnachrichten konfigurieren und aktivieren
  As a Shop-Admin
  I want to automatische Abwesenheitsnachrichten aktivieren und konfigurieren
  So that Kunden waehrend der Abwesenheit professionell informieren und Anfragen zuverlaessig beantworten

  Background:
    Given der Shop-Admin ist eingeloggt und hat Zugriff auf Nachrichten-Einstellungen

  @smoke @regression @happy-path
  Scenario: Abwesenheitsnachricht erfolgreich speichern und senden
    # Happy path: Aktivierte Abwesenheitsnachricht wird im Zeitraum automatisch gesendet
    Given keine Abwesenheitsnachricht ist aktiv
    When der Shop-Admin eine Abwesenheitsnachricht mit Zeitraum und Text speichert und aktiviert
    And eine Kundenanfrage waehrend des konfigurierten Zeitraums eingeht
    Then sendet das System automatisch die konfigurierte Abwesenheitsnachricht
    And die Nachricht bleibt bis zum Ende des Zeitraums aktiv

  @regression @edge
  Scenario: Automatische Antworten enden nach Ablauf des Zeitraums
    # Edge case: Nach Ablauf werden keine Abwesenheitsnachrichten mehr gesendet
    Given eine aktive Abwesenheitsnachricht ist mit Zeitraum konfiguriert
    When der konfigurierte Zeitraum endet
    And eine neue Kundenanfrage nach Ablauf eingeht
    Then sendet das System keine Abwesenheitsnachricht
    And die Aktivierung wird als inaktiv angezeigt

  @regression @negative
  Scenario: Validierungsfehler bei fehlenden Pflichtfeldern
    # Error scenario: Speichern ohne Pflichtfelder wird verhindert
    When der Shop-Admin versucht eine Abwesenheitsnachricht ohne Pflichtfelder zu speichern
    Then zeigt das System eine Validierungsfehlermeldung an
    And die Abwesenheitsnachricht wird nicht gespeichert

  @regression @boundary
  Scenario Outline: Grenzwerte fuer Zeitraum und Textlaenge
    # Boundary conditions: minimale und maximale Werte werden akzeptiert
    Given keine Abwesenheitsnachricht ist aktiv
    When der Shop-Admin eine Abwesenheitsnachricht mit Start, Ende und Text speichert und aktiviert
    Then wird die Nachricht gespeichert und aktiviert

    Examples:
      | start | ende | text |
      | 2025-08-01T00:00:00 | 2025-08-01T00:01:00 | Ich bin kurz abwesend. |
      | 2025-08-01T00:00:00 | 2025-12-31T23:59:59 | Maximal zulaessiger Text mit erlaubter Laenge. |

  @regression @negative @edge
  Scenario Outline: Ungueltiger Zeitraum wird abgelehnt
    # Error scenario: Endzeit vor Startzeit
    When der Shop-Admin eine Abwesenheitsnachricht mit ungueltigem Zeitraum speichert
    Then zeigt das System eine Validierungsfehlermeldung fuer den Zeitraum an
    And die Abwesenheitsnachricht wird nicht gespeichert

    Examples:
      | start | ende |
      | 2025-08-02T10:00:00 | 2025-08-02T09:00:00 |
