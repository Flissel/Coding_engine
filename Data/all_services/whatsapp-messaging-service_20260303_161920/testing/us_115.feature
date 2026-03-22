@@smoke @@regression
Feature: Share-Extension
  As a Endnutzer
  I want to Inhalte über die systemweite Teilen-Funktion an das System senden
  So that eine einfache und sichere Nutzung ohne Plattformwechsel zu ermöglichen

  Background:
    Given die System-Sharing-Integration ist installiert und der Nutzer ist im System angemeldet

  @@smoke @@regression @@happy-path
  Scenario: Inhalt aus Dritt-App erfolgreich teilen und als Nachricht vorbereiten
    # Happy Path für das Teilen eines unterstützten Inhalts
    Given der Nutzer befindet sich in einer Dritt-App mit Teilen-Funktion und hat einen unterstützten Inhalt ausgewählt
    When der Nutzer die System-Sharing-Integration auswählt und den Inhalt teilt
    Then der Inhalt wird im System übernommen und als neue Nachricht vorbereitet
    And die Nachricht zeigt den geteilten Inhalt korrekt an

  @@regression @@edge
  Scenario: Mehrere Anhänge mit unterstützten und nicht unterstützten Dateitypen
    # Edge Case für gemischte Anhänge
    Given der Nutzer hat mehrere Anhänge ausgewählt, darunter unterstützte und nicht unterstützte Dateitypen
    When der Nutzer den Inhalt über die System-Sharing-Integration teilt
    Then alle unterstützten Anhänge werden übernommen
    And das System informiert über nicht unterstützte Dateitypen

  @@regression @@boundary
  Scenario: Sehr großer Inhalt wird geteilt
    # Boundary Condition für große Inhalte
    Given der Nutzer hat einen sehr großen unterstützten Inhalt ausgewählt
    When der Nutzer den Inhalt über die System-Sharing-Integration teilt
    Then der Inhalt wird übernommen und als neue Nachricht vorbereitet
    And das System bleibt bedienbar und zeigt den Fortschritt oder Abschluss an

  @@regression @@negative
  Scenario: System-Sharing-Integration nicht verfügbar
    # Error Scenario für fehlende Verfügbarkeit
    Given die System-Sharing-Integration ist nicht verfügbar
    When der Nutzer versucht den Inhalt zu teilen
    Then das System zeigt eine verständliche Fehlermeldung
    And das System bietet einen sicheren Abbruch an

  @@regression @@negative
  Scenario: Teilen mit fehlender Berechtigung
    # Error Scenario für fehlende Berechtigungen
    Given die Berechtigung für die System-Sharing-Integration fehlt
    When der Nutzer versucht den Inhalt zu teilen
    Then das System zeigt eine verständliche Fehlermeldung
    And das System bietet einen sicheren Abbruch an

  @@regression @@edge
  Scenario Outline: Teilen von Inhalten unterschiedlicher Größen und Dateitypen
    # Scenario Outline für datengetriebene Tests zu Dateityp-Unterstützung und Größe
    Given der Nutzer hat einen Inhalt vom Typ <file_type> mit Größe <size_mb> MB ausgewählt
    When der Nutzer den Inhalt über die System-Sharing-Integration teilt
    Then das System übernimmt den Inhalt entsprechend der Unterstützung <expected_support>
    And das System zeigt die entsprechende Rückmeldung <expected_message>

    Examples:
      | file_type | size_mb | expected_support | expected_message |
      | PDF | 5 | unterstützt | Nachricht vorbereitet |
      | ZIP | 20 | nicht unterstützt | Hinweis auf nicht unterstützten Dateityp |
      | JPEG | 100 | unterstützt | Nachricht vorbereitet |
