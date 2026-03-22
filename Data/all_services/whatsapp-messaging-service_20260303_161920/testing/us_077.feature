@@smoke @@regression
Feature: Mediensuche nach Medientypen filtern
  As a Endnutzer
  I want to die Mediensuche nach Medientypen filtern
  So that schnell die relevanten Inhalte finden und die Bedienung intuitiv halten

  Background:
    Given eine Suchergebnisliste mit verschiedenen Medientypen ist geöffnet

  @@happy-path @@smoke @@regression
  Scenario: Filter auf einzelnen Medientyp anwenden
    # Happy path: Nur Ergebnisse des ausgewählten Medientyps werden angezeigt
    When der Nutzer den Medientyp-Filter "Video" auswählt
    Then werden ausschließlich Ergebnisse des Medientyps "Video" angezeigt
    And alle angezeigten Ergebnisse tragen den Medientyp "Video"

  @@happy-path @@regression
  Scenario: Mehrere Medientypen filtern
    # Happy path: Ergebnisse aus mehreren ausgewählten Medientypen werden zusammen angezeigt
    When der Nutzer die Medientyp-Filter "Video" und "Artikel" auswählt
    Then werden Ergebnisse angezeigt, die zu mindestens einem der ausgewählten Medientypen gehören
    And kein Ergebnis eines nicht ausgewählten Medientyps wird angezeigt

  @@edge @@regression
  Scenario: Keine Treffer für ausgewählten Medientyp
    # Edge case: Leere Ergebnisliste mit Hinweis bei fehlenden Treffern
    When der Nutzer den Medientyp-Filter "Podcast" auswählt, für den keine Ergebnisse existieren
    Then zeigt das System eine leere Ergebnisliste an
    And ein Hinweis erscheint, dass keine Treffer gefunden wurden

  @@boundary @@regression
  Scenario: Filter mit Mindestanzahl an Ergebnissen
    # Boundary: Genau ein Treffer für den gewählten Medientyp
    Given für den Medientyp "Audio" existiert genau ein Ergebnis
    When der Nutzer den Medientyp-Filter "Audio" auswählt
    Then wird genau ein Ergebnis angezeigt
    And das angezeigte Ergebnis hat den Medientyp "Audio"

  @@edge @@regression
  Scenario: Filterkombination ohne Überschneidung
    # Edge case: Auswahl mehrerer Medientypen mit keinen Ergebnissen insgesamt
    Given für die Medientypen "E-Book" und "Präsentation" existieren keine Ergebnisse
    When der Nutzer die Medientyp-Filter "E-Book" und "Präsentation" auswählt
    Then zeigt das System eine leere Ergebnisliste an
    And ein Hinweis erscheint, dass keine Treffer gefunden wurden

  @@negative @@regression
  Scenario: Ungültiger Medientyp-Filter
    # Error scenario: System reagiert auf nicht existierenden Medientyp
    When der Nutzer einen nicht verfügbaren Medientyp-Filter auswählt
    Then zeigt das System eine Fehlermeldung zur ungültigen Filterauswahl
    And die vorhandenen Ergebnisse bleiben unverändert sichtbar

  @@happy-path @@regression
  Scenario Outline: Szenario Outline: Filtern nach einzelnen Medientypen
    # Data-driven: Prüfung mehrerer Medientyp-Filter
    When der Nutzer den Medientyp-Filter "<medientyp>" auswählt
    Then werden ausschließlich Ergebnisse des Medientyps "<medientyp>" angezeigt
    And alle angezeigten Ergebnisse tragen den Medientyp "<medientyp>"

    Examples:
      | medientyp |
      | Video |
      | Artikel |
      | Audio |

  @@regression
  Scenario Outline: Szenario Outline: Mehrfachfilter mit erwarteter Trefferanzahl
    # Data-driven: Kombinationen ausgewählter Medientypen
    When der Nutzer die Medientyp-Filter "<typ1>" und "<typ2>" auswählt
    Then werden Ergebnisse angezeigt, die zu mindestens einem der ausgewählten Medientypen gehören
    And die Anzahl der Ergebnisse entspricht "<erwartete_anzahl>"

    Examples:
      | typ1 | typ2 | erwartete_anzahl |
      | Video | Artikel | 5 |
      | Audio | Artikel | 3 |
