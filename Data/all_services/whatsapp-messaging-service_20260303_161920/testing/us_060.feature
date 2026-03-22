@@smoke @@regression
Feature: Kontakt blockieren
  As a registrierter Nutzer
  I want to einen Kontakt blockieren
  So that um unerwuenschte Kommunikation zu unterbinden und seine Privatsphaere zu schuetzen

  Background:
    Given der Nutzer ist eingeloggt

  @@smoke @@regression @@happy-path
  Scenario: Kontakt erfolgreich blockieren
    # Happy path: Ein bestehender Kontakt wird blockiert und kann keine Nachrichten mehr senden
    Given der Nutzer hat einen bestehenden Kontakt mit der ID "C-100"
    When der Nutzer waehlt fuer den Kontakt die Funktion "Blockieren" und bestaetigt
    Then der Kontakt mit der ID "C-100" ist blockiert
    And der Kontakt kann dem Nutzer keine Nachrichten mehr senden

  @@regression @@edge
  Scenario: Blockierter Kontakt kann keine Nachricht zustellen
    # Edge case: Ein blockierter Kontakt versucht zu senden und erhaelt eine Rueckmeldung
    Given der Kontakt mit der ID "C-200" ist blockiert
    When der blockierte Kontakt sendet eine Nachricht "Hallo"
    Then die Nachricht wird nicht zugestellt
    And der Absender erhaelt eine passende Rueckmeldung

  @@regression @@negative
  Scenario: Nicht existierenden Kontakt blockieren
    # Error scenario: Blockieraktion fuer nicht existierenden Kontakt zeigt Fehlermeldung
    Given es existiert kein Kontakt mit der ID "C-404"
    When der Nutzer sendet die Blockieraktion fuer die Kontakt-ID "C-404"
    Then es wird eine Fehlermeldung angezeigt
    And es erfolgt keine Aenderung an bestehenden Kontakten

  @@regression @@edge
  Scenario: Mehrfaches Blockieren desselben Kontakts
    # Boundary condition: Ein bereits blockierter Kontakt wird erneut blockiert
    Given der Kontakt mit der ID "C-300" ist bereits blockiert
    When der Nutzer blockiert den Kontakt mit der ID "C-300" erneut
    Then der Kontakt bleibt blockiert
    And es wird keine doppelte Blockierung angelegt

  @@regression @@happy-path
  Scenario Outline: Blockieren verschiedener Kontakte
    # Scenario Outline: Mehrere gueltige Kontakte werden blockiert
    Given der Nutzer hat einen bestehenden Kontakt mit der ID "<contact_id>"
    When der Nutzer waehlt fuer den Kontakt die Funktion "Blockieren" und bestaetigt
    Then der Kontakt mit der ID "<contact_id>" ist blockiert
    And der Kontakt kann dem Nutzer keine Nachrichten mehr senden

    Examples:
      | contact_id |
      | C-101 |
      | C-102 |
