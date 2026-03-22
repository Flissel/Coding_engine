@@smoke @@regression
Feature: Schneller App-Start
  As a Endnutzer
  I want to die App starten und schnell zur Startansicht gelangen
  So that um die App ohne Wartezeit zu nutzen und eine gute Nutzererfahrung zu haben

  Background:
    Given die App ist installiert

  @@smoke @@happy-path @@regression
  Scenario: Startansicht erscheint schnell bei stabiler Verbindung
    # Happy path: Startansicht innerhalb von 2 Sekunden bei stabiler Verbindung
    Given das Geraet hat eine stabile Internetverbindung
    When der Nutzer die App oeffnet
    Then erscheint die Startansicht innerhalb von 2 Sekunden
    And die Startansicht ist vollstaendig geladen

  @@regression @@edge
  Scenario: Kaltstart mit leerem Cache
    # Edge case: Kaltstart nach laengerer Inaktivitaet mit leerem Cache
    Given die App wurde seit dem letzten Start nicht geoeffnet
    And der Cache ist leer
    When der Nutzer die App startet
    Then erscheint die Startansicht innerhalb von 3 Sekunden

  @@negative @@regression
  Scenario: Start bei instabiler Verbindung zeigt lokale Ansicht
    # Error scenario: instabile Verbindung zeigt lokale Startansicht und Hinweis
    Given die Internetverbindung ist instabil
    When der Nutzer die App oeffnet
    Then wird eine lokale Startansicht innerhalb von 3 Sekunden angezeigt
    And der Nutzer erhaelt einen Hinweis auf die eingeschraenkte Verbindung

  @@regression @@boundary
  Scenario: Grenzwert: Startansicht erscheint exakt bei Zeitlimit
    # Boundary condition: Startansicht erscheint exakt zum Zeitlimit
    Given die App ist installiert und das Geraet hat eine stabile Internetverbindung
    When der Nutzer die App oeffnet
    Then erscheint die Startansicht genau nach 2 Sekunden

  @@regression @@outline
  Scenario Outline: Scenario Outline: Startzeiten fuer verschiedene Bedingungen
    # Data-driven test fuer Startzeitgrenzen bei unterschiedlichen Startbedingungen
    Given <precondition>
    When <action>
    Then <expected>
    And <additional_check>

    Examples:
      | precondition | action | expected | additional_check |
      | die App ist installiert und das Geraet hat eine stabile Internetverbindung | der Nutzer die App oeffnet | erscheint die Startansicht innerhalb von 2 Sekunden | keine Fehlermeldung wird angezeigt |
      | die App wurde seit dem letzten Start nicht geoeffnet und der Cache ist leer | der Nutzer die App startet | erscheint die Startansicht innerhalb von 3 Sekunden | keine Fehlermeldung wird angezeigt |
      | die Internetverbindung ist instabil | der Nutzer die App oeffnet | wird eine lokale Startansicht innerhalb von 3 Sekunden angezeigt | der Nutzer erhaelt einen Hinweis auf die eingeschraenkte Verbindung |
