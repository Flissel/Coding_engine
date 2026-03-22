@@smoke @@regression
Feature: Datumsbasierte Suche im Nachrichtenverlauf
  As a registrierter Nutzer
  I want to im Nachrichtenverlauf zu einem bestimmten Datum springen
  So that schnell relevante Informationen zu finden und die Bedienung zu vereinfachen

  Background:
    Given der Nutzer ist registriert und angemeldet
    And der Nachrichtenverlauf enthält Nachrichten über mehrere Tage

  @@smoke @@regression @@happy-path
  Scenario Outline: Sprung zur ersten Nachricht eines gültigen Datums
    # Happy path: gültiges Datum mit vorhandenen Nachrichten
    Given es existieren Nachrichten am Datum "<datum>"
    When der Nutzer wählt das Datum "<datum>" und startet die Suche
    Then das System springt zur ersten Nachricht dieses Datums
    And die erste Nachricht des Datums wird im Verlauf sichtbar angezeigt

    Examples:
      | datum |
      | 2024-05-10 |
      | 2024-05-11 |

  @@regression @@negative @@edge
  Scenario Outline: Kein Treffer für Datum ohne Nachrichten
    # Edge case: gültiges Datum ohne Nachrichten
    Given es existieren keine Nachrichten am Datum "<datum>"
    When der Nutzer wählt das Datum "<datum>" und startet die Suche
    Then das System zeigt eine eindeutige Meldung, dass keine Nachrichten für dieses Datum vorhanden sind
    And der aktuelle Verlauf bleibt unverändert

    Examples:
      | datum |
      | 2024-05-12 |

  @@regression @@negative @@error
  Scenario Outline: Ungültiges Datumsformat wird abgewiesen
    # Error scenario: Eingabeformat ist ungültig
    Given der Nutzer befindet sich im Nachrichtenverlauf
    When der Nutzer gibt das Datum "<datum>" ein und startet die Suche
    Then das System weist die Eingabe ab
    And ein Hinweis zur korrekten Datumsangabe wird angezeigt

    Examples:
      | datum |
      | 10-05-2024 |
      | 2024/05/10 |
      | 2024-13-01 |

  @@regression @@boundary
  Scenario Outline: Boundary: frühestes verfügbares Datum
    # Boundary condition: erstes Datum im Verlauf
    Given das früheste Datum im Verlauf ist "<datum>"
    When der Nutzer wählt das Datum "<datum>" und startet die Suche
    Then das System springt zur ersten Nachricht dieses Datums
    And keine Nachrichten vor diesem Datum werden angezeigt

    Examples:
      | datum |
      | 2024-01-01 |

  @@regression @@boundary
  Scenario Outline: Boundary: spätestes verfügbares Datum
    # Boundary condition: letztes Datum im Verlauf
    Given das späteste Datum im Verlauf ist "<datum>"
    When der Nutzer wählt das Datum "<datum>" und startet die Suche
    Then das System springt zur ersten Nachricht dieses Datums
    And keine Nachrichten nach diesem Datum werden angezeigt

    Examples:
      | datum |
      | 2024-12-31 |
