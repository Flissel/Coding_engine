@smoke @regression
Feature: Kanaele
  As a Business-Kommunikationsverantwortlicher
  I want to einen One-Way-Broadcast-Kanal erstellen und Nachrichten an Abonnenten senden
  So that um Kundeninformationen zuverlässig und datenschutzkonform breit zu verbreiten

  Background:
    Given das System ist verfügbar und der Nutzer ist angemeldet

  @@smoke @@regression @@happy-path
  Scenario: Erstellen und Senden einer Broadcast-Nachricht an alle Abonnenten
    # Happy path: verifizierter Business-Nutzer erstellt einen Kanal und sendet eine Nachricht
    Given der Nutzer ist als Business-Profil verifiziert und hat die Berechtigung zur Kanalverwaltung
    And es gibt Abonnenten, die den neuen Kanal abonnieren
    When der Nutzer erstellt einen One-Way-Broadcast-Kanal und veröffentlicht eine Nachricht
    Then die Nachricht wird erfolgreich an alle Abonnenten zugestellt
    And die Nachricht wird im Kanalverlauf angezeigt

  @@regression @@negative
  Scenario: Abonnent darf im One-Way-Broadcast-Kanal nicht posten
    # Error scenario: ein Abonnent versucht zu posten und wird blockiert
    Given es existiert ein One-Way-Broadcast-Kanal mit Abonnenten
    And der Nutzer ist als Abonnent ohne Senderrechte angemeldet
    When der Abonnent versucht, eine Nachricht in den Kanal zu posten
    Then die Aktion wird blockiert
    And der Abonnent erhält eine Meldung, dass nur der Kanalbetreiber senden darf

  @@regression @@negative
  Scenario: Broadcast-Nachricht ohne Berechtigung wird abgelehnt
    # Error scenario: Nutzer ohne Berechtigung versucht zu senden
    Given der Nutzer ist nicht zur Kanalverwaltung berechtigt
    When der Nutzer veröffentlicht eine Broadcast-Nachricht
    Then der Versand wird abgelehnt
    And ein Berechtigungsfehler wird protokolliert

  @@regression @@edge @@boundary
  Scenario Outline: Senden von Nachrichten mit variierenden Abonnentenzahlen
    # Edge/Boundary: Zustellung bei minimaler und großer Abonnentenzahl
    Given der Nutzer ist als Business-Profil verifiziert und hat die Berechtigung zur Kanalverwaltung
    And ein One-Way-Broadcast-Kanal existiert mit <abonnenten> Abonnenten
    When der Nutzer veröffentlicht eine Broadcast-Nachricht
    Then die Nachricht wird an <abonnenten> Abonnenten zugestellt
    And die Nachricht erscheint im Kanalverlauf

    Examples:
      | abonnenten |
      | 1 |
      | 10000 |

  @@regression @@boundary
  Scenario Outline: Erstellen eines Kanals mit minimalen Pflichtangaben
    # Boundary: Kanal wird mit minimalen Pflichtfeldern erstellt
    Given der Nutzer ist als Business-Profil verifiziert und hat die Berechtigung zur Kanalverwaltung
    When der Nutzer erstellt einen One-Way-Broadcast-Kanal mit <kanalname> als einzigem Pflichtfeld
    Then der Kanal wird erfolgreich erstellt
    And der Kanal ist als One-Way-Broadcast markiert

    Examples:
      | kanalname |
      | Info |
