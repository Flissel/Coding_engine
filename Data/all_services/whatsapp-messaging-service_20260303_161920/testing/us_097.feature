@@smoke @@regression
Feature: Verifiziertes Business
  As a Business-Admin
  I want to mein Business-Profil zur Verifizierung einreichen und den Status einsehen
  So that damit Kunden mir vertrauen und ich professionell sowie glaubwürdig auftreten kann

  Background:
    Given ich bin als Business-Admin angemeldet

  @@smoke @@regression @@happy-path
  Scenario: Verifizierungsantrag wird erfolgreich eingereicht
    # Happy Path: Antrag wird gespeichert und Status auf 'in Pruefung' gesetzt
    Given alle erforderlichen Profilinformationen sind ausgefuellt
    When ich den Verifizierungsprozess starte und gueltige Nachweise hochlade
    Then wird der Antrag gespeichert
    And der Status wird auf 'in Pruefung' gesetzt

  @@regression @@happy-path
  Scenario: Verifizierungsabzeichen nach erfolgreicher Pruefung sichtbar
    # Happy Path: Profil zeigt Verifizierungsabzeichen und Status 'verifiziert'
    Given mein Verifizierungsantrag wurde erfolgreich geprueft
    When ich mein Business-Profil aufrufe
    Then wird ein Verifizierungsabzeichen sichtbar angezeigt
    And der Status wird als 'verifiziert' ausgewiesen

  @@regression @@negative
  Scenario: Fehlende Pflichtangaben verhindern Antrag
    # Error: Antrag darf bei fehlenden Pflichtangaben nicht eingereicht werden
    Given Pflichtangaben oder Nachweise sind nicht vollstaendig bereitgestellt
    When ich den Verifizierungsprozess absenden moechte
    Then erhalte ich eine klare Fehlermeldung
    And der Antrag wird nicht eingereicht

  @@regression @@boundary
  Scenario Outline: Grenzwerte fuer Nachweis-Upload
    # Boundary: Minimal- und Maximalgroesse der Nachweise
    Given alle erforderlichen Profilinformationen sind ausgefuellt
    When ich einen Nachweis mit Dateigroesse <date_size_mb> MB hochlade
    Then wird das Hochladen <upload_result> bewertet
    And der Status bleibt <status_result>

    Examples:
      | date_size_mb | upload_result | status_result |
      | 1 | als erfolgreich | auf 'in Pruefung' gesetzt |
      | 20 | als erfolgreich | auf 'in Pruefung' gesetzt |
      | 21 | als fehlgeschlagen | unveraendert |

  @@regression @@edge
  Scenario: Mehrfacher Antrag bei bereits laufender Pruefung
    # Edge Case: Doppelter Antrag waehrend 'in Pruefung'
    Given mein Verifizierungsstatus ist 'in Pruefung'
    When ich erneut den Verifizierungsprozess starte
    Then erhalte ich einen Hinweis, dass bereits ein Antrag vorliegt
    And es wird kein weiterer Antrag erstellt
