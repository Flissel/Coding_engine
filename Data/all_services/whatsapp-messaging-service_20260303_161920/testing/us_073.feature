@smoke @regression
Feature: Favoriten verwalten
  As a Endnutzer
  I want to Kontakte als Favoriten markieren und verwalten
  So that wichtige Kontakte schnell finden und eine einfache, intuitive Bedienung sicherstellen

  Background:
    Given der Nutzer ist angemeldet
    And eine Kontaktliste ist sichtbar

  @happy-path @smoke @regression
  Scenario: Kontakt als Favorit markieren
    # Happy path: Markieren eines Kontakts als Favorit und Anzeige in Favoritenliste
    Given der Kontakt 'Anna Schmidt' ist nicht als Favorit markiert
    When der Nutzer markiert 'Anna Schmidt' als Favorit
    Then der Kontakt ist als Favorit gekennzeichnet
    And der Kontakt erscheint in der Favoritenliste

  @happy-path @regression
  Scenario: Favoritenansicht zeigt alle Favoriten schnell an
    # Happy path: Favoritenansicht lädt korrekt und zeigt alle favorisierten Kontakte
    Given der Nutzer hat mindestens einen Favoriten
    When der Nutzer öffnet die Favoritenansicht
    Then alle favorisierten Kontakte werden korrekt angezeigt
    And die Favoritenansicht wird innerhalb der vereinbarten Ladezeit angezeigt

  @happy-path @regression
  Scenario: Favoritenmarkierung entfernen
    # Happy path: Entfernen eines Favoriten und Aktualisierung der Favoritenliste
    Given der Kontakt 'Max Meier' ist als Favorit markiert
    When der Nutzer entfernt die Favoritenmarkierung von 'Max Meier'
    Then der Kontakt ist nicht mehr als Favorit gekennzeichnet
    And der Kontakt wird aus der Favoritenliste entfernt

  @edge-case @regression
  Scenario: Kontakt erneut als Favorit markieren
    # Edge case: Der Nutzer markiert einen bereits favorisierten Kontakt erneut
    Given der Kontakt 'Sara König' ist bereits als Favorit markiert
    When der Nutzer versucht, 'Sara König' erneut als Favorit zu markieren
    Then der Favoritenstatus bleibt unverändert
    And die Favoritenliste enthält den Kontakt nur einmal

  @boundary @regression
  Scenario: Favoritenansicht ohne Favoriten
    # Boundary condition: Favoritenansicht bei leerer Favoritenliste
    Given der Nutzer hat keine Favoriten
    When der Nutzer öffnet die Favoritenansicht
    Then eine leere Favoritenliste wird angezeigt
    And eine verständliche Leermeldung wird angezeigt

  @happy-path @regression
  Scenario Outline: Datengetriebene Favoritenmarkierung
    # Scenario outline: Markieren verschiedener Kontakte als Favorit
    Given der Kontakt '<Kontakt>' ist nicht als Favorit markiert
    When der Nutzer markiert '<Kontakt>' als Favorit
    Then der Kontakt ist als Favorit gekennzeichnet
    And der Kontakt erscheint in der Favoritenliste

    Examples:
      | Kontakt |
      | Anna Schmidt |
      | Max Meier |
      | Sara König |

  @negative @regression
  Scenario: Fehler beim Speichern der Favoritenmarkierung
    # Error scenario: Favorit kann aufgrund eines Backend-Fehlers nicht gespeichert werden
    Given der Kontakt 'Lena Wolf' ist nicht als Favorit markiert
    And der Favoriten-Service ist nicht verfügbar
    When der Nutzer markiert 'Lena Wolf' als Favorit
    Then eine Fehlermeldung wird angezeigt
    And der Kontakt bleibt nicht als Favorit gekennzeichnet

  @edge-case @regression
  Scenario: Entfernen eines nicht favorisierten Kontakts
    # Edge case: Entfernen der Favoritenmarkierung eines nicht favorisierten Kontakts
    Given der Kontakt 'Tom Berger' ist nicht als Favorit markiert
    When der Nutzer versucht, die Favoritenmarkierung von 'Tom Berger' zu entfernen
    Then der Favoritenstatus bleibt unverändert
    And keine doppelten oder widersprüchlichen Statusanzeigen erscheinen

  @boundary @regression
  Scenario: Boundary: Maximale Anzahl an Favoriten
    # Boundary condition: Favoritenliste erreicht das Systemlimit
    Given der Nutzer hat das maximale Favoritenlimit erreicht
    When der Nutzer markiert einen weiteren Kontakt als Favorit
    Then eine verständliche Hinweis- oder Fehlermeldung wird angezeigt
    And die Favoritenliste bleibt unverändert
