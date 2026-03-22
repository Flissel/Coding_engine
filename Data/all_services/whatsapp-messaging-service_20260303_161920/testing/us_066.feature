@smoke @regression
Feature: Benachrichtigungsvorschau
  As a Kommunikationsmanager
  I want to konfigurierbare Benachrichtigungsvorschauen einsehen und anpassen
  So that Nachrichten vor dem Versand zuverlässig prüfen zu können, um eine professionelle Kommunikation sicherzustellen

  Background:
    Given der Kommunikationsmanager ist im Vorschau-Bereich der Benachrichtigungsvorlagen

  @@smoke @@regression @@happy-path
  Scenario: Vorschau zeigt aufgelöste Platzhalter für ausgewählte Vorlage
    # Happy path: Platzhalter werden gemäß aktueller Konfiguration aufgelöst
    Given eine Benachrichtigungsvorlage mit Platzhaltern ist ausgewählt
    And eine gültige Vorschau-Konfiguration mit Empfängerdaten ist hinterlegt
    When der Kommunikationsmanager die Vorschau öffnet
    Then das System zeigt eine Vorschau mit vollständig aufgelösten Platzhaltern an
    And die angezeigten Werte entsprechen der aktuellen Konfiguration

  @@regression @@edge
  Scenario: Nicht unterstützte Elemente werden markiert und als Fallback dargestellt
    # Edge case: Plattform unterstützt bestimmte Elemente nicht
    Given eine Vorschau-Konfiguration für eine Plattform ohne unterstützte Elemente ist gespeichert
    And die Vorlage enthält Elemente, die auf der Plattform nicht unterstützt werden
    When der Kommunikationsmanager die Vorschau aktualisiert
    Then das System kennzeichnet die nicht unterstützten Elemente deutlich
    And das System zeigt eine Fallback-Darstellung für diese Elemente an

  @@regression @@negative
  Scenario: Fehler beim Laden der Vorschau-Daten
    # Error scenario: Systemfehler verhindert das Laden der Vorschau
    Given die Vorschau-Daten können aufgrund eines Systemfehlers nicht geladen werden
    When der Kommunikationsmanager die Vorschau anfordert
    Then das System zeigt eine verständliche Fehlermeldung an
    And das System bietet eine Option zum erneuten Laden an

  @@regression @@data-driven
  Scenario Outline: Auflösung von Platzhaltern mit unterschiedlichen Datensätzen
    # Boundary condition: verschiedene Datensätze und minimale Werte
    Given eine Benachrichtigungsvorlage mit Platzhaltern ist ausgewählt
    And eine Vorschau-Konfiguration mit Empfängerdaten liegt vor
    When der Kommunikationsmanager die Vorschau öffnet
    Then das System löst alle Platzhalter gemäß den Empfängerdaten auf
    And die Vorschau wird ohne Kürzung der Inhalte angezeigt

    Examples:
      | recipient_name | recipient_email | message_length |
      | A | a@example.com | 1 |
      | Maximilian Mustermann | maximilian.mustermann@example.com | 5000 |

  @@regression @@data-driven
  Scenario Outline: Fallback-Darstellung bei gemischter Unterstützung pro Plattform
    # Boundary condition: Teilweise unterstützte Elemente
    Given eine Plattform mit teilweiser Element-Unterstützung ist ausgewählt
    And die Vorschau-Konfiguration enthält gemischte Elemente
    When der Kommunikationsmanager die Vorschau aktualisiert
    Then unterstützte Elemente werden normal angezeigt
    And nicht unterstützte Elemente werden markiert und als Fallback dargestellt

    Examples:
      | platform | unsupported_elements |
      | SMS | Bilder,Buttons |
      | Push | HTML-Tabellen |
