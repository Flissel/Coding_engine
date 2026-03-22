@@smoke @@regression
Feature: Labels/Tags in der Kontaktverwaltung
  As a Business-Nutzer
  I want to Kontakt-Labels erstellen und Kontakten zuweisen
  So that Kontakte schnell segmentieren zu koennen und die Kommunikation effizienter zu gestalten

  Background:
    Given ein Business-Nutzer ist angemeldet und befindet sich in der Kontaktverwaltung

  @@smoke @@regression @@happy-path
  Scenario: Label erstellen und einem Kontakt zuweisen
    # Erfolgreiches Erstellen eines neuen Labels und Zuweisen zu einem Kontakt
    Given ein Kontakt existiert in der Kontaktliste
    When der Nutzer erstellt ein neues Label mit dem Namen "VIP"
    And der Nutzer weist das Label dem Kontakt zu
    Then das Label wird gespeichert
    And das Label wird beim Kontakt angezeigt

  @@regression @@negative @@error
  Scenario: Doppelte Label-Namen verhindern
    # Fehlerfall bei Erstellung eines Labels mit bereits existierendem Namen
    Given ein Label mit dem Namen "Bestandskunde" existiert bereits
    When der Nutzer erstellt ein neues Label mit dem Namen "Bestandskunde"
    Then eine klare Fehlermeldung wird angezeigt
    And das Label wird nicht dupliziert

  @@regression @@negative @@error
  Scenario: Leeren Label-Namen validieren
    # Validierung bei leerem Label-Namen
    When der Nutzer versucht ein neues Label ohne Namen zu speichern
    Then der Vorgang wird abgebrochen
    And eine Validierungsmeldung wird angezeigt

  @@regression @@boundary
  Scenario Outline: Grenzwerte fuer Label-Namen
    # Boundary-Tests fuer minimale und maximale Laenge des Label-Namens
    Given ein Kontakt existiert in der Kontaktliste
    When der Nutzer erstellt ein neues Label mit dem Namen <label_name>
    And der Nutzer weist das Label dem Kontakt zu
    Then <expected_result>
    And <label_visibility>

    Examples:
      | label_name | expected_result | label_visibility |
      | A | das Label wird gespeichert | das Label wird beim Kontakt angezeigt |
      | AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA | das Label wird gespeichert | das Label wird beim Kontakt angezeigt |

  @@regression @@negative @@edge
  Scenario Outline: Ungueltige Sonderzeichen im Label-Namen
    # Edge Case bei nicht erlaubten Zeichen im Label-Namen
    When der Nutzer erstellt ein neues Label mit dem Namen <label_name>
    Then <expected_result>
    And <message>

    Examples:
      | label_name | expected_result | message |
      | VIP<> | der Vorgang wird abgebrochen | eine Validierungsmeldung wird angezeigt |
      | Kunde/Partner | der Vorgang wird abgebrochen | eine Validierungsmeldung wird angezeigt |
