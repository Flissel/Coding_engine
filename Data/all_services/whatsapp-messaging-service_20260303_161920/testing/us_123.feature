@smoke @regression
Feature: Sticker-Vorschlaege
  As a Endnutzer
  I want to in einem Chat kontextbasierte Sticker-Vorschlaege angezeigt bekommen
  So that damit ich schneller und intuitiver auf Nachrichten reagieren kann

  Background:
    Given der Nutzer ist in einem aktiven Chat mit geoeffnetem Eingabefeld

  @smoke @regression @happy-path
  Scenario: Kontextbasierte Sticker-Vorschlaege werden angezeigt
    # Happy path fuer erkannte Kontexte
    Given der Sticker-Vorschlagsdienst ist verfuegbar
    When der Nutzer tippt eine Nachricht mit erkennbar positivem Kontext
    Then das System zeigt passende Sticker-Vorschlaege an
    And die Nachrichteneingabe bleibt nutzbar

  @regression @edge-case
  Scenario: Neutrale oder keine Vorschlaege bei unklarem Kontext
    # Edge case fuer nicht eindeutigen Kontext
    Given der Sticker-Vorschlagsdienst ist verfuegbar
    When der Nutzer tippt eine Nachricht ohne eindeutigen Kontext
    Then das System zeigt neutrale oder keine Sticker-Vorschlaege an
    And die Nachrichteneingabe bleibt nutzbar

  @regression @negative @error
  Scenario: Technischer Fehler beim Laden von Vorschlaegen
    # Error scenario bei Ausfall des Vorschlagsdienstes
    Given der Sticker-Vorschlagsdienst ist nicht erreichbar
    When der Nutzer tippt eine Nachricht ein
    Then das System zeigt keine Sticker-Vorschlaege an
    And die Nachrichteneingabe ist nicht beeintraechtigt

  @regression @happy-path
  Scenario Outline: Kontextuelle Vorschlaege anhand verschiedener Texte
    # Data-driven Test fuer mehrere Kontexte
    Given der Sticker-Vorschlagsdienst ist verfuegbar
    When der Nutzer tippt die Nachricht <eingabe>
    Then das System zeigt Sticker-Vorschlaege fuer den Kontext <kontext> an
    And die Anzahl der Vorschlaege ist <= 5

    Examples:
      | eingabe | kontext |
      | Herzlichen Glueckwunsch! | Glueckwuensche |
      | Gute Besserung | Genesung |
      | Danke dir! | Dank |

  @regression @edge-case @negative
  Scenario Outline: Grenzwerte der Eingabe ohne Kontext
    # Boundary conditions fuer sehr kurze oder leere Eingaben
    Given der Sticker-Vorschlagsdienst ist verfuegbar
    When der Nutzer tippt die Nachricht <eingabe>
    Then das System zeigt neutrale oder keine Sticker-Vorschlaege an
    And die Nachrichteneingabe bleibt nutzbar

    Examples:
      | eingabe |
      |  |
      | ? |
      | ok |
