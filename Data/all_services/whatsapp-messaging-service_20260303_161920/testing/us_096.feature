@@smoke @@regression
Feature: Business-Profil Verwaltung
  As a Business-Nutzer
  I want to ein erweitertes Business-Profil erstellen und verwalten
  So that um professionell aufzutreten und Kundenkommunikation sowie Shop-Integration effizient zu unterstützen

  Background:
    Given der Business-Nutzer ist angemeldet und hat Zugriff auf die Profilverwaltung

  @@smoke @@happy-path
  Scenario: Erstellung eines erweiterten Business-Profils mit gültigen Pflicht- und optionalen Feldern
    # Happy path: Profil wird erfolgreich erstellt und angezeigt
    When er alle erforderlichen Felder und optionalen Business-Informationen mit gültigen Werten ausfüllt
    And er das Profil speichert
    Then wird das erweiterte Business-Profil erfolgreich erstellt
    And das Profil wird im Profilbereich angezeigt

  @@regression @@happy-path
  Scenario: Profiländerungen werden plattformübergreifend sichtbar
    # Happy path: Änderungen werden sofort übernommen
    Given ein bestehendes Business-Profil ist vorhanden
    When der Nutzer gültige Änderungen am Profil vornimmt
    And er die Änderungen speichert
    Then werden die Änderungen sofort übernommen
    And die Änderungen sind plattformübergreifend sichtbar

  @@negative @@regression
  Scenario: Validierungsfehler bei fehlenden Pflichtfeldern
    # Error scenario: Speichern wird verhindert, wenn Pflichtfelder fehlen
    Given der Nutzer befindet sich im Profilformular
    When er ein Pflichtfeld leer lässt
    And er das Profil speichert
    Then werden klare Validierungsfehler angezeigt
    And das Speichern wird verhindert

  @@negative @@regression
  Scenario: Validierungsfehler bei ungültigen Werten in Pflichtfeldern
    # Error scenario: Ungültige Eingaben blockieren das Speichern
    Given der Nutzer befindet sich im Profilformular
    When er ein Pflichtfeld mit ungültigem Wert ausfüllt
    And er das Profil speichert
    Then werden klare Validierungsfehler angezeigt
    And das Speichern wird verhindert

  @@negative @@regression
  Scenario: Upload wird abgelehnt, wenn Profilbild oder Dokument gegen Richtlinien verstößt
    # Error scenario: Richtlinienverletzung führt zur Ablehnung
    When der Nutzer ein Profilbild oder Dokument hochlädt, das gegen Richtlinien verstößt
    Then wird der Upload abgelehnt
    And eine Begründung wird angezeigt

  @@regression @@boundary
  Scenario Outline: Scenario Outline: Grenzwerte bei Feldlängen
    # Boundary condition: minimale und maximale zulässige Feldlängen
    Given der Nutzer befindet sich im Profilformular
    When er das Feld <feld> mit einer Länge von <laenge> Zeichen ausfüllt
    And er das Profil speichert
    Then der Status ist <erwartung>

    Examples:
      | feld | laenge | erwartung |
      | Unternehmensname | 1 | erfolgreich gespeichert |
      | Unternehmensname | 255 | erfolgreich gespeichert |
      | Unternehmensname | 256 | Validierungsfehler angezeigt |

  @@regression @@edge
  Scenario Outline: Scenario Outline: Edge Cases für optionale Felder leer oder sehr lang
    # Edge case: optionale Felder können leer sein oder maximale Länge erreichen
    Given der Nutzer befindet sich im Profilformular
    When er das optionale Feld <feld> mit <wert> ausfüllt
    And er das Profil speichert
    Then das Profil wird gespeichert und angezeigt

    Examples:
      | feld | wert |
      | Beschreibung | leer |
      | Beschreibung | maximale zulässige Länge |
