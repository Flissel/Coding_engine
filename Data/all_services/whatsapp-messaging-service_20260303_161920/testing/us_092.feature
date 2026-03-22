@@smoke @@regression
Feature: Chat exportieren
  As a Business-Nutzer
  I want to einen einzelnen Chat exportieren
  So that um Kommunikation revisionssicher zu dokumentieren und bei Bedarf weiterzugeben

  Background:
    Given der Business-Nutzer ist authentifiziert

  @@smoke @@regression @@happy-path
  Scenario: Erfolgreicher Export eines einzelnen Chats
    # Happy path: Export wird erstellt und zum Download angeboten
    Given der Nutzer hat Zugriff auf einen bestehenden Chat
    When er den Export für diesen Chat auslöst
    Then wird der Chat als Datei im unterstützten Format erstellt
    And der Download wird dem Nutzer angeboten

  @@regression @@edge-case
  Scenario: Export enthält alle Nachrichten und Medien in korrekter Reihenfolge
    # Edge case: viele Nachrichten und verschiedene Medientypen
    Given der Chat enthält viele Nachrichten und verschiedene Medientypen
    When der Nutzer den Export ausführt
    Then alle Nachrichten sind in korrekter Reihenfolge enthalten
    And alle zulässigen Medienreferenzen sind vollständig enthalten

  @@negative @@regression
  Scenario: Export wird verweigert ohne Berechtigung
    # Error scenario: fehlende Berechtigung
    Given der Nutzer hat keine Berechtigung für den ausgewählten Chat
    When er versucht den Export zu starten
    Then wird der Export verweigert
    And eine verständliche Fehlermeldung wird angezeigt

  @@regression @@boundary
  Scenario Outline: Export in unterstützten Dateiformaten
    # Boundary condition: erlaubte Exportformate
    Given der Nutzer hat Zugriff auf einen bestehenden Chat
    When er den Export im Format <format> auslöst
    Then wird der Chat als Datei im Format <format> erstellt
    And der Download wird dem Nutzer angeboten

    Examples:
      | format |
      | PDF |
      | CSV |

  @@regression @@boundary
  Scenario Outline: Export bei maximaler Nachrichtenanzahl
    # Boundary condition: maximal unterstützte Nachrichtenanzahl
    Given der Chat enthält <message_count> Nachrichten
    When der Nutzer den Export ausführt
    Then der Export wird erfolgreich erstellt
    And alle <message_count> Nachrichten sind im Export enthalten

    Examples:
      | message_count |
      | 1 |
      | 10000 |
