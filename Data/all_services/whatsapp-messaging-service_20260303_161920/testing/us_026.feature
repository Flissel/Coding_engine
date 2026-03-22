@smoke @regression
Feature: Gruppe erstellen
  As a registrierter Nutzer
  I want to einen Gruppenchats erstellen und Teilnehmer hinzufügen
  So that um schnell und einfach mit mehreren Kontakten zu kommunizieren und die Zusammenarbeit zu verbessern

  Background:
    Given der Nutzer ist angemeldet und befindet sich in der Chat-Übersicht

  @happy-path @smoke @regression
  Scenario: Erfolgreiche Gruppenerstellung mit gültigen Teilnehmern
    # Happy path für das Erstellen eines Gruppenchats mit mindestens zwei Kontakten
    Given der Nutzer startet die Gruppenerstellung
    When er gibt den Gruppennamen "Projekt Alpha" ein und wählt mindestens zwei Kontakte aus
    And er tippt auf „Gruppe erstellen“
    Then der Gruppenchats wird erstellt
    And der Nutzer ist Gruppenadmin
    And der neue Chat erscheint in der Chat-Liste

  @negative @regression
  Scenario: Gruppenerstellung verhindert bei weniger als zwei Kontakten
    # Edge case für zu wenige ausgewählte Teilnehmer
    Given der Nutzer startet die Gruppenerstellung
    When er gibt einen Gruppennamen ein und wählt weniger als zwei Kontakte aus
    And er tippt auf „Gruppe erstellen“
    Then die Erstellung wird verhindert
    And eine verständliche Hinweismeldung wird angezeigt

  @negative @regression
  Scenario: Gruppenerstellung bei Zustellfehlern einzelner Einladungen
    # Error scenario für fehlgeschlagene Einladungen
    Given der Nutzer startet die Gruppenerstellung
    When er gibt einen Gruppennamen ein, wählt mindestens zwei Kontakte aus und tippt auf „Gruppe erstellen“
    And die Nachrichtenzustellung an einen oder mehrere Teilnehmer schlägt fehl
    Then der Gruppenchats wird trotzdem erstellt
    And der Nutzer wird über fehlgeschlagene Einladungen informiert
    And ein Statushinweis zu fehlgeschlagenen Einladungen ist sichtbar

  @regression
  Scenario Outline: Grenzwerte für minimale und maximale Teilnehmeranzahl
    # Boundary conditions für Teilnehmerauswahl
    Given der Nutzer startet die Gruppenerstellung
    When er gibt den Gruppennamen "<group_name>" ein und wählt <participant_count> Kontakte aus
    And er tippt auf „Gruppe erstellen“
    Then <expected_result>

    Examples:
      | group_name | participant_count | expected_result |
      | Minimale Gruppe | 2 | der Gruppenchats wird erstellt und erscheint in der Chat-Liste |
      | Maximale Gruppe | 50 | der Gruppenchats wird erstellt und erscheint in der Chat-Liste |
