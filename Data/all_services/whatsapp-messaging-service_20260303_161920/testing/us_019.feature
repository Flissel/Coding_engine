@@smoke @@regression
Feature: Einmal-Ansicht Medien
  As a registrierter Nutzer
  I want to View-Once-Medien senden und empfangen
  So that dass vertrauliche Inhalte nur einmal angezeigt werden und dadurch Datenschutz und Sicherheit gewahrt bleiben

  Background:
    Given der Nutzer und der Empfänger sind registriert und angemeldet
    And der Empfänger ist als Kontakt des Nutzers verfügbar

  @@smoke @@regression @@happy-path
  Scenario: View-Once-Medium wird genau einmal angezeigt
    # Happy path: Empfänger öffnet das View-Once-Medium einmal und es wird danach gesperrt
    Given der Nutzer hat ein View-Once-Medium ausgewählt
    And der Empfänger ist erreichbar
    When der Nutzer das Medium sendet
    And der Empfänger das Medium öffnet
    Then wird das Medium genau einmal angezeigt
    And das Medium wird als nicht erneut abrufbar markiert

  @@regression @@negative @@edge
  Scenario: Erneutes Öffnen oder Weiterleiten wird verweigert
    # Edge case: Zugriff nach Verbrauch des View-Once-Mediums wird blockiert
    Given ein View-Once-Medium wurde bereits geöffnet
    When der Empfänger versucht das Medium erneut zu öffnen oder weiterzuleiten
    Then wird der Zugriff verweigert
    And eine Hinweisnachricht wird angezeigt

  @@regression @@negative
  Scenario: Fehlgeschlagene Zustellung markiert Medium nicht als geöffnet
    # Error scenario: Zustellung schlägt fehl und das Medium bleibt unverbraucht
    Given die Nachrichtenzustellung ist fehlgeschlagen
    When der Nutzer ein View-Once-Medium sendet
    Then erhält der Nutzer eine Fehlermeldung
    And das Medium wird nicht als geöffnet oder verbraucht markiert

  @@regression @@edge @@boundary
  Scenario: Mehrfaches Öffnen in schneller Folge wird genau einmal gezählt
    # Boundary condition: parallele Öffnungsversuche zählen nur einmal
    Given ein View-Once-Medium wurde an den Empfänger zugestellt
    When der Empfänger das Medium in kurzer Folge mehrfach zu öffnen versucht
    Then wird das Medium nur einmal angezeigt
    And alle weiteren Öffnungsversuche werden blockiert

  @@regression @@negative
  Scenario Outline: Szenario-Outline: Öffnen nach Zustellstatus
    # Data-driven tests für unterschiedliche Zustellzustände
    Given der Nutzer hat ein View-Once-Medium ausgewählt
    And der Zustellstatus ist "<status>"
    When der Nutzer das Medium sendet
    Then <erwartung>
    And <markierung>

    Examples:
      | status | erwartung | markierung |
      | zugestellt | kann der Empfänger das Medium einmal öffnen | wird das Medium nach dem Öffnen als nicht erneut abrufbar markiert |
      | fehlgeschlagen | erhält der Nutzer eine Fehlermeldung | bleibt das Medium als nicht geöffnet markiert |
