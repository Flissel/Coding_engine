@@smoke @@regression
Feature: Telefonnummer im Profil anzeigen
  As a registrierter Nutzer
  I want to im Profil die hinterlegte Telefonnummer anzeigen
  So that damit er Kontaktinformationen schnell einsehen und eine zuverlaessige Kommunikation sicherstellen kann

  Background:
    Given der Nutzer ist registriert und eingeloggt

  @@smoke @@regression @@happy-path
  Scenario: Telefonnummer wird im Profil angezeigt
    # Happy path: gespeicherte Telefonnummer wird sichtbar angezeigt
    Given im Profil ist eine Telefonnummer gespeichert
    When der Nutzer das Profil aufruft
    Then wird die Telefonnummer im Profil sichtbar angezeigt
    And die angezeigte Telefonnummer entspricht dem gespeicherten Wert

  @@regression @@edge-case
  Scenario: Keine Telefonnummer hinterlegt
    # Edge case: neutrale Information wird angezeigt, wenn keine Telefonnummer existiert
    Given im Profil ist keine Telefonnummer gespeichert
    When der Nutzer das Profil aufruft
    Then wird eine neutrale Information angezeigt, dass keine Telefonnummer hinterlegt ist
    And es wird keine leere oder fehlerhafte Nummer angezeigt

  @@regression @@negative @@error
  Scenario: Profildaten können nicht geladen werden
    # Error scenario: technische Störung verhindert das Laden der Profildaten
    Given ein technischer Fehler verhindert das Laden der Profildaten
    When der Nutzer das Profil aufruft
    Then wird eine Fehlermeldung angezeigt
    And die Telefonnummer wird nicht dargestellt

  @@regression @@boundary
  Scenario Outline: Telefonnummernformate werden korrekt angezeigt
    # Boundary conditions: unterschiedliche zulässige Telefonnummernformate werden korrekt gerendert
    Given im Profil ist die Telefonnummer <phone_number> gespeichert
    When der Nutzer das Profil aufruft
    Then wird die Telefonnummer im Profil sichtbar angezeigt
    And die Anzeige entspricht dem gespeicherten Format

    Examples:
      | phone_number |
      | +49 30 1234567 |
      | +1-202-555-0199 |
      | 0041 44 668 18 00 |
