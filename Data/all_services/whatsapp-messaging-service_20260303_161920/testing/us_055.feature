@@smoke @@regression
Feature: Galerie-Zugriff
  As a Endnutzer
  I want to Medien aus der Geraete-Galerie im Chat auswaehlen und senden
  So that damit ich schnell und sicher Inhalte teilen kann und die Kommunikation effizient bleibt

  Background:
    Given die App ist installiert und der Nutzer ist im Chat eingeloggt

  @@smoke @@regression @@happy-path
  Scenario: Bild aus Galerie auswaehlen und im Chat anzeigen
    # Happy Path: Ein Bild wird aus der Galerie ausgewaehlt und im Chat angezeigt
    Given die App hat Berechtigung zur Geraete-Galerie
    When ich oeffne die Medienauswahl und waehle ein Bild aus der Galerie
    Then das ausgewaehlte Bild wird im Chat angezeigt
    And das Bild kann gesendet werden

  @@regression @@negative
  Scenario: Berechtigung zur Galerie wird verweigert
    # Error Scenario: Galeriezugriff ohne Berechtigung zeigt Hinweis und Option
    Given die App hat keine Berechtigung zur Geraete-Galerie
    When ich versuche die Galerie zu oeffnen
    Then ich sehe eine klare Hinweisnachricht
    And ich sehe eine Option, die Berechtigung zu erteilen

  @@regression @@negative @@edge-case
  Scenario: Leere Galerie oder keine unterstuetzten Dateitypen
    # Edge Case: Galerie ist leer oder enthaelt keine unterstuetzten Dateien
    Given die App hat Berechtigung zur Geraete-Galerie
    When ich oeffne die Medienauswahl
    Then ich erhalte eine informative Meldung
    And die Auswahl bleibt leer ohne App-Absturz

  @@regression @@edge-case
  Scenario Outline: Galerieinhalt mit Grenzbedingungen fuer Dateitypen
    # Boundary: Unterstuetzte vs. nicht unterstuetzte Dateitypen werden korrekt behandelt
    Given die App hat Berechtigung zur Geraete-Galerie
    And die Galerie enthaelt eine Datei vom Typ <file_type>
    When ich oeffne die Medienauswahl
    Then <expected_result>

    Examples:
      | file_type | expected_result |
      | jpg | die Datei wird in der Auswahl angezeigt |
      | png | die Datei wird in der Auswahl angezeigt |
      | tiff | die Datei wird nicht angezeigt und es erscheint eine informative Meldung |
