@@smoke @@regression
Feature: US-061 Melden
  As a Endnutzer
  I want to eine Nachricht oder einen Kontakt melden
  So that um Missbrauch zu verhindern und die Sicherheit der Kommunikation zu erhöhen

  Background:
    Given der Endnutzer ist im Chat angemeldet und sieht eine erhaltene Nachricht sowie einen Kontakt

  @@smoke @@regression @@happy-path
  Scenario Outline: Erfolgreiche Meldung einer Nachricht oder eines Kontakts
    # Validiert das erfolgreiche Speichern einer Meldung mit ausgewähltem Meldegrund
    Given der Endnutzer öffnet die Option „Melden“ für das Element <element_typ>
    And der Endnutzer wählt den Meldegrund <meldegrund> aus
    When der Endnutzer bestätigt die Meldung
    Then die Meldung wird erfolgreich gespeichert
    And dem Endnutzer wird eine Bestätigung angezeigt

    Examples:
      | element_typ | meldegrund |
      | Nachricht | Belästigung |
      | Kontakt | Spam |

  @@regression @@negative @@edge
  Scenario: Meldung ohne Meldegrund wird blockiert
    # Stellt sicher, dass ohne Meldegrund keine Meldung abgesendet wird
    Given der Endnutzer öffnet die Option „Melden“ für eine erhaltene Nachricht
    And es ist kein Meldegrund ausgewählt
    When der Endnutzer tippt auf „Senden“
    Then die Meldung wird nicht abgeschickt
    And der Endnutzer wird aufgefordert, einen Meldegrund auszuwählen

  @@regression @@negative @@error
  Scenario: Fehler beim Senden der Meldung ohne Netzwerkverbindung
    # Validiert Fehlermeldung und kein Speichern bei Netzwerkunterbrechung
    Given die Netzwerkverbindung ist unterbrochen
    And der Endnutzer wählt einen gültigen Meldegrund aus
    When der Endnutzer sendet die Meldung
    Then der Endnutzer erhält eine Fehlermeldung
    And die Meldung wird nicht gespeichert

  @@regression @@boundary
  Scenario Outline: Auswahl des letzten verfügbaren Meldegrunds
    # Prüft die erfolgreiche Meldung mit dem letzten Eintrag der Meldegrundliste
    Given der Endnutzer öffnet die Option „Melden“ für eine erhaltene Nachricht
    And der Endnutzer wählt den letzten verfügbaren Meldegrund <letzter_grund> aus
    When der Endnutzer bestätigt die Meldung
    Then die Meldung wird erfolgreich gespeichert
    And dem Endnutzer wird eine Bestätigung angezeigt

    Examples:
      | letzter_grund |
      | Andere |
