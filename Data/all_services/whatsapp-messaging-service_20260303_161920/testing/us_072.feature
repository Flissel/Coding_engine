@smoke @regression
Feature: Kontakt hinzufuegen
  As a Registrierter Nutzer
  I want to einen neuen Kontakt über verschiedene verfügbare Wege hinzufügen
  So that um Kontakte schnell und intuitiv zu erfassen und eine zuverlässige Kommunikation zu ermöglichen

  Background:
    Given der Nutzer ist angemeldet und befindet sich im Bereich „Kontakte“

  @happy-path @smoke @regression
  Scenario Outline: Kontakt erfolgreich über unterstützte Wege hinzufügen
    # Prüft das erfolgreiche Speichern eines Kontakts über verschiedene unterstützte Wege
    When der Nutzer fügt einen Kontakt über den Weg <weg> mit gültigen Pflichtangaben hinzu
    Then wird der Kontakt gespeichert
    And der Kontakt wird in der Kontaktliste angezeigt

    Examples:
      | weg |
      | Telefonnummer |
      | QR-Code |
      | Einladung |

  @negative @regression
  Scenario Outline: Kontakt wird nicht gespeichert bei ungültigen oder unvollständigen Angaben
    # Validiert Fehlermeldung und Nicht-Speichern bei invaliden Pflichtangaben
    When der Nutzer bestätigt das Hinzufügen mit <fehlerart>
    Then wird der Kontakt nicht gespeichert
    And es wird eine verständliche Fehlermeldung angezeigt

    Examples:
      | fehlerart |
      | ungültiger Telefonnummer |
      | leerer Pflichtangabe |
      | ungültigem QR-Code Format |

  @negative @regression
  Scenario Outline: Duplikatkontakt wird verhindert
    # Stellt sicher, dass bestehende Kontakte nicht doppelt angelegt werden
    Given ein Kontakt mit <identifikator> existiert bereits in der Kontaktliste
    When der Nutzer versucht denselben Kontakt erneut hinzuzufügen
    Then wird kein Duplikat gespeichert
    And es wird eine passende Hinweisnachricht angezeigt

    Examples:
      | identifikator |
      | Telefonnummer |
      | E-Mail |

  @edge @regression
  Scenario Outline: Grenzwerte für Pflichtfelder werden akzeptiert
    # Prüft das Speichern bei minimalen und maximalen zulässigen Feldlängen
    When der Nutzer fügt einen Kontakt mit <feld> an der <grenze> hinzu
    Then wird der Kontakt gespeichert
    And der Kontakt wird in der Kontaktliste angezeigt

    Examples:
      | feld | grenze |
      | Name | minimal zulässigen Länge |
      | Name | maximal zulässigen Länge |
