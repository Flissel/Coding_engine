@@smoke @@regression
Feature: Chat archivieren
  As a Endnutzer
  I want to einen Chat archivieren
  So that damit ich meine aktiven Unterhaltungen uebersichtlich halte und Inhalte datenschutzkonform aufraeumen kann

  Background:
    Given der Nutzer ist angemeldet und die Chatliste ist geladen

  @@smoke @@regression @@happy-path
  Scenario: Archivierung eines einzelnen Chats aus der aktiven Liste
    # Happy Path: Ein vorhandener aktiver Chat wird erfolgreich archiviert
    Given ein aktiver Chat mit dem Namen "Team-Status" ist in der Chatliste sichtbar
    When der Nutzer waehlt die Funktion "Archivieren" fuer diesen Chat
    Then der Chat ist nicht mehr in der aktiven Liste sichtbar
    And der Chat ist im Archiv sichtbar

  @@regression @@edge-case
  Scenario: Archivierte Chats werden in der aktiven Liste nicht angezeigt
    # Edge Case: Bereits archivierte Chats bleiben aus der aktiven Liste ausgeschlossen
    Given ein Chat mit dem Namen "Projekt-Alt" ist archiviert
    When der Nutzer die aktive Chatliste aufruft
    Then der Chat "Projekt-Alt" ist in der aktiven Liste nicht sichtbar
    And der Chat ist weiterhin im Archiv sichtbar

  @@regression @@negative
  Scenario: Archivierung schlaegt fehl wegen technischem Fehler
    # Error Scenario: Bei einem technischen Fehler bleibt der Chat aktiv und es erscheint eine Fehlermeldung
    Given ein aktiver Chat mit dem Namen "Support" ist in der Chatliste sichtbar
    When der Nutzer versucht den Chat zu archivieren und der Archivierungsdienst antwortet mit einem Fehler
    Then eine Fehlermeldung wird dem Nutzer angezeigt
    And der Chat bleibt in der aktiven Liste sichtbar

  @@regression @@boundary
  Scenario: Archivierung mehrerer Chats nacheinander
    # Boundary Condition: Mehrere Archivierungen in Folge funktionieren konsistent
    Given die folgenden aktiven Chats sind in der Chatliste sichtbar: "A", "B", "C"
    When der Nutzer archiviert nacheinander die Chats "A" und "B"
    Then die Chats "A" und "B" sind nicht mehr in der aktiven Liste sichtbar
    And die Chats "A" und "B" sind im Archiv sichtbar und "C" bleibt aktiv

  @@regression @@happy-path
  Scenario Outline: Archivierung unterschiedlicher Chattypen
    # Scenario Outline: Archivierung funktioniert fuer verschiedene Chattypen
    Given ein aktiver <chat_typ> Chat mit dem Namen <chat_name> ist in der Chatliste sichtbar
    When der Nutzer waehlt "Archivieren" fuer diesen Chat
    Then der Chat <chat_name> ist nicht mehr in der aktiven Liste sichtbar
    And der Chat <chat_name> ist im Archiv sichtbar

    Examples:
      | chat_typ | chat_name |
      | Einzel | "Direktnachricht" |
      | Gruppen | "Projektteam" |

  @@regression @@boundary
  Scenario: Archivierung bei minimalem Listeninhalt
    # Boundary Condition: Archivierung funktioniert, wenn nur ein aktiver Chat vorhanden ist
    Given genau ein aktiver Chat mit dem Namen "Einziger" ist in der Chatliste sichtbar
    When der Nutzer archiviert den Chat
    Then die aktive Chatliste ist leer
    And der Chat "Einziger" ist im Archiv sichtbar
