@smoke @regression
Feature: Lesebestaetigung konfigurieren
  As a Business-Admin
  I want to Lesebestaetigungen fuer Nachrichten konfigurieren (aktivieren, deaktivieren oder pro Kanal steuern)
  So that um Transparenz ueber zugestellte und gelesene Nachrichten zu erhalten und die Kommunikation mit Kunden zu optimieren

  Background:
    Given der Business-Admin ist eingeloggt
    And der Business-Admin befindet sich in den Nachrichteneinstellungen

  @@smoke @@regression @@happy-path
  Scenario: Globale Lesebestaetigung aktivieren
    # Happy path: globale Aktivierung erzeugt Lesebestaetigungen fuer neue Nachrichten
    Given die Lesebestaetigung ist global deaktiviert
    When der Business-Admin aktiviert die Lesebestaetigung global
    And er speichert die Einstellung
    Then werden Lesebestaetigungen fuer alle neuen Nachrichten erzeugt
    And die Lesebestaetigungen werden in der Nachrichtenansicht angezeigt

  @@regression @@happy-path
  Scenario: Lesebestaetigung pro Kanal deaktivieren
    # Happy path: Deaktivierung fuer einen Kanal laesst andere Kanaele unveraendert
    Given die Lesebestaetigung ist global aktiv
    And die Kanaele E-Mail und SMS sind verfuegbar
    When der Business-Admin deaktiviert die Lesebestaetigung fuer den Kanal SMS
    And er speichert die Einstellung
    Then werden fuer den Kanal SMS keine Lesebestaetigungen mehr erzeugt
    And werden fuer den Kanal E-Mail weiterhin Lesebestaetigungen erzeugt

  @@regression @@negative
  Scenario: Aenderung speichern bei Netzwerkstoerung
    # Error scenario: Netzwerkstoerung zeigt Fehlermeldung und laesst Konfiguration unveraendert
    Given die Lesebestaetigung ist global aktiv
    And eine Netzwerkstoerung liegt vor
    When der Business-Admin deaktiviert die Lesebestaetigung global
    And er speichert die Einstellung
    Then wird eine Fehlermeldung angezeigt
    And die vorherige Konfiguration bleibt unveraendert

  @@regression @@edge @@boundary
  Scenario Outline: Lesebestaetigung pro Kanal steuern mit Datenvariationen
    # Edge cases und Boundary: prueft Kanaele und Startzustand mit Szenario-Outline
    Given die Lesebestaetigung ist global <global_status>
    And der Kanal <channel> ist verfuegbar
    When der Business-Admin setzt die Lesebestaetigung fuer den Kanal <channel> auf <channel_status>
    And er speichert die Einstellung
    Then werden fuer den Kanal <channel> Lesebestaetigungen <expected_generation>
    And andere Kanaele bleiben unveraendert

    Examples:
      | global_status | channel | channel_status | expected_generation |
      | aktiv | E-Mail | deaktiviert | nicht mehr erzeugt |
      | aktiv | SMS | aktiviert | weiterhin erzeugt |
      | deaktiviert | Push | aktiviert | nur fuer diesen Kanal erzeugt |
