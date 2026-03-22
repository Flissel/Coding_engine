@smoke @regression
Feature: Gruppe verlassen
  As a Gruppenmitglied
  I want to eine Gruppe verlassen, ohne andere Mitglieder zu benachrichtigen
  So that damit meine Privatsphaere geschuetzt wird und die Bedienung einfach bleibt

  Background:
    Given der Benutzer ist angemeldet und befindet sich auf der Gruppenuebersichtsseite

  @happy-path @smoke @regression
  Scenario: Mitglied verlaesst Gruppe erfolgreich ohne Benachrichtigung
    # Happy Path: Mitgliedschaft wird entfernt und keine Benachrichtigung wird gesendet
    Given der Benutzer ist Mitglied der Gruppe "Reisegruppe"
    When der Benutzer waehlt die Option "Gruppe verlassen" und bestaetigt
    Then der Benutzer wird aus der Gruppe "Reisegruppe" entfernt
    And es wird keine Benachrichtigung an andere Gruppenmitglieder gesendet

  @edge-case @negative @regression
  Scenario: Benutzer ist kein Mitglied und versucht die Gruppe zu verlassen
    # Edge Case: Keine Aenderung, informative Meldung
    Given der Benutzer ist kein Mitglied der Gruppe "Sportverein"
    When der Benutzer versucht, die Gruppe "Sportverein" zu verlassen
    Then das System zeigt eine verstaendliche Meldung "Sie sind kein Mitglied dieser Gruppe"
    And es werden keine Aenderungen an Mitgliedschaften vorgenommen

  @error @negative @regression
  Scenario: Technischer Fehler beim Verlassen der Gruppe
    # Error Scenario: Fehler wird angezeigt und Mitgliedschaft bleibt bestehen
    Given der Benutzer ist Mitglied der Gruppe "Projektteam"
    When ein technischer Fehler tritt waehrend des Verlassens der Gruppe auf
    Then das System zeigt eine Fehlermeldung "Vorgang konnte nicht abgeschlossen werden"
    And der Benutzer bleibt weiterhin Mitglied der Gruppe "Projektteam"

  @boundary @regression
  Scenario: Gruppenname mit Sonderzeichen im Verlassen-Flow
    # Boundary Condition: Gruppenname mit Sonderzeichen wird korrekt verarbeitet
    Given der Benutzer ist Mitglied der Gruppe "QA-Team #1"
    When der Benutzer waehlt die Option "Gruppe verlassen" und bestaetigt
    Then der Benutzer wird aus der Gruppe "QA-Team #1" entfernt
    And es wird keine Benachrichtigung an andere Gruppenmitglieder gesendet

  @happy-path @regression
  Scenario Outline: Mehrere Gruppenmitgliedschaften, nur eine Gruppe verlassen
    # Scenario Outline: Nur die ausgewaehlte Gruppe wird verlassen
    Given der Benutzer ist Mitglied der Gruppen <gruppe_A> und <gruppe_B>
    When der Benutzer verlaesst die Gruppe <gruppe_A> und bestaetigt
    Then der Benutzer ist kein Mitglied mehr der Gruppe <gruppe_A>
    And der Benutzer bleibt Mitglied der Gruppe <gruppe_B>

    Examples:
      | gruppe_A | gruppe_B |
      | Reisegruppe | Sportverein |
      | Projektteam | Lesekreis |

  @error @negative @regression
  Scenario Outline: Fehlerfall mit wiederholtem Versuch
    # Scenario Outline: Nach Fehler bleibt Mitgliedschaft bestehen
    Given der Benutzer ist Mitglied der Gruppe <gruppe>
    When der Benutzer versucht die Gruppe zu verlassen und ein Fehler <fehler_typ> tritt auf
    Then das System zeigt die Fehlermeldung <fehlermeldung>
    And die Mitgliedschaft in der Gruppe <gruppe> bleibt bestehen

    Examples:
      | gruppe | fehler_typ | fehlermeldung |
      | Reisegruppe | Netzwerkfehler | Vorgang konnte nicht abgeschlossen werden |
      | Projektteam | Serverfehler | Vorgang konnte nicht abgeschlossen werden |
