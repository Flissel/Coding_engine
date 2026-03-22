@@smoke @@regression
Feature: Sticker senden im Chat
  As a registrierter Chat-Nutzer
  I want to Sticker in einem Chat auswaehlen und senden
  So that um Emotionen und Kontext schneller und intuitiver zu vermitteln

  Background:
    Given der Nutzer ist registriert und in einem aktiven Chat

  @@smoke @@regression @@happy-path
  Scenario: Sticker senden erfolgreich
    # Happy path: ausgewählter Sticker wird gesendet und angezeigt
    Given Sticker sind verfuegbar
    When der Nutzer oeffnet die Sticker-Auswahl
    And der Nutzer waehlt einen Sticker aus und tippt auf Senden
    Then der Sticker wird im Chat angezeigt
    And der Sticker wird beim Empfaenger zugestellt

  @@regression @@boundary
  Scenario: Sticker-Auswahl laedt ohne spuerbare Verzoegerung
    # Boundary: Ladezeit der Sticker-Auswahl bleibt innerhalb der UX-Grenze
    Given Sticker sind verfuegbar
    When der Nutzer oeffnet die Sticker-Auswahl
    Then die Sticker werden ohne spuerbare Verzoegerung geladen und angezeigt

  @@regression @@edge
  Scenario: Leere Sticker-Auswahl
    # Edge case: keine Sticker verfuegbar, Senden ist nicht moeglich
    Given die Sticker-Auswahl ist leer
    When der Nutzer oeffnet die Sticker-Auswahl
    Then eine leere Ansicht mit Hinweis wird angezeigt
    And das Senden von Stickern ist nicht moeglich

  @@regression @@negative @@error
  Scenario: Sticker senden mit Verbindungsabbruch
    # Error scenario: Sendvorgang fehlschlaegt und erneutes Senden ist moeglich
    Given Sticker sind verfuegbar
    When der Nutzer waehlt einen Sticker aus und startet den Sendvorgang
    And die Verbindung bricht waehrend des Sendens ab
    Then der Nutzer erhaelt eine Fehlermeldung
    And der Nutzer kann den Sticker erneut senden

  @@regression @@edge @@outline
  Scenario Outline: Sticker-Auswahl mit variabler Netzqualitaet
    # Scenario Outline: Ladeverhalten unter unterschiedlichen Netzbedingungen
    Given Sticker sind verfuegbar
    And die Netzqualitaet ist <netz>
    When der Nutzer oeffnet die Sticker-Auswahl
    Then die Sticker werden angezeigt und die Ladezeit bleibt innerhalb von <max_zeit_ms> ms

    Examples:
      | netz | max_zeit_ms |
      | gut | 500 |
      | mittel | 1000 |
      | schwach | 2000 |

  @@regression @@boundary @@outline
  Scenario Outline: Sticker senden mit verschiedenen Dateigroessen
    # Scenario Outline: Senden von Stickern an der Groessengrenze
    Given Sticker sind verfuegbar
    And der Sticker hat eine Dateigroesse von <size_kb> KB
    When der Nutzer waehlt den Sticker aus und tippt auf Senden
    Then der Sticker wird erfolgreich gesendet und angezeigt

    Examples:
      | size_kb |
      | 10 |
      | 256 |
      | 512 |
