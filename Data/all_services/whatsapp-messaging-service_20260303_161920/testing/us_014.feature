@@smoke @@regression
Feature: Nachricht bearbeiten
  As a Endnutzer
  I want to eine bereits gesendete Nachricht bearbeiten
  So that Korrekturen vornehmen zu koennen und eine professionelle sowie fehlerfreie Kommunikation sicherzustellen

  Background:
    Given der Nutzer ist angemeldet und besitzt Berechtigung zum Bearbeiten gesendeter Nachrichten

  @@happy-path @@smoke @@regression
  Scenario: Erfolgreiches Bearbeiten einer gesendeten Nachricht
    # Happy path: Nachricht wird innerhalb des Bearbeitungsfensters erfolgreich aktualisiert
    Given eine gesendete Nachricht befindet sich innerhalb des Bearbeitungsfensters
    And die Nachricht wurde dem Empfänger zugestellt
    When der Nutzer öffnet den Bearbeiten-Dialog, ändert den Text und speichert
    Then die Nachricht wird aktualisiert angezeigt
    And die Änderung wird an den Empfänger übermittelt

  @@boundary @@regression
  Scenario: Bearbeitung innerhalb des Zeitfensters an der Grenze
    # Boundary condition: Bearbeitung kurz vor Ablauf des Zeitfensters ist erlaubt
    Given eine gesendete Nachricht ist genau noch innerhalb des Bearbeitungsfensters
    When der Nutzer den Bearbeiten-Dialog öffnet, den Text ändert und speichert
    Then die Nachricht wird aktualisiert angezeigt
    And die Änderung wird an den Empfänger übermittelt

  @@negative @@regression
  Scenario: Bearbeitung nach Ablauf des Zeitfensters verhindern
    # Error scenario: Nachricht ist nicht mehr bearbeitbar
    Given eine gesendete Nachricht ist nicht mehr bearbeitbar, weil das Zeitfenster abgelaufen ist
    When der Nutzer versucht die Nachricht zu bearbeiten
    Then das System verhindert die Bearbeitung
    And eine eindeutige Meldung zur Nichtbearbeitbarkeit wird angezeigt

  @@negative @@regression
  Scenario: Validierungsfehler bei unzulässigen Inhalten oder Längenlimits
    # Error scenario: Inhalte sind unzulässig oder überschreiten Limits
    Given eine gesendete Nachricht befindet sich innerhalb des Bearbeitungsfensters
    When der Nutzer speichert eine Bearbeitung mit unzulässigen Inhalten oder überschreitet das Längenlimit
    Then das System lehnt die Änderung ab
    And die Validierungsfehler werden angezeigt

  @@edge @@regression
  Scenario Outline: Bearbeitung mit verschiedenen Textlängen
    # Edge cases: minimale, maximale und zu lange Texte
    Given eine gesendete Nachricht befindet sich innerhalb des Bearbeitungsfensters
    When der Nutzer den Text auf '<text>' ändert und speichert
    Then das Ergebnis ist '<result>'
    And die entsprechende Meldung '<message>' wird angezeigt

    Examples:
      | text | result | message |
      | OK | die Nachricht wird aktualisiert angezeigt | Änderung erfolgreich |
      | <max_length_text> | die Nachricht wird aktualisiert angezeigt | Änderung erfolgreich |
      | <max_length_plus_one_text> | die Änderung wird abgelehnt | Text überschreitet das Längenlimit |

  @@negative @@regression
  Scenario Outline: Bearbeitung mit verschiedenen unzulässigen Inhalten
    # Error scenarios: Validierung unzulässiger Inhalte
    Given eine gesendete Nachricht befindet sich innerhalb des Bearbeitungsfensters
    When der Nutzer den Text auf '<invalid_content>' ändert und speichert
    Then das System lehnt die Änderung ab
    And die Validierungsfehler '<validation_error>' werden angezeigt

    Examples:
      | invalid_content | validation_error |
      | <verbotener_ausdruck> | Unzulässiger Inhalt |
      | <schadcode_snippet> | Unzulässiger Inhalt |
