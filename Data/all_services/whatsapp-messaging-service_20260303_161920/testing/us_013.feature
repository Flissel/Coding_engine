@smoke @regression
Feature: Nachricht loeschen
  As a registrierter Nutzer
  I want to eine gesendete oder empfangene Nachricht loeschen
  So that um Datenschutz zu wahren und den Nachrichtenverlauf uebersichtlich zu halten

  Background:
    Given der Nutzer ist angemeldet und befindet sich im Chatverlauf

  @@smoke @@regression @@happy-path
  Scenario: Nachricht erfolgreich loeschen
    # Erfolgreiches Loeschen einer sichtbaren Nachricht aktualisiert den Chat ohne Fehlermeldung
    Given eine Nachricht ist im Chatverlauf sichtbar
    When der Nutzer waehlt die Funktion 'Nachricht loeschen' und bestaetigt
    Then die Nachricht wird aus dem Chatverlauf des Nutzers entfernt
    And die Ansicht aktualisiert sich ohne Fehlermeldung

  @@regression @@edge @@negative
  Scenario: Loeschen einer bereits geloeschten Nachricht
    # Das System verhindert erneutes Loeschen und informiert den Nutzer
    Given der Nutzer oeffnet einen Chat mit einer bereits geloeschten Nachricht
    When der Nutzer versucht, die Nachricht erneut zu loeschen
    Then das System zeigt an, dass die Nachricht bereits geloescht ist
    And es wird keine weitere Aktion ausgefuehrt

  @@regression @@negative @@error
  Scenario: Fehlermeldung bei technischem Fehler oder Verbindungsunterbrechung
    # Bei Fehlern bleibt die Nachricht unveraendert und es wird eine verstaendliche Fehlermeldung angezeigt
    Given es liegt ein technischer Fehler oder eine Verbindungsunterbrechung vor
    When der Nutzer versucht, eine Nachricht zu loeschen
    Then das System zeigt eine verstaendliche Fehlermeldung an
    And die Nachricht bleibt unveraendert erhalten

  @@regression @@happy-path
  Scenario Outline: Nachricht loeschen in verschiedenen Nachrichtentypen
    # Datengetriebener Test fuer gesendete und empfangene Nachrichten
    Given eine <nachrichtentyp> Nachricht ist im Chatverlauf sichtbar
    When der Nutzer waehlt die Funktion 'Nachricht loeschen' und bestaetigt
    Then die <nachrichtentyp> Nachricht wird aus dem Chatverlauf entfernt
    And die Ansicht aktualisiert sich ohne Fehlermeldung

    Examples:
      | nachrichtentyp |
      | gesendete |
      | empfangene |

  @@regression @@boundary
  Scenario: Grenzfall: Letzte verbleibende Nachricht loeschen
    # Beim Loeschen der letzten Nachricht bleibt der Chatverlauf leer und stabil
    Given der Chatverlauf enthaelt genau eine sichtbare Nachricht
    When der Nutzer loescht diese Nachricht und bestaetigt
    Then der Chatverlauf ist leer
    And die Ansicht zeigt keine Fehlermeldung und bleibt bedienbar
