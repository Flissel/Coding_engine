@smoke @regression
Feature: Produktkatalog verwalten
  As a Business-Administrator
  I want to einen Produktkatalog erstellen und verwalten
  So that damit Kunden die Produkte schnell und intuitiv finden und Anfragen effizient bearbeitet werden können

  Background:
    Given ein verifiziertes Business-Profil mit aktivem Katalogzugriff

  @happy-path @smoke @regression
  Scenario: Neuen Katalog mit Produkten anlegen und sichtbar machen
    # Happy path: Katalog wird gespeichert und ist plattformübergreifend sichtbar
    Given der Business-Administrator ist angemeldet
    When der Business-Administrator legt einen neuen Katalog mit gültigen Produkten an
    Then wird der Katalog gespeichert
    And der Katalog ist für Kunden plattformübergreifend sichtbar

  @happy-path @regression
  Scenario: Produkt aktualisieren oder entfernen und Konsistenz prüfen
    # Happy path: Änderungen sind sofort sichtbar und die Liste bleibt konsistent
    Given ein bestehender Produktkatalog mit mindestens einem Produkt
    When der Business-Administrator aktualisiert das Produkt oder entfernt es
    Then sind die Änderungen sofort im Katalog ersichtlich
    And die Produktliste bleibt konsistent ohne Duplikate oder Lücken

  @negative @regression
  Scenario: Produkt mit fehlenden Pflichtangaben speichern
    # Error scenario: Validierungsfehler bei fehlenden Pflichtangaben
    Given ein Produktdatensatz mit fehlenden Pflichtangaben
    When der Business-Administrator versucht, das Produkt zu speichern
    Then wird eine Validierungsfehlermeldung angezeigt
    And das Produkt wird nicht gespeichert

  @edge-case @regression
  Scenario Outline: Produkte mit Grenzwerten für Name und Preis speichern
    # Boundary conditions: Minimale und maximale Werte werden geprüft
    Given ein Produkt mit Name und Preis gemäß Grenzwerten
    When der Business-Administrator versucht, das Produkt zu speichern
    Then wird das Produkt entsprechend der Validierungsregeln gespeichert oder abgewiesen
    And es wird eine passende Rückmeldung angezeigt

    Examples:
      | name_length | price | expected_result |
      | 1 | 0.01 | saved |
      | 255 | 999999.99 | saved |
      | 0 | 10.0 | rejected |
      | 10 | 0.0 | rejected |

  @edge-case @negative @regression
  Scenario: Produktaktualisierung bei gleichzeitiger Änderung
    # Edge case: Konflikt bei paralleler Aktualisierung
    Given ein bestehender Produktkatalog mit einem Produkt
    And das Produkt wurde von einem anderen Administrator bereits geändert
    When der Business-Administrator speichert eine veraltete Version des Produkts
    Then wird ein Konflikthinweis angezeigt
    And das Produkt bleibt in der zuletzt gespeicherten konsistenten Version
