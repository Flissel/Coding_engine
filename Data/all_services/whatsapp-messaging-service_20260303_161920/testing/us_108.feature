@smoke @regression
Feature: Kontrast
  As a Endnutzer
  I want to die Benutzeroberflaeche mit ausreichendem Farbkontrast nutzen
  So that damit Inhalte schnell und sicher lesbar sind und die Bedienung intuitiv bleibt

  Background:
    Given die Anwendung ist geladen und die Standard-Benutzeroberflaeche ist sichtbar

  @happy-path @smoke @regression
  Scenario: Standard-UI erreicht Mindestkontrast fuer alle relevanten Elemente
    # Happy Path: Texte, Icons und interaktive Elemente erfuellen das Mindestkontrastverhaeltnis
    Given die Standard-Benutzeroberflaeche wird angezeigt
    When der Endnutzer Texte, Icons und interaktive Elemente betrachtet
    Then alle relevanten Vordergrund-Hintergrund-Kombinationen erreichen mindestens 4,5:1 Kontrastverhaeltnis
    And die Lesbarkeit der Inhalte bleibt erhalten

  @happy-path @regression
  Scenario: Interaktive Elemente behalten ausreichenden Kontrast in allen Zustaenden
    # Happy Path: Kontrast bleibt fuer normal, Hover, Fokus und deaktiviert ausreichend
    Given ein interaktives Element mit mehreren Zustaenden ist sichtbar
    When der Endnutzer zwischen normal, Hover, Fokus und deaktiviert wechselt
    Then der Kontrast ist in jedem Zustand mindestens 4,5:1
    And die Lesbarkeit der Beschriftung bleibt erhalten

  @negative @regression
  Scenario: Kontrastwarnung oder Ersatzfarbe bei unzureichender benutzerdefinierter Kombination
    # Error Scenario: System reagiert auf zu geringen Kontrast
    Given eine benutzerdefinierte Farbkombination ist konfiguriert
    When das System die Darstellung rendert
    Then wird eine Warnung angezeigt oder eine zugelassene Ersatzfarbe gesetzt
    And das Mindestkontrastverhaeltnis von 4,5:1 wird nicht unterschritten

  @regression
  Scenario Outline: Grenzwerte fuer Kontrastverhaeltnis bei Standard-Elementen
    # Boundary Conditions: Kontrast genau am Grenzwert und knapp darunter
    Given die Standard-Benutzeroberflaeche wird angezeigt
    When die Vordergrund-Hintergrund-Kombination einen Kontrastwert von <kontrast> erreicht
    Then das System bewertet die Kombination als <erwartung>
    And die Darstellung ist entsprechend zugelassen oder blockiert

    Examples:
      | kontrast | erwartung |
      | 4.5:1 | zulässig |
      | 4.49:1 | nicht zulässig |

  @edge @regression
  Scenario Outline: Benutzerdefinierte Farbkombinationen werden datengesteuert validiert
    # Edge Cases: Verschiedene benutzerdefinierte Farben und deren Verhalten
    Given eine benutzerdefinierte Farbkombination fuer Vordergrund und Hintergrund ist gesetzt
    When das System die Darstellung rendert
    Then das Ergebnis entspricht der Regel zur Mindestkontrastpruefung
    And eine Warnung oder Ersatzfarbe wird gemaess Erwartung angezeigt

    Examples:
      | vordergrund | hintergrund | erwartung |
      | #000000 | #FFFFFF | keine Warnung, Kombination zulaessig |
      | #777777 | #FFFFFF | Warnung oder Ersatzfarbe |
      | #FFFFFF | #000000 | keine Warnung, Kombination zulaessig |

  @negative @regression
  Scenario: Interaktives Element mit fehlendem Fokus-Stil wird erkannt
    # Error Scenario: Unvollstaendiger Zustand fuehrt zu unzureichendem Kontrast
    Given ein interaktives Element hat keinen definierten Fokus-Stil
    When der Endnutzer den Fokus auf das Element setzt
    Then das System erkennt unzureichenden Kontrast oder fehlenden Fokus-Stil
    And eine Warnung wird angezeigt oder ein Standard-Fokus-Stil wird angewendet
