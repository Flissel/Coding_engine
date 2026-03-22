@@smoke @@regression
Feature: Videos senden
  As a Endnutzer
  I want to ein Video in einer Nachricht senden
  So that damit ich Inhalte anschaulich teilen und schneller kommunizieren kann

  Background:
    Given ich bin angemeldet und habe eine bestehende Unterhaltung geöffnet

  @@smoke @@regression @@happy-path
  Scenario: Video erfolgreich senden mit Vorschau
    # Happy Path: unterstütztes Video wird hochgeladen und als Nachricht mit Vorschau zugestellt
    Given ich habe ein unterstütztes Video ausgewählt
    When ich sende das Video
    Then das Video wird hochgeladen und als Nachricht zugestellt
    And eine Vorschau des Videos wird angezeigt

  @@regression @@edge
  Scenario Outline: Unterstützte Videoformate und Größen senden
    # Edge Case: mehrere unterstützte Formate innerhalb des Limits werden korrekt gesendet
    Given ich wähle ein Video mit Format "<format>" und Größe "<size_mb>" MB aus
    When ich sende das Video
    Then das Video wird hochgeladen und als Nachricht mit Vorschau zugestellt

    Examples:
      | format | size_mb |
      | mp4 | 5 |
      | mov | 20 |
      | webm | 50 |

  @@regression @@negative
  Scenario Outline: Dateigröße überschreitet das maximale Limit
    # Error Scenario: Versand wird blockiert und Fehlermeldung mit Grenzen angezeigt
    Given ich wähle ein Video mit Größe "<size_mb>" MB aus, das das maximale Limit überschreitet
    When ich versuche, das Video zu senden
    Then der Versand wird blockiert
    And eine verständliche Fehlermeldung mit den zulässigen Grenzen wird angezeigt

    Examples:
      | size_mb |
      | 101 |
      | 500 |

  @@regression @@negative
  Scenario: Upload bricht aufgrund von Netzwerkverlust ab
    # Error Scenario: System zeigt fehlgeschlagenen Versand und Wiederholen-Option
    Given der Upload eines unterstützten Videos läuft
    When die Netzwerkverbindung während des Uploads abbricht
    Then der Versand wird als fehlgeschlagen angezeigt
    And eine Wiederholen-Option wird angeboten

  @@regression @@boundary
  Scenario Outline: Grenzwerte für maximale Dateigröße
    # Boundary Condition: Versand bei Grenzwerten wird korrekt gehandhabt
    Given das maximale Dateilimit beträgt "<max_mb>" MB
    When ich wähle ein Video mit Größe "<size_mb>" MB aus und sende es
    Then das System zeigt das Ergebnis "<result>"

    Examples:
      | max_mb | size_mb | result |
      | 100 | 100 | Upload erfolgreich und Nachricht mit Vorschau zugestellt |
      | 100 | 101 | Versand blockiert mit Fehlermeldung zu zulässigen Grenzen |
