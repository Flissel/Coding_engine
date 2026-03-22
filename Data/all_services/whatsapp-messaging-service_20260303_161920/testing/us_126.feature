@smoke @regression
Feature: Lokale Sticker
  As a registrierter Nutzer
  I want to ein regionalspezifisches Sticker-Pack auswählen und im Chat verwenden
  So that um lokal relevante Inhalte auszudrücken und die Kommunikation persönlicher zu gestalten

  Background:
    Given der Nutzer ist registriert und im Chat angemeldet
    And die Region des Nutzers ist erfolgreich ermittelt

  @@smoke @@regression @@happy-path
  Scenario: Regionale Sticker-Packs werden bei der Suche angezeigt
    # Happy path: passende regionale Packs werden angezeigt
    Given der Nutzer befindet sich im Sticker-Bereich
    When der Nutzer nach Stickern sucht
    Then werden regionalspezifische Sticker-Packs passend zur Region angezeigt
    And die angezeigten Packs enthalten mindestens ein Sticker-Preview

  @@smoke @@regression @@happy-path
  Scenario: Sticker aus regionalem Pack wird im Chat korrekt gesendet
    # Happy path: Versand und Anzeige eines Stickers
    Given der Nutzer hat ein regionalspezifisches Sticker-Pack ausgewählt
    When der Nutzer sendet einen Sticker im Chat
    Then wird der Sticker im Chat korrekt angezeigt
    And der Empfänger erhält den Sticker

  @@regression @@edge
  Scenario: Keine regionalen Packs verfügbar
    # Edge case: Region ohne verfügbare Packs
    Given für die Region des Nutzers sind keine Sticker-Packs verfügbar
    When der Nutzer den Sticker-Bereich öffnet
    Then wird eine verständliche Hinweismeldung angezeigt
    And es werden alternative allgemeine Sticker-Packs angeboten

  @@regression @@boundary
  Scenario: Sticker-Suche mit leerem Suchbegriff
    # Boundary condition: leere Suche zeigt Standard-Packs
    Given der Nutzer befindet sich im Sticker-Bereich
    When der Nutzer führt eine Suche mit leerem Suchbegriff aus
    Then werden Standard- und regionalspezifische Sticker-Packs angezeigt
    And die Ergebnisliste ist nicht leer

  @@regression @@negative
  Scenario: Sticker-Versand schlägt wegen Netzwerkfehler fehl
    # Error scenario: Versandfehler wird abgefangen
    Given der Nutzer hat ein regionalspezifisches Sticker-Pack ausgewählt
    And eine Netzwerkunterbrechung liegt vor
    When der Nutzer sendet einen Sticker im Chat
    Then wird eine Fehlermeldung zum Versand angezeigt
    And der Sticker wird nicht als gesendet markiert

  @@regression @@data-driven
  Scenario Outline: Regionale Suche nach unterschiedlichen Regionen
    # Scenario outline: datengetriebene Prüfung regionaler Packs
    Given die Region des Nutzers ist <region>
    And der Nutzer befindet sich im Sticker-Bereich
    When der Nutzer nach Stickern sucht
    Then werden Sticker-Packs für <region> angezeigt

    Examples:
      | region |
      | Bayern |
      | Berlin |
      | Hamburg |
