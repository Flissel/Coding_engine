@@smoke @@regression
Feature: Einladungslink fuer Gruppenbeitritt
  As a Gruppenadministrator
  I want to einen Einladungslink fuer eine Gruppe erzeugen und teilen
  So that damit neue Mitglieder einfach und sicher beitreten koennen

  Background:
    Given der Gruppenadministrator ist angemeldet und besitzt Adminrechte in der Gruppe

  @@smoke @@happy-path
  Scenario: Gueltigen Einladungslink erstellen und beitreten
    # Happy path: Administrator erstellt Link und Nutzer tritt der Gruppe bei
    When der Administrator einen Einladungslink fuer die Gruppe erstellt
    Then das System generiert einen eindeutigen gueltigen Einladungslink
    When ein Nutzer den Link oeffnet und den Beitritt bestaetigt
    Then der Nutzer wird der Gruppe hinzugefuegt
    And eine Bestaetigung wird angezeigt

  @@negative @@regression
  Scenario: Einladungslink ist abgelaufen oder widerrufen
    # Error scenario: Link ist ungueltig
    Given ein Einladungslink wurde erstellt und ist abgelaufen oder widerrufen
    When ein Nutzer den Link oeffnet
    Then das System verweigert den Beitritt
    And eine entsprechende Fehlermeldung wird angezeigt

  @@negative @@regression
  Scenario: Nicht-Admin versucht Einladungslink zu erzeugen
    # Error scenario: fehlende Adminrechte
    Given ein Benutzer ist angemeldet und besitzt keine Adminrechte in der Gruppe
    When der Benutzer versucht einen Einladungslink zu erstellen
    Then das System erstellt keinen Link
    And eine Berechtigungsfehlermeldung wird angezeigt

  @@regression @@edge-case
  Scenario Outline: Beitritt mit Link bei unterschiedlichen Link-Status
    # Edge case and boundary: unterschiedliche Link-Gueltigkeit
    Given ein Einladungslink mit Status <status> wurde erstellt
    When ein Nutzer den Link oeffnet und den Beitritt bestaetigt
    Then <ergebnis>
    And <hinweis>

    Examples:
      | status | ergebnis | hinweis |
      | gueltig | der Nutzer wird der Gruppe hinzugefuegt | eine Bestaetigung wird angezeigt |
      | gerade abgelaufen | das System verweigert den Beitritt | eine entsprechende Fehlermeldung wird angezeigt |
