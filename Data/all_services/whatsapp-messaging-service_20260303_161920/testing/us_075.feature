@smoke @regression
Feature: Unbekannte Absender
  As a Endnutzer
  I want to Nachrichten von unbekannten Absendern separat ansehen und verwalten
  So that damit ich Datenschutz und Sicherheit erhöhe und relevante Nachrichten schneller finde

  Background:
    Given der Endnutzer ist im Messaging-System angemeldet
    And der reguläre Posteingang und der Bereich für unbekannte Absender sind verfügbar

  @happy-path @smoke @regression
  Scenario: Unbekannte Nachricht wird automatisch separiert
    # Prüft die automatische Einsortierung unbekannter Absender in den separaten Bereich
    Given eine eingehende Nachricht stammt von einer Nummer, die nicht in den Kontakten ist und nicht verifiziert ist
    When die Nachricht im System eintrifft
    Then wird die Nachricht im Bereich für unbekannte Absender angezeigt
    And die Nachricht wird nicht im regulären Posteingang angezeigt

  @happy-path @regression
  Scenario: Unbekannten Absender als bekannt bestätigen
    # Bestätigt, dass ein bestätigter Absender künftig im regulären Posteingang erscheint
    Given ich befinde mich im Bereich für unbekannte Absender
    And ein unbekannter Absender ist ausgewählt
    When ich den Absender als bekannt bestätige
    Then wird der Absender als bekannt markiert
    And zukünftige Nachrichten dieses Absenders erscheinen im regulären Posteingang

  @happy-path @regression
  Scenario: Sicherheitswarnung bei unsicherem Inhalt
    # Stellt sicher, dass potenziell unsichere Links/Anhänge eine Bestätigung erfordern
    Given eine Nachricht von einem unbekannten Absender enthält einen potenziell unsicheren Link oder Anhang
    When die Nachricht im System eintrifft
    Then wird eine Sicherheitswarnung angezeigt
    And das Öffnen des Inhalts erfordert eine explizite Bestätigung

  @regression
  Scenario Outline: Datengetriebene Einsortierung nach Absenderstatus
    # Validiert das Verhalten bei verschiedenen Absenderstatus
    Given eine eingehende Nachricht stammt von einem Absender mit Status <status>
    When die Nachricht im System eintrifft
    Then wird die Nachricht im Bereich <zielbereich> angezeigt
    And der alternative Bereich <anderer_bereich> zeigt die Nachricht nicht an

    Examples:
      | status | zielbereich | anderer_bereich |
      | nicht in Kontakten und nicht verifiziert | Unbekannte Absender | Regulärer Posteingang |
      | in Kontakten und verifiziert | Regulärer Posteingang | Unbekannte Absender |

  @negative @regression
  Scenario: Fehler beim Bestätigen eines Absenders
    # Negatives Szenario: Backend-Fehler verhindert die Bestätigung
    Given ich befinde mich im Bereich für unbekannte Absender
    And der Bestätigungsdienst ist nicht verfügbar
    When ich den Absender als bekannt bestätigen möchte
    Then wird eine Fehlermeldung angezeigt
    And der Absender bleibt als unbekannt markiert

  @edge-case @regression
  Scenario Outline: Grenzfall: sehr viele unbekannte Nachrichten
    # Prüft das Verhalten bei hoher Anzahl an unbekannten Nachrichten
    Given es existieren <anzahl> eingehende Nachrichten von unbekannten Absendern
    When die Nachrichten im System eintreffen
    Then werden alle Nachrichten im Bereich für unbekannte Absender angezeigt
    And der reguläre Posteingang bleibt unverändert

    Examples:
      | anzahl |
      | 1 |
      | 500 |
