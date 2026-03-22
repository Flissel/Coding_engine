@@smoke @@regression
Feature: Watch-App Notifications
  As a Endnutzer
  I want to Nachrichten und Benachrichtigungen über die Smartwatch empfangen und lesen
  So that um schnell und zuverlässig informiert zu sein und die Bedienung unterwegs einfach zu halten

  Background:
    Given der Nutzer ist in der App angemeldet

  @@smoke @@regression @@happy-path
  Scenario: Benachrichtigung wird innerhalb von 5 Sekunden auf der Smartwatch angezeigt
    # Happy path für die Zustellung einer neuen Nachricht an die gekoppelte Smartwatch
    Given die Smartwatch ist mit dem Konto gekoppelt und die Integration ist aktiviert
    And die Smartwatch ist verbunden
    When eine neue Nachricht im System eingeht
    Then wird innerhalb von 5 Sekunden eine Benachrichtigung auf der Smartwatch angezeigt

  @@regression @@happy-path
  Scenario: Anzeige von Absender, Zeitstempel und Vorschau bei mehreren neuen Nachrichten
    # Happy path für das Öffnen der Benachrichtigung mit korrekten Metadaten
    Given die Smartwatch ist verbunden
    And es liegen mehrere neue Nachrichten vor
    When der Nutzer die Benachrichtigung öffnet
    Then werden Absender, Zeitstempel und Vorschau der Nachricht korrekt angezeigt

  @@negative @@regression
  Scenario: Keine Smartwatch-Benachrichtigung bei fehlender Verbindung oder deaktivierter Integration
    # Error scenario für fehlende Verbindung oder deaktivierte Integration
    Given die Smartwatch ist nicht verbunden oder die Integration ist deaktiviert
    When eine neue Nachricht eingeht
    Then wird keine Smartwatch-Benachrichtigung gesendet
    And der Nutzer erhält eine Hinweismeldung in der App

  @@regression @@boundary
  Scenario: Grenzfall: Benachrichtigung wird exakt bei 5 Sekunden angezeigt
    # Boundary condition für die Zustellzeit
    Given die Smartwatch ist mit dem Konto gekoppelt und die Integration ist aktiviert
    And die Smartwatch ist verbunden
    When eine neue Nachricht im System eingeht
    Then wird die Benachrichtigung spätestens nach 5 Sekunden angezeigt

  @@regression @@edge-case
  Scenario: Mehrere neue Nachrichten werden korrekt in der Vorschau dargestellt
    # Edge case für verschiedene Absender und Zeitstempel
    Given die Smartwatch ist verbunden
    And mehrere neue Nachrichten mit unterschiedlichen Absendern und Zeitstempeln liegen vor
    When der Nutzer die Benachrichtigung öffnet
    Then werden Absender, Zeitstempel und Vorschau für jede neue Nachricht korrekt angezeigt

  @@regression @@outline
  Scenario Outline: Szenario Outline: Zustellzeit in Abhängigkeit der Nachrichtenzahl
    # Data-driven Test für unterschiedliche Mengen neuer Nachrichten
    Given die Smartwatch ist mit dem Konto gekoppelt und die Integration ist aktiviert
    And die Smartwatch ist verbunden
    And <anzahl> neue Nachrichten liegen vor
    When eine neue Nachricht im System eingeht
    Then wird innerhalb von 5 Sekunden eine Benachrichtigung auf der Smartwatch angezeigt

    Examples:
      | anzahl |
      | 1 |
      | 5 |
      | 20 |
