@@smoke @@regression
Feature: Zuletzt online Sichtbarkeit konfigurieren
  As a registrierter Endnutzer
  I want to die Sichtbarkeit meines Online-Status konfigurieren
  So that meine Privatsphäre zu schützen und gleichzeitig die Kommunikation zu steuern

  Background:
    Given der Nutzer ist angemeldet
    And der Nutzer hat die Datenschutzeinstellungen geöffnet

  @@smoke @@regression @@happy-path
  Scenario: Sichtbarkeit auf Nur Kontakte setzen
    # Erfolgreiches Speichern der Option Nur Kontakte
    When der Nutzer die Sichtbarkeit auf "Nur Kontakte" setzt
    And die Änderung speichert
    Then wird der Online-Status nur für bestätigte Kontakte angezeigt
    And sieht der Nutzer eine Bestätigung, dass die Einstellung gespeichert wurde

  @@regression @@happy-path
  Scenario: Sichtbarkeit auf Niemand setzen
    # Erfolgreiches Speichern der Option Niemand
    When der Nutzer die Sichtbarkeit auf "Niemand" setzt
    And die Änderung speichert
    Then ist der Online-Status für andere Nutzer nicht sichtbar
    And sieht der Nutzer eine Bestätigung, dass die Einstellung gespeichert wurde

  @@regression @@negative
  Scenario Outline: Ungültige Sichtbarkeitsauswahl wird abgelehnt
    # Fehlerbehandlung für nicht unterstützte Auswahlwerte
    When der Nutzer eine ungültige Sichtbarkeitsauswahl sendet
    And die Änderung speichern möchte
    Then wird die Änderung abgelehnt
    And wird eine verständliche Fehlermeldung angezeigt

    Examples:
      | invalid_value |
      | AllContacts |
      |  |
      | 123 |

  @@regression @@edge
  Scenario: Sichtbarkeit auf Nur Kontakte ohne bestätigte Kontakte
    # Edge Case: Nutzer hat keine bestätigten Kontakte
    Given der Nutzer hat keine bestätigten Kontakte
    When der Nutzer die Sichtbarkeit auf "Nur Kontakte" setzt
    And die Änderung speichert
    Then ist der Online-Status für andere Nutzer nicht sichtbar
    And sieht der Nutzer eine Bestätigung, dass die Einstellung gespeichert wurde

  @@regression @@boundary
  Scenario Outline: Szenario Outline: Standardwerte für Sichtbarkeit speichern
    # Boundary: Speicherung der erlaubten Werte
    When der Nutzer die Sichtbarkeit auf "<visibility>" setzt
    And die Änderung speichert
    Then wird die Auswahl "<visibility>" erfolgreich gespeichert

    Examples:
      | visibility |
      | Nur Kontakte |
      | Niemand |
