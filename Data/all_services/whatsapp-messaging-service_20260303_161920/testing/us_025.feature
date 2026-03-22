@@smoke @@regression
Feature: Kontakt teilen im Chat
  As a registrierter Nutzer
  I want to Kontaktdaten in einem Chat teilen
  So that um die Kommunikation schnell und einfach fortzusetzen

  Background:
    Given der Nutzer ist registriert, eingeloggt und befindet sich in einem bestehenden Chat

  @@smoke @@regression @@happy-path
  Scenario: Kontakt erfolgreich teilen
    # Prüft das erfolgreiche Teilen eines Kontakts im Chat
    Given der Nutzer hat Zugriff auf seine Kontakte
    When der Nutzer öffnet die Funktion „Kontakt teilen“
    And der Nutzer wählt den Kontakt "Max Mustermann" aus und bestätigt
    Then der ausgewählte Kontakt wird als Nachricht im Chat angezeigt
    And der Kontakt wird an den Empfänger zugestellt

  @@regression @@edge-case
  Scenario: Kontakt teilen wird abgebrochen
    # Prüft, dass beim Abbruch kein Kontakt geteilt wird
    Given der Nutzer hat Zugriff auf seine Kontakte
    When der Nutzer öffnet die Funktion „Kontakt teilen“ und bricht die Auswahl ab
    Then es wird kein Kontakt geteilt
    And der Chat bleibt unverändert

  @@regression @@negative @@error
  Scenario: Kontakt teilen ohne Netzwerkverbindung
    # Prüft die Fehlermeldung bei fehlender Netzwerkverbindung
    Given es besteht keine Netzwerkverbindung
    When der Nutzer wählt einen Kontakt aus und bestätigt das Teilen
    Then der Nutzer erhält eine Fehlermeldung
    And der Kontakt wird nicht gesendet und erscheint nicht im Chat

  @@regression @@happy-path
  Scenario Outline: Kontakt teilen - Szenario Outline für verschiedene Kontaktarten
    # Prüft das Teilen unterschiedlicher Kontaktarten
    Given der Nutzer hat Zugriff auf seine Kontakte
    When der Nutzer teilt den Kontakt mit dem Namen "<contact_name>" und der Telefonnummer "<phone_number>"
    Then der Kontakt wird als Nachricht im Chat angezeigt
    And der Kontakt wird an den Empfänger zugestellt

    Examples:
      | contact_name | phone_number |
      | Max Mustermann | +491701234567 |
      | Anna Beispiel | +43123456789 |

  @@regression @@boundary
  Scenario: Kontakt teilen - Boundary: maximaler Anzeigename
    # Prüft das Teilen eines Kontakts mit maximaler Namenslänge
    Given ein Kontakt mit einem Namen der maximal zulässigen Länge ist vorhanden
    When der Nutzer teilt diesen Kontakt und bestätigt
    Then der Kontakt wird korrekt im Chat angezeigt ohne abgeschnittene Daten
    And der Kontakt wird an den Empfänger zugestellt
