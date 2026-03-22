@@smoke @@regression
Feature: Desktop-App Installation und Kommunikation
  As a Geschaeftsnutzer
  I want to die native Desktop-App auf seinem Betriebssystem installieren und fuer die Kommunikation nutzen
  So that um eine einfache, schnelle und sichere Kundenkommunikation plattformuebergreifend zu ermoeglichen

  Background:
    Given die Desktop-App ist zum Download verfuegbar

  @@smoke @@happy-path
  Scenario Outline: Erfolgreiche Installation und Kommunikation auf unterstuetztem Betriebssystem
    # Validiert die Installation, Anmeldung und den Nachrichtenaustausch auf Windows und macOS
    Given der Geschaeftsnutzer verwendet ein unterstuetztes Betriebssystem <os>
    When er die Desktop-App herunterlaedt und installiert
    And er sich mit gueltigen Zugangsdaten anmeldet
    Then kann er eine Nachricht senden und empfangen
    And die App reagiert performant innerhalb der vereinbarten Antwortzeit

    Examples:
      | os |
      | Windows |
      | macOS |

  @@regression @@negative
  Scenario Outline: Installationsversuch auf nicht unterstuetztem Betriebssystem
    # Stellt sicher, dass ein Hinweis und alternative Zugriffsmöglichkeiten angezeigt werden
    Given der Geschaeftsnutzer verwendet ein nicht unterstuetztes Betriebssystem <os>
    When er versucht, die Desktop-App zu installieren
    Then erhaelt er einen Hinweis auf die nicht verfuegbare Plattform
    And es werden alternative Zugriffsmöglichkeiten angezeigt

    Examples:
      | os |
      | Linux |
      | ChromeOS |

  @@regression @@negative
  Scenario: Senden einer Nachricht ohne Internetverbindung
    # Validiert die Fehlermeldung und dass keine Nachricht gesendet wird
    Given der Geschaeftsnutzer ist in der Desktop-App angemeldet
    And keine Internetverbindung ist verfuegbar
    When er versucht, eine Nachricht zu senden
    Then wird eine klare Fehlermeldung angezeigt
    And die Nachricht wird nicht versendet

  @@regression @@edge
  Scenario Outline: Grenzfall: Start der App mit minimaler Bandbreite
    # Prueft die App-Performance und Stabilitaet bei niedriger Netzqualitaet
    Given der Geschaeftsnutzer verwendet ein unterstuetztes Betriebssystem <os>
    And die Internetverbindung hat minimale Bandbreite <bandwidth>
    When er die Desktop-App startet und sich anmeldet
    Then laedt die App die Nachrichtenliste ohne Absturz
    And die App reagiert innerhalb akzeptabler Antwortzeiten

    Examples:
      | os | bandwidth |
      | Windows | 256 kbps |
      | macOS | 256 kbps |

  @@regression @@boundary
  Scenario Outline: Grenzwert: Maximale Nachrichtengroesse senden
    # Stellt sicher, dass eine Nachricht mit maximal erlaubter Laenge gesendet wird
    Given der Geschaeftsnutzer ist in der Desktop-App angemeldet
    And eine Nachricht mit der Laenge <max_length> ist vorbereitet
    When er die Nachricht sendet
    Then wird die Nachricht erfolgreich versendet
    And die Nachricht erscheint im gesendeten Verlauf

    Examples:
      | max_length |
      | 2000 Zeichen |
