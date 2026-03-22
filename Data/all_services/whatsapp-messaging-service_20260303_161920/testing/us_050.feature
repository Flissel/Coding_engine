@smoke @regression
Feature: Bildbearbeitung vor dem Senden
  As a App-Nutzer
  I want to ein Bild vor dem Senden zuschneiden und drehen
  So that damit Inhalte schnell und datenschutzkonform optimiert werden und die Nachricht professionell wirkt

  Background:
    Given der Nutzer ist im Nachrichteneditor und hat die Bildbearbeitung geöffnet

  @happy-path @smoke @regression
  Scenario: Bild zuschneiden und drehen mit Vorschau senden
    # Happy Path: Bearbeitung wird erfolgreich angewendet und gesendet
    Given ein Bild ist in der Nachricht ausgewählt
    When der Nutzer das Bild zuschneidet und um 90 Grad dreht
    Then wird eine Vorschau des bearbeiteten Bildes angezeigt
    And das bearbeitete Bild wird beim Senden verwendet

  @happy-path @regression
  Scenario: Originalbild senden ohne Bearbeitung
    # Happy Path: Bestätigung ohne Änderungen sendet Original
    Given ein Bild ist geöffnet und es wurden keine Bearbeitungen vorgenommen
    When der Nutzer die Bearbeitung bestätigt
    Then wird das Originalbild ohne Änderungen gesendet
    And es wird keine Bearbeitungsmarkierung gespeichert

  @negative @regression
  Scenario: Bearbeitung fehlgeschlagen oder abgebrochen
    # Error: Fehlermeldung und Original bleibt unverändert
    Given die Bearbeitungsschnittstelle ist geöffnet
    When eine Bearbeitungsaktion fehlschlägt oder abgebrochen wird
    Then erhält der Nutzer eine Fehlermeldung
    And das Originalbild bleibt unverändert

  @edge @regression
  Scenario Outline: Szenarien für Zuschnitt- und Drehwinkelgrenzen
    # Boundary/Edge: minimale maximale Zuschnittgröße und Drehwinkel
    Given ein Bild ist in der Nachricht ausgewählt
    When der Nutzer das Bild auf <crop_area> zuschneidet und um <rotation> Grad dreht
    Then wird eine gültige Vorschau angezeigt
    And das bearbeitete Bild wird korrekt gesendet

    Examples:
      | crop_area | rotation |
      | die minimal zulässige Fläche | 0 |
      | die maximal zulässige Fläche | 360 |
      | ein quadratischer Zuschnitt | 270 |
