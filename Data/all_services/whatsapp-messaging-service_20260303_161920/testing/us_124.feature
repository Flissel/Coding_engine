@smoke @regression
Feature: RTL-Unterstuetzung
  As a Endnutzer
  I want to die Benutzeroberflaeche in einer rechts-nach-links Sprache verwenden
  So that um die Anwendung intuitiv und fehlerfrei bedienen zu koennen

  Background:
    Given die Anwendung ist verfuegbar und der Nutzer ist angemeldet

  @smoke @regression @happy-path
  Scenario: Hauptnavigation und Inhaltsseiten werden in RTL korrekt dargestellt
    # Verifiziert das Layout, die Textausrichtung und die Navigation in RTL
    Given die Anwendung ist auf eine rechts-nach-links Sprache eingestellt
    When der Nutzer die Hauptnavigation und eine Inhaltsseite oeffnet
    Then werden Layout und Navigation vollstaendig rechts-nach-links dargestellt
    And sind alle Texte rechtsbuendig ausgerichtet

  @regression @happy-path
  Scenario: Speichern und Laden von RTL-Inhalten bleibt konsistent
    # Sichert die Persistenz von Richtung, Ausrichtung und Reihenfolge bei RTL-Inhalten
    Given der Nutzer erstellt Inhalte in einer rechts-nach-links Sprache
    When die Texteingaben gespeichert und erneut geladen werden
    Then bleiben Richtung, Ausrichtung und Reihenfolge der Inhalte konsistent rechts-nach-links erhalten
    And werden keine unerwarteten LTR-Abschnitte angezeigt

  @regression @edge-case
  Scenario: Gemischte Inhalte werden korrekt dargestellt
    # Validiert die Darstellung von gemischten RTL- und LTR-Texten auf einer Seite
    Given es existieren gemischte Inhalte aus rechts-nach-links und links-nach-rechts Text
    When der Nutzer eine Seite mit gemischten Inhalten aufruft
    Then werden beide Schreibrichtungen korrekt und ohne Darstellungsfehler wiedergegeben
    And bleibt die Leserichtung innerhalb jeder Textpassage korrekt

  @regression @edge-case
  Scenario: RTL-Wechsel waehrend aktiver Sitzung
    # Prueft die UI-Aktualisierung bei dynamischem Sprachwechsel
    Given die Anwendung ist aktuell auf eine links-nach-rechts Sprache eingestellt
    When der Nutzer die Sprache auf eine rechts-nach-links Sprache umstellt
    Then aktualisieren sich Layout und Textausrichtung ohne Neuladen korrekt auf RTL
    And bleiben Navigationspositionen funktional erreichbar

  @regression @negative @error
  Scenario: Fehler bei unbekannter Spracheinstellung verhindert inkonsistente Darstellung
    # Validiert das Fehlerverhalten bei ungueltiger Spracheinstellung
    Given der Nutzer versucht eine nicht unterstuetzte Spracheinstellung zu verwenden
    When die Anwendung die Spracheinstellung speichert
    Then wird eine verständliche Fehlermeldung angezeigt
    And bleibt die vorherige gueltige Schreibrichtung aktiv

  @regression @boundary
  Scenario: Boundary: Sehr lange RTL-Texte bleiben korrekt ausgerichtet
    # Prueft die Darstellung bei sehr langen RTL-Texten ohne Zeilenumbruchsfehler
    Given der Nutzer erstellt einen sehr langen RTL-Text im Editor
    When der Text gespeichert und erneut angezeigt wird
    Then bleibt die Ausrichtung rechtsbuendig und der Text wird korrekt umgebrochen
    And treten keine abgeschnittenen Zeichen oder Ueberlappungen auf

  @smoke @regression
  Scenario Outline: Scenario Outline: RTL-Lokalisierung in verschiedenen Modulen
    # Stellt sicher, dass RTL in mehreren Modulen konsistent angewendet wird
    Given die Anwendung ist auf eine rechts-nach-links Sprache eingestellt
    When der Nutzer das Modul <module> oeffnet
    Then sind Layout und Texte im Modul <module> rechts-nach-links dargestellt
    And ist die Navigation im Modul <module> rechtsbuendig positioniert

    Examples:
      | module |
      | Dashboard |
      | Einstellungen |
      | Profil |

  @regression @edge-case
  Scenario Outline: Scenario Outline: Gemischte Inhalte mit Zahlen und URLs
    # Validiert korrekte Darstellung von RTL mit eingebetteten LTR-Elementen
    Given es gibt einen Inhalt mit RTL-Text und eingebettetem LTR-Element <ltr_element>
    When der Nutzer die Inhaltsseite oeffnet
    Then werden RTL-Text und <ltr_element> korrekt ohne Darstellungsfehler angezeigt
    And bleibt die Leserichtung des <ltr_element> links-nach-rechts

    Examples:
      | ltr_element |
      | URL |
      | Zahl |
      | E-Mail-Adresse |
