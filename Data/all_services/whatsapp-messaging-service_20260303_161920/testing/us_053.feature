@@smoke @@regression
Feature: Kamera-Integration im Chat
  As a Chat-Nutzer
  I want to im Chat direkt auf die Kamera zugreifen und ein Foto aufnehmen und senden
  So that schnell und intuitiv visuelle Informationen teilen zu können, ohne die App zu verlassen

  Background:
    Given der Nutzer ist in der Chat-Ansicht angemeldet

  @@smoke @@regression @@happy-path
  Scenario: Foto aufnehmen und im Chat als Vorschau anzeigen
    # Happy Path: Kamera ist verfügbar und Foto kann aufgenommen werden
    Given der Nutzer befindet sich in einem aktiven Chat und die Kamera-Berechtigung ist erteilt
    When der Nutzer öffnet die Kamera-Funktion im Chat und nimmt ein Foto auf
    Then das Foto wird im Chat als Vorschau angezeigt
    And der Nutzer kann das Foto senden

  @@regression @@negative
  Scenario: Kamera-Berechtigung erforderlich
    # Error Scenario: Zugriff ohne Berechtigung ist nicht möglich
    Given der Nutzer befindet sich in einem aktiven Chat und die Kamera-Berechtigung ist nicht erteilt
    When der Nutzer öffnet die Kamera-Funktion im Chat
    Then ein Berechtigungsdialog wird angezeigt
    And ohne Zustimmung wird kein Kamerazugriff ermöglicht

  @@regression @@negative
  Scenario: Kamera durch andere App belegt
    # Error Scenario: Kamera kann nicht geöffnet werden, wenn sie belegt ist
    Given der Nutzer befindet sich in einem aktiven Chat und die Kamera ist durch eine andere App belegt
    When der Nutzer öffnet die Kamera-Funktion im Chat
    Then eine verständliche Fehlermeldung wird angezeigt
    And der Nutzer kann den Vorgang abbrechen oder erneut versuchen

  @@regression @@negative @@edge
  Scenario: Kamera-Berechtigung wird während der Nutzung entzogen
    # Edge Case: Berechtigung wird im Betrieb entzogen
    Given der Nutzer befindet sich in einem aktiven Chat und die Kamera-Berechtigung ist erteilt
    When die Kamera-Berechtigung wird während der geöffneten Kamera-Ansicht entzogen
    Then die Kamera-Ansicht wird geschlossen und ein Hinweis zur fehlenden Berechtigung angezeigt
    And es wird kein Foto aufgenommen

  @@regression @@boundary
  Scenario: Fotoaufnahme bei minimaler verfügbaren Systemressourcen
    # Boundary Condition: App reagiert bei niedrigen Ressourcen stabil
    Given der Nutzer befindet sich in einem aktiven Chat und die Kamera-Berechtigung ist erteilt
    When der Nutzer öffnet die Kamera-Funktion im Chat bei niedrigen Systemressourcen
    Then die App zeigt eine verständliche Meldung, falls die Kamera nicht initialisiert werden kann
    And der Nutzer kann den Vorgang erneut versuchen, sobald Ressourcen verfügbar sind

  @@regression @@happy-path
  Scenario Outline: Datengetriebene Kamera-Auswahl
    # Scenario Outline: Nutzer verwendet unterschiedliche Kameraausrichtungen
    Given der Nutzer befindet sich in einem aktiven Chat und die Kamera-Berechtigung ist erteilt
    When der Nutzer öffnet die Kamera-Funktion im Chat und wählt die <camera_type> Kamera
    Then die Vorschau wird für die <camera_type> Kamera angezeigt
    And ein aufgenommenes Foto wird im Chat als Vorschau angezeigt

    Examples:
      | camera_type |
      | Front |
      | Rear |
