@smoke @regression
Feature: Schriftgroesse
  As a Endnutzer
  I want to die Schriftgröße in der Anwendung anpassen
  So that die Bedienung einfacher und intuitiver zu gestalten und Inhalte besser lesen zu können

  Background:
    Given der Endnutzer ist in der Anwendung
    And die Anzeigeeinstellungen sind geöffnet

  @@smoke @@regression @@happy-path
  Scenario Outline: Schriftgröße wird sofort angewendet
    # Happy path: verfügbare Schriftgröße wird bestätigt und sofort angezeigt
    Given eine Liste verfügbarer Schriftgrößen wird angezeigt
    When der Endnutzer die Schriftgröße "<size>" auswählt und bestätigt
    Then werden alle Texte im aktiven Bereich sofort in der Schriftgröße "<size>" angezeigt
    And die Auswahl wird als aktuell gesetzt angezeigt

    Examples:
      | size |
      | Mittel |
      | Groß |

  @@regression @@negative @@boundary
  Scenario Outline: Grenzwert-Überschreitung setzt nächstzulässige Schriftgröße
    # Boundary/Error: überschreitet Mindest- oder Höchstgrenze und System korrigiert
    Given die Mindestgröße ist "<min>" und die Höchstgröße ist "<max>"
    When der Endnutzer einen extremen Wert "<requested>" setzt und bestätigt
    Then setzt das System die nächstzulässige Schriftgröße "<applied>"
    And der Endnutzer wird über die Anpassung informiert

    Examples:
      | min | max | requested | applied |
      | Sehr klein | Sehr groß | Unter Minimum | Sehr klein |
      | Sehr klein | Sehr groß | Über Maximum | Sehr groß |

  @@regression @@negative
  Scenario Outline: Ungültige Schriftgröße wird abgelehnt
    # Error scenario: nicht verfügbare Schriftgröße kann nicht gewählt werden
    Given die Schriftgröße "<invalid_size>" ist nicht verfügbar
    When der Endnutzer versucht die Schriftgröße "<invalid_size>" auszuwählen
    Then wird die Auswahl abgelehnt
    And eine Fehlermeldung informiert über die ungültige Auswahl

    Examples:
      | invalid_size |
      | XXL |
      | 0pt |

  @@regression @@edge-case
  Scenario Outline: Gespeicherte Schriftgröße wird wiederhergestellt
    # Edge case: Schriftgröße bleibt bei Neustart oder Gerätewechsel erhalten, wenn angemeldet
    Given der Endnutzer ist angemeldet
    And der Endnutzer speichert die Schriftgröße "<saved_size>"
    When der Endnutzer die Anwendung "<event>"
    Then wird die zuletzt gespeicherte Schriftgröße "<saved_size>" wiederhergestellt

    Examples:
      | saved_size | event |
      | Klein | neu startet |
      | Groß | auf einem anderen Gerät öffnet |
