@@smoke @@regression
Feature: Sprachnachrichten transkribieren
  As a Endnutzer
  I want to Sprachnachrichten automatisch in Text transkribieren lassen
  So that Inhalte schnell lesen zu koennen und die Bedienung plattformuebergreifend zu vereinfachen

  Background:
    Given der Nutzer ist im Chat mit einer empfangenen Sprachnachricht

  @@smoke @@regression @@happy-path
  Scenario: Erfolgreiche Transkription einer Standard-Sprachnachricht
    # Happy path: Transkript wird innerhalb kurzer Zeit angezeigt
    Given die Sprachnachricht hat eine unterstuetzte Audioqualitaet und ein unterstuetztes Format
    When der Nutzer aktiviert die Transkriptionsfunktion
    Then der Text der Sprachnachricht wird innerhalb kurzer Zeit angezeigt
    And die Sprachnachricht bleibt abspielbar

  @@regression @@edge-case
  Scenario: Transkription mit Hintergrundgeraeuschen kennzeichnet unklare Passagen
    # Edge case: geringe Audioqualitaet oder Hintergrundgeraeusche
    Given die Sprachnachricht hat geringe Audioqualitaet oder Hintergrundgeraeusche
    When der Nutzer startet die Transkription
    Then ein Transkript wird bereitgestellt
    And unklare Passagen werden als solche gekennzeichnet

  @@regression @@negative
  Scenario: Transkriptionsfehler bei nicht unterstuetztem Format
    # Error scenario: klare Fehlermeldung und Nachricht bleibt abspielbar
    Given die Sprachnachricht liegt in einem nicht unterstuetzten Format vor
    When der Nutzer die Transkription anfordert
    Then der Nutzer erhaelt eine klare Fehlermeldung
    And die Sprachnachricht bleibt weiterhin abspielbar

  @@regression @@negative
  Scenario: Transkription bei Systemfehler liefert Fehlermeldung
    # Error scenario: technischer Transkriptionsfehler
    Given die Transkriptions-Engine ist voruebergehend nicht verfuegbar
    When der Nutzer die Transkription anfordert
    Then der Nutzer erhaelt eine klare Fehlermeldung
    And die Sprachnachricht bleibt weiterhin abspielbar

  @@regression @@boundary
  Scenario Outline: Transkription mit Grenzwerten der Dauer
    # Boundary condition: sehr kurze und sehr lange Sprachnachrichten
    Given eine empfangene Sprachnachricht mit der Dauer <dauer>
    When der Nutzer die Transkription startet
    Then ein Transkript wird innerhalb kurzer Zeit angezeigt
    And die Sprachnachricht bleibt abspielbar

    Examples:
      | dauer |
      | 1 Sekunde |
      | 10 Minuten |

  @@regression @@happy-path
  Scenario Outline: Transkription fuer verschiedene unterstuetzte Formate
    # Data-driven happy path: verschiedene gueltige Audioformate
    Given die Sprachnachricht liegt im Format <format> vor
    When der Nutzer die Transkription aktiviert
    Then der Text der Sprachnachricht wird innerhalb kurzer Zeit angezeigt
    And die Sprachnachricht bleibt abspielbar

    Examples:
      | format |
      | MP3 |
      | WAV |
      | OGG |
