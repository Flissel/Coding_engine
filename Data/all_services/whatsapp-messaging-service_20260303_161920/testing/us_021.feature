@@smoke @@regression
Feature: US-021 Broadcast-Listen Versand
  As a Business-Kommunikationsverantwortlicher
  I want to eine Broadcast-Liste erstellen und eine Massen-Nachricht an mehrere Empfänger senden
  So that damit Informationen schnell, zuverlässig und datenschutzkonform an viele Kontakte verteilt werden können

  Background:
    Given der Nutzer ist authentifiziert und hat Berechtigung zum Broadcast-Versand

  @@smoke @@regression @@happy-path
  Scenario: Erfolgreicher Versand an gültige Broadcast-Liste
    # Happy path: Nachricht wird an alle gültigen Empfänger zugestellt und Status angezeigt
    Given eine gültige Broadcast-Liste mit mehreren Empfängern existiert
    When der Nutzer sendet eine Nachricht an die Broadcast-Liste
    Then die Nachricht wird zuverlässig an alle Empfänger zugestellt
    And der Versandstatus wird für jeden Empfänger angezeigt

  @@regression @@negative
  Scenario: Versand wird bei leerer Liste verhindert
    # Error: leere Broadcast-Liste blockiert den Versand
    Given eine Broadcast-Liste ohne Empfänger existiert
    When der Nutzer versucht eine Nachricht zu senden
    Then der Versand wird verhindert
    And eine verständliche Fehlermeldung wird angezeigt

  @@regression @@negative
  Scenario: Versand wird bei ungültigen Empfängern verhindert
    # Error: Liste enthält nur ungültige Empfänger
    Given eine Broadcast-Liste enthält ausschließlich ungültige Empfänger
    When der Nutzer versucht eine Nachricht zu senden
    Then der Versand wird verhindert
    And eine verständliche Fehlermeldung wird angezeigt

  @@regression @@negative @@boundary
  Scenario: Rate-Limit wird überschritten und Versand verzögert oder blockiert
    # Edge/Boundary: Versand reagiert auf Rate-Limiting und informiert den Nutzer
    Given eine Broadcast-Liste mit Empfängeranzahl über dem konfigurierten Rate-Limit existiert
    When der Nutzer startet den Versand
    Then der Versand wird gemäß Rate-Limiting verzögert oder blockiert
    And der Nutzer wird über die Rate-Limitierung informiert

  @@regression @@boundary
  Scenario: Boundary: Empfängeranzahl entspricht exakt dem Rate-Limit
    # Boundary: Versand sollte ohne Rate-Limit-Verzögerung innerhalb der Grenze erfolgen
    Given eine Broadcast-Liste mit Empfängeranzahl gleich dem konfigurierten Rate-Limit existiert
    When der Nutzer sendet eine Nachricht an die Broadcast-Liste
    Then der Versand startet ohne Rate-Limit-Blockierung
    And der Versandstatus wird angezeigt

  @@regression @@negative @@edge
  Scenario Outline: Scenario Outline: Validierung der Empfängerlistenqualität
    # Data-driven: verschiedene Listenqualitäten und erwartete Ergebnisse
    Given eine Broadcast-Liste mit <liste_typ> existiert
    When der Nutzer versucht eine Nachricht zu senden
    Then <erwartetes_verhalten>
    And <erwartete_nutzerinfo>

    Examples:
      | liste_typ | erwartetes_verhalten | erwartete_nutzerinfo |
      | gemischten gültigen und ungültigen Empfängern | der Versand wird nur an gültige Empfänger durchgeführt | der Nutzer wird über übersprungene ungültige Empfänger informiert |
      | doppelten Empfängern | der Versand wird pro Empfänger nur einmal durchgeführt | der Nutzer sieht einen bereinigten Versandstatus |
