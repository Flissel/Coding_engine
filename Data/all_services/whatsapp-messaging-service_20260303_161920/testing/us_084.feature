@@smoke @@regression
Feature: Gruppen-Einladungen Berechtigungen
  As a Gruppenadministrator
  I want to festlegen, wer Mitglieder zu einer Gruppe hinzufuegen darf
  So that Datenschutz und Sicherheit zu erhoehen und Missbrauch zu verhindern

  Background:
    Given eine bestehende Gruppe mit mindestens einem Administrator und einem normalen Mitglied

  @@smoke @@regression @@happy-path
  Scenario: Administrator setzt Einladungen auf 'Nur Administratoren duerfen hinzufuegen'
    # Happy path: Administrator aktiviert die restriktive Berechtigung
    Given der Gruppenadministrator ist angemeldet
    When der Administrator die Berechtigung auf 'Nur Administratoren duerfen hinzufuegen' setzt
    Then die Gruppenberechtigung wird gespeichert
    And nur Administratoren koennen neue Mitglieder hinzufuegen

  @@regression @@negative
  Scenario: Normales Mitglied wird beim Hinzufuegen unter restriktiver Berechtigung abgelehnt
    # Error scenario: Mitglied versucht Einladungen trotz Admin-only Einstellung
    Given die Gruppe hat die Einstellung 'Nur Administratoren duerfen hinzufuegen'
    And ein normales Gruppenmitglied ist angemeldet
    When das Mitglied versucht, ein neues Mitglied hinzuzufuegen
    Then der Vorgang wird abgelehnt
    And eine klare Fehlermeldung wird angezeigt

  @@smoke @@regression @@happy-path
  Scenario: Mitglied kann bei 'Alle Mitglieder duerfen hinzufuegen' erfolgreich einladen
    # Happy path: Mitglied fuegt erfolgreich ein neues Mitglied hinzu
    Given die Gruppe hat die Einstellung 'Alle Mitglieder duerfen hinzufuegen'
    And ein Gruppenmitglied ist angemeldet
    When das Mitglied ein neues Mitglied hinzufuegt
    Then das Mitglied wird erfolgreich hinzugefuegt
    And die Gruppenmitgliederliste wird aktualisiert

  @@regression @@negative
  Scenario Outline: Einladung mit ungueltigen Zieldaten wird abgelehnt
    # Edge case: Ungueltige Eingaben beim Hinzufuegen pruefen
    Given die Gruppe hat die Einstellung 'Alle Mitglieder duerfen hinzufuegen'
    And ein Gruppenmitglied ist angemeldet
    When das Mitglied versucht, ein neues Mitglied mit ungueltigen Zieldaten hinzuzufuegen
    Then der Vorgang wird abgelehnt
    And eine Validierungsfehlermeldung wird angezeigt

    Examples:
      | invalid_target_data |
      | leere E-Mail-Adresse |
      | E-Mail-Adresse im falschen Format |
      | bereits existierendes Gruppenmitglied |

  @@regression @@boundary
  Scenario: Berechtigungswechsel wirksam fuer nachfolgende Einladungen
    # Boundary condition: Wechsel der Berechtigung wirkt sofort
    Given die Gruppe hat die Einstellung 'Alle Mitglieder duerfen hinzufuegen'
    And ein Gruppenadministrator ist angemeldet
    When der Administrator die Berechtigung auf 'Nur Administratoren duerfen hinzufuegen' setzt
    And ein normales Gruppenmitglied versucht danach, ein neues Mitglied hinzuzufuegen
    Then der Vorgang des normalen Mitglieds wird abgelehnt
    And eine klare Fehlermeldung wird angezeigt
