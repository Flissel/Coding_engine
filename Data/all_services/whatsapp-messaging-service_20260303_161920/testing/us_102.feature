@smoke @regression
Feature: Warenkorb
  As a Endkunde
  I want to Produkte in einen Warenkorb legen und vor der Bestellung bearbeiten
  So that um eine einfache, intuitive und schnelle Bestellung vorzubereiten

  Background:
    Given der Endkunde befindet sich im Shop und der Warenkorb ist leer

  @@smoke @@regression @@happy-path
  Scenario: Produkt erfolgreich zum Warenkorb hinzufügen
    # Happy path: verfügbares Produkt wird hinzugefügt und Preise werden aktualisiert
    Given ein Produkt ist verfügbar und im Shop sichtbar
    When der Endkunde auf "In den Warenkorb" klickt
    Then das Produkt wird dem Warenkorb hinzugefügt
    And die aktualisierte Anzahl und der Preis werden angezeigt

  @@regression @@happy-path
  Scenario: Menge eines Produkts ändern und Summen aktualisieren
    # Happy path: Änderung der Menge aktualisiert Zwischensumme und Gesamtsumme
    Given der Endkunde hat mehrere Produkte im Warenkorb
    When der Endkunde die Menge eines Produkts von 1 auf 3 ändert
    Then die Zwischensumme wird sofort korrekt aktualisiert
    And die Gesamtsumme wird sofort korrekt aktualisiert

  @@regression @@happy-path
  Scenario: Produkt aus dem Warenkorb entfernen
    # Happy path: Produkt wird entfernt und Warenkorb aktualisiert
    Given der Endkunde hat ein Produkt im Warenkorb
    When der Endkunde das Produkt aus dem Warenkorb entfernt
    Then das Produkt wird aus dem Warenkorb gelöscht
    And der Warenkorb zeigt die aktualisierte Anzahl und Summen

  @@regression @@boundary
  Scenario Outline: Mengenänderung auf Grenzwerte
    # Boundary: Mengenänderung auf minimale und maximale zulässige Werte
    Given der Endkunde hat ein Produkt im Warenkorb
    When der Endkunde die Menge auf "<menge>" setzt
    Then die Zwischensumme und Gesamtsumme werden korrekt aktualisiert
    And die Menge wird als gültiger Wert angezeigt

    Examples:
      | menge |
      | 1 |
      | 99 |

  @@regression @@negative @@edge
  Scenario Outline: Mengenänderung auf ungültigen Wert
    # Edge case: Menge darf nicht unter Minimum oder über Maximum liegen
    Given der Endkunde hat ein Produkt im Warenkorb
    When der Endkunde die Menge auf "<ungueltige_menge>" setzt
    Then eine klare Validierungsnachricht wird angezeigt
    And die Menge und Summen bleiben unverändert

    Examples:
      | ungueltige_menge |
      | 0 |
      | -1 |
      | 1000 |

  @@regression @@negative
  Scenario: Fehler beim Hinzufügen aufgrund Verbindungsproblem
    # Error scenario: Anfrage kann nicht verarbeitet werden
    Given die Verbindung ist unterbrochen
    When der Endkunde ein Produkt in den Warenkorb legen möchte
    Then eine klare Fehlermeldung wird angezeigt
    And der Warenkorb bleibt unverändert
