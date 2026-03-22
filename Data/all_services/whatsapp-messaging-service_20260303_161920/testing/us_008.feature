@@smoke @@regression
Feature: US-008 Info/Status Text
  As a Profilinhaber
  I want to einen kurzen Info-Text im Profil erstellen und speichern
  So that Besuchern schnell relevante Hinweise bereitzustellen und die Kommunikation zu verbessern

  Background:
    Given der Profilinhaber ist angemeldet und befindet sich in der Profilbearbeitung

  @@happy-path @@smoke @@regression
  Scenario: Erfolgreiches Speichern eines Info-Texts
    # Happy path: Ein gültiger Info-Text wird gespeichert und für Besucher angezeigt
    When er einen gültigen kurzen Info-Text eingibt
    And er die Änderungen speichert
    Then der Info-Text wird im Profil angezeigt
    And der Info-Text ist für Besucher sichtbar

  @@boundary @@regression
  Scenario: Boundary: Speichern mit maximaler Zeichenanzahl
    # Boundary condition: Speichern ist möglich, wenn der Text exakt der maximalen Zeichenanzahl entspricht
    Given die maximale Zeichenanzahl für den Info-Text ist bekannt
    When er einen Info-Text mit exakt der maximalen Zeichenanzahl eingibt
    And er die Änderungen speichert
    Then der Info-Text wird im Profil angezeigt

  @@edge @@regression
  Scenario: Edge: Entfernen des Info-Texts
    # Edge case: Ein vorhandener Info-Text wird gelöscht
    Given ein Info-Text ist bereits im Profil vorhanden
    When er den Info-Text vollständig entfernt
    And er die Änderungen speichert
    Then im Profil wird kein Info-Text mehr angezeigt

  @@negative @@regression
  Scenario: Fehler: Speichern mit zu langem Info-Text
    # Error scenario: Speichern wird bei Überschreitung der Zeichenbegrenzung verhindert
    Given die maximale Zeichenanzahl für den Info-Text ist bekannt
    When er einen Info-Text eingibt, der die maximale Zeichenanzahl überschreitet
    And er versucht zu speichern
    Then das System verhindert das Speichern
    And eine verständliche Fehlermeldung zur Zeichenbegrenzung wird angezeigt

  @@boundary @@negative @@regression
  Scenario Outline: Datengesteuert: Validierung der Zeichenlängen
    # Scenario Outline: Validierung für verschiedene Längen
    Given die maximale Zeichenanzahl für den Info-Text ist <max_length>
    When er einen Info-Text mit <input_length> Zeichen eingibt
    And er die Änderungen speichert
    Then das System Ergebnis ist <expected_result>

    Examples:
      | max_length | input_length | expected_result |
      | 200 | 200 | Speichern erfolgreich |
      | 200 | 201 | Speichern verhindert mit Fehlermeldung |
      | 200 | 1 | Speichern erfolgreich |
