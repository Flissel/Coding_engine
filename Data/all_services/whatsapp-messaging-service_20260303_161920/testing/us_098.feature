@smoke @regression
Feature: Schnellantworten verwalten
  As a Business-Administrator
  I want to vordefinierte Schnellantworten erstellen und verwalten
  So that Kundenanfragen schneller und konsistent beantworten und die Kommunikation professionalisieren

  Background:
    Given der Business-Administrator ist angemeldet

  @smoke @regression @happy-path
  Scenario: Schnellantwort erfolgreich erstellen und in Nachricht einfügen
    # Prüft den erfolgreichen Erstellungsfluss und die Verfügbarkeit in Nachrichten
    Given der Business-Administrator befindet sich im Bereich Nachrichten
    When er eine neue Schnellantwort mit gültigem Titel und Text speichert
    Then wird die Schnellantwort in der Liste angezeigt
    And sie kann in einer Nachricht eingefügt werden

  @regression @negative @error
  Scenario: Schnellantwort ohne Text wird abgelehnt
    # Validiert die Pflichtfeldprüfung für den Text
    Given der Business-Administrator ist im Bereich Schnellantworten
    When er versucht, eine Schnellantwort ohne Text zu speichern
    Then wird das Speichern verhindert
    And eine verständliche Fehlermeldung wird angezeigt

  @regression @happy-path
  Scenario: Bestehende Schnellantwort löschen
    # Stellt sicher, dass gelöschte Schnellantworten nicht mehr verfügbar sind
    Given der Business-Administrator hat eine bestehende Schnellantwort ausgewählt
    When er die Schnellantwort löscht
    Then wird sie aus der Liste entfernt
    And sie steht nicht mehr zur Auswahl in Nachrichten

  @regression @edge @boundary
  Scenario Outline: Schnellantwort erstellen mit Grenzwerten für Titel und Text
    # Prüft die Verarbeitung von minimalen und maximalen Längen
    Given der Business-Administrator befindet sich im Bereich Nachrichten
    When er eine neue Schnellantwort mit Titel "<title>" und Text "<text>" speichert
    Then wird die Schnellantwort in der Liste angezeigt
    And sie kann in einer Nachricht eingefügt werden

    Examples:
      | title | text |
      | A | Danke |
      | MaxTitleLength | MaxTextLength |

  @regression @negative @edge
  Scenario Outline: Schnellantwort speichern mit nur Leerzeichen im Text
    # Validiert die Eingabevalidierung für leere Inhalte
    Given der Business-Administrator ist im Bereich Schnellantworten
    When er eine neue Schnellantwort mit Text "<text>" speichert
    Then wird das Speichern verhindert
    And eine verständliche Fehlermeldung wird angezeigt

    Examples:
      | text |
      |     |
      | 
	 |
