@smoke @regression
Feature: Chat-Suche
  As a Endnutzer
  I want to Chats und Kontakte über eine Suchfunktion finden
  So that relevante Konversationen schnell wiederfinden und die Kommunikation effizient fortsetzen

  Background:
    Given der Endnutzer befindet sich in der Chat-Übersicht und es existieren mehrere Chats und Kontakte

  @happy-path @smoke @regression
  Scenario: Passende Chats und Kontakte werden gefunden
    # Happy Path: Suche liefert passende Ergebnisse
    When der Endnutzer gibt den Suchbegriff "Anna" in das Suchfeld ein
    And der Endnutzer startet die Suche
    Then werden passende Chats und Kontakte in der Ergebnisliste angezeigt
    And die Ergebnisliste enthält mindestens einen Eintrag mit dem Suchbegriff

  @edge-case @negative @regression
  Scenario: Suche ohne Treffer zeigt Hinweis
    # Edge Case: Suche liefert keine passenden Ergebnisse
    When der Endnutzer gibt den Suchbegriff "xyz123" in das Suchfeld ein
    And der Endnutzer startet die Suche
    Then wird eine leere Ergebnisliste angezeigt
    And es wird ein Hinweis angezeigt, dass keine Treffer vorhanden sind

  @boundary @regression
  Scenario: Leere oder nur Leerzeichen Eingabe führt zu keiner Suche
    # Boundary: Leere oder whitespace Eingabe zeigt die vollständige Übersicht
    When der Endnutzer gibt eine leere oder nur aus Leerzeichen bestehende Eingabe in das Suchfeld ein
    And der Endnutzer startet die Suche
    Then wird keine Suche ausgeführt
    And die vollständige Chat-Übersicht wird angezeigt

  @happy-path @regression
  Scenario Outline: Suche mit verschiedenen Suchbegriffen
    # Data-driven: unterschiedliche Suchbegriffe liefern passende Ergebnisse
    When der Endnutzer gibt den Suchbegriff "<query>" in das Suchfeld ein
    And der Endnutzer startet die Suche
    Then werden passende Chats und Kontakte in der Ergebnisliste angezeigt
    And alle angezeigten Einträge enthalten den Suchbegriff

    Examples:
      | query |
      | Anna |
      | Projekt X |
      | Müller |

  @boundary @negative @regression
  Scenario Outline: Suche mit nur Leerzeichen in verschiedenen Varianten
    # Boundary: verschiedene Whitespace-Eingaben führen zu keiner Suche
    When der Endnutzer gibt die Eingabe "<whitespace>" in das Suchfeld ein
    And der Endnutzer startet die Suche
    Then wird keine Suche ausgeführt
    And die vollständige Chat-Übersicht wird angezeigt

    Examples:
      | whitespace |
      |   |
      |     |
      | 	 |

  @error @negative @regression
  Scenario Outline: Fehlerhafte Sucheingabe wird abgefangen
    # Error: ungültige Eingabe mit Sonderzeichen verursacht keinen Absturz
    When der Endnutzer gibt den Suchbegriff "<invalid_query>" in das Suchfeld ein
    And der Endnutzer startet die Suche
    Then die Anwendung bleibt stabil und zeigt entweder passende Ergebnisse oder eine leere Ergebnisliste mit Hinweis an
    And es wird kein Fehlerdialog angezeigt

    Examples:
      | invalid_query |
      | " OR 1=1 -- |
      | <script>alert(1)</script> |
