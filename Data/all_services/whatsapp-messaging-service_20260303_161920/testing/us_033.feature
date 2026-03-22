@smoke @regression
Feature: Umfragen im Chat erstellen und senden
  As a registrierter Nutzer
  I want to eine Umfrage in einem Gruppen- oder Einzelchat erstellen und senden
  So that schnell Feedback einzuholen und Entscheidungen effizient abzustimmen

  Background:
    Given der Nutzer ist registriert und im Chat-System angemeldet

  @happy-path @smoke @regression
  Scenario: Umfrage im Gruppenchat erfolgreich senden
    # Happy Path: Eine Umfrage mit mindestens zwei Antwortoptionen wird im Gruppenchat gesendet und ist abstimmbar
    Given der Nutzer befindet sich in einem Gruppenchat mit mehreren Mitgliedern
    When er erstellt eine Umfrage mit der Frage und mindestens zwei Antwortoptionen und sendet sie
    Then die Umfrage wird im Chat angezeigt
    And alle Gruppenmitglieder können abstimmen

  @happy-path @regression
  Scenario: Umfrage im Einzelchat erfolgreich senden
    # Happy Path: Eine Umfrage wird im Einzelchat gesendet und der Gegenüber kann abstimmen
    Given der Nutzer befindet sich in einem Einzelchat
    When er erstellt eine Umfrage mit der Frage und mindestens zwei Antwortoptionen und sendet sie
    Then die Umfrage wird im Chat angezeigt
    And der Gegenüber kann abstimmen

  @negative @regression
  Scenario: Umfrage ohne Antwortoptionen kann nicht gesendet werden
    # Error Scenario: Das Senden einer Umfrage ohne Optionen wird verhindert
    Given der Nutzer befindet sich in einem Gruppenchat oder Einzelchat
    When er erstellt eine Umfrage ohne Antwortoptionen und versucht sie zu senden
    Then er erhält eine Fehlermeldung
    And die Umfrage wird nicht gesendet

  @edge @regression
  Scenario: Umfrage mit exakt zwei Antwortoptionen senden
    # Boundary Condition: Minimale gültige Anzahl von Antwortoptionen
    Given der Nutzer befindet sich in einem Gruppenchat
    When er erstellt eine Umfrage mit genau zwei Antwortoptionen und sendet sie
    Then die Umfrage wird im Chat angezeigt
    And alle Gruppenmitglieder können abstimmen

  @edge @regression
  Scenario Outline: Umfrage mit variabler Anzahl Antwortoptionen
    # Scenario Outline: Umfragen mit verschiedenen gültigen Antwortoptionen werden erfolgreich gesendet
    Given der Nutzer befindet sich in einem Gruppenchat
    When er erstellt eine Umfrage mit der Frage "<frage>" und den Antwortoptionen <optionen> und sendet sie
    Then die Umfrage wird im Chat angezeigt
    And alle Gruppenmitglieder können abstimmen

    Examples:
      | frage | optionen |
      | Welches Datum passt? | 2 |
      | Welches Feature zuerst? | 4 |
      | Bevorzugte Uhrzeit? | 6 |
