@@smoke @@regression
Feature: Begrussungsnachrichten beim Erstkontakt
  As a Shop-Admin
  I want to automatische Begruessungsnachrichten beim Erstkontakt konfigurieren und ausspielen lassen
  So that Kunden professionell und sofort willkommen heissen, um Servicequalitaet zu steigern und die Kommunikation zu standardisieren

  Background:
    Given das Business-Profil ist aktiv und kann Nachrichten empfangen

  @@smoke @@regression @@happy-path
  Scenario: Sende Begruessungsnachricht beim Erstkontakt
    # Happy path: neuer Kontakt erhaelt automatisch genau eine Begruessungsnachricht
    Given die Begruessungsnachricht ist aktiviert und mit dem Text "Willkommen" konfiguriert
    And der Kontakt "K1" hat noch nie mit dem Business-Profil interagiert
    When der Kontakt "K1" sendet die erste Nachricht
    Then das System sendet genau eine Begruessungsnachricht an "K1"
    And die Begruessungsnachricht wird innerhalb der definierten Zeitspanne zugestellt

  @@regression @@edge
  Scenario: Keine erneute Begruessung bei bestehendem Kontakt
    # Edge case: bestehender Kontakt erhaelt keine erneute Begruessung
    Given die Begruessungsnachricht ist aktiviert und konfiguriert
    And der Kontakt "K2" hat bereits zuvor mit dem Business-Profil interagiert
    When der Kontakt "K2" sendet eine weitere Nachricht
    Then das System sendet keine Begruessungsnachricht an "K2"

  @@regression @@negative
  Scenario: Keine Begruessungsnachricht wenn deaktiviert
    # Error scenario: Begruessungsnachricht ist deaktiviert
    Given die Begruessungsnachricht ist deaktiviert
    And der Kontakt "K3" hat noch nie mit dem Business-Profil interagiert
    When der Kontakt "K3" sendet die erste Nachricht
    Then das System sendet keine Begruessungsnachricht
    And die eingehende Nachricht wird weiterhin normal verarbeitet

  @@regression @@boundary
  Scenario Outline: Begruessungsnachricht Zeitfenster Grenzwerte
    # Boundary conditions: Zustellung innerhalb definierter Zeitspanne
    Given die Begruessungsnachricht ist aktiviert und konfiguriert
    And der Kontakt "K4" hat noch nie mit dem Business-Profil interagiert
    When der Kontakt "K4" sendet die erste Nachricht
    Then die Begruessungsnachricht wird innerhalb von <max_delay_ms> Millisekunden zugestellt

    Examples:
      | max_delay_ms |
      | 1000 |
      | 5000 |

  @@regression @@edge
  Scenario Outline: Genau eine Begruessungsnachricht bei parallelen Erstnachrichten
    # Edge case: doppelte Erstnachrichten duerfen nur eine Begruessung ausloesen
    Given die Begruessungsnachricht ist aktiviert und konfiguriert
    And der Kontakt "<contact_id>" hat noch nie mit dem Business-Profil interagiert
    When zwei Erstnachrichten von "<contact_id>" treffen innerhalb von <interval_ms> Millisekunden ein
    Then das System sendet genau eine Begruessungsnachricht an "<contact_id>"

    Examples:
      | contact_id | interval_ms |
      | K5 | 10 |
      | K6 | 100 |
