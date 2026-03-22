@@smoke @@regression
Feature: Screenreader-Unterstuetzung
  As a Endnutzer
  I want to die Anwendung vollständig per Screenreader bedienen
  So that damit ich die Plattform barrierefrei, intuitiv und zuverlässig nutzen kann

  Background:
    Given ein unterstütztes Endgerät mit aktiviertem Screenreader

  @@smoke @@regression @@happy-path
  Scenario: Hauptnavigation und zentrale Funktionen sind vollständig bedienbar
    # Validiert, dass alle Bedienelemente korrekt vorgelesen und bedienbar sind
    Given die Anwendung ist gestartet und der Fokus liegt auf der Hauptnavigation
    When ich mit dem Screenreader durch die Navigation und zentrale Funktionen navigiere
    Then werden alle Bedienelemente mit eindeutiger Beschriftung vorgelesen
    And jeder Fokuspunkt ist vollständig bedienbar ohne Maus

  @@regression @@happy-path
  Scenario Outline: Formularfelder werden korrekt vorgelesen und validiert
    # Data-driven Prüfung von Feldbeschriftungen, Pflichtfeldern und Validierungshinweisen
    Given eine komplexe Ansicht mit einem Formular
    When ich das Feld "<field>" mit dem Wert "<value>" ausfülle und das Formular absende
    Then liest der Screenreader die Feldbeschriftung und den Pflichtstatus korrekt vor
    And werden Validierungshinweise eindeutig angesagt und sichtbar angezeigt

    Examples:
      | field | value |
      | E-Mail | user@example.com |
      | Telefonnummer | +49 151 12345678 |

  @@regression @@edge
  Scenario: Dynamische Inhalte werden ohne Fokusverlust angekündigt
    # Prüft ARIA-Live-Updates und Zugänglichkeit neuer Inhalte
    Given eine Nachrichtenliste mit aktivem Live-Update-Bereich
    When neue Inhalte in der Liste geladen werden
    Then kündigt der Screenreader die Änderungen an, ohne den Fokus zu verlieren
    And sind die neuen Einträge direkt per Tastatur erreichbar

  @@regression @@negative @@error
  Scenario Outline: Fehlerhafte Formulareingabe führt zu korrekt vorgelesenen Fehlermeldungen
    # Negativtest für Pflichtfelder und Fehleransagen
    Given ein Formular mit Pflichtfeldern
    When ich das Pflichtfeld "<required_field>" leer lasse und das Formular absende
    Then liest der Screenreader die Fehlermeldung eindeutig vor
    And wird der Fokus auf das fehlerhafte Feld gesetzt

    Examples:
      | required_field |
      | Name |
      | E-Mail |

  @@regression @@boundary
  Scenario: Grenzfall: sehr lange Beschriftungen werden vollständig vorgelesen
    # Boundary-Test für lange Labels und eindeutige Vorlesbarkeit
    Given ein Formularfeld mit einer sehr langen Beschriftung
    When ich den Fokus auf das Feld setze
    Then liest der Screenreader die vollständige Beschriftung ohne Abbruch vor
    And bleibt die Bedienbarkeit des Feldes erhalten
