@@smoke @@regression
Feature: Chat-Hintergrund
  As a registrierter Nutzer
  I want to den Chat-Hintergrund individuell auswählen und speichern
  So that Chats persönlicher gestalten und die Bedienung intuitiver erleben

  Background:
    Given der Nutzer ist registriert und angemeldet
    And der Nutzer befindet sich in der Chat-Ansicht

  @@smoke @@regression @@happy-path
  Scenario Outline: Auswahl eines vordefinierten Hintergrunds wird gespeichert
    # Happy path: Nutzer wählt einen verfügbaren Hintergrund und speichert ihn für zukünftige Sitzungen
    Given es stehen anpassbare Hintergründe zur Auswahl
    When der Nutzer wählt den Hintergrund "<hintergrund_name>" und speichert
    Then der ausgewählte Hintergrund wird im Chat angezeigt
    And der ausgewählte Hintergrund bleibt für zukünftige Sitzungen gespeichert

    Examples:
      | hintergrund_name |
      | Nachtmodus |
      | Natur |

  @@regression @@happy-path
  Scenario Outline: Upload eines unterstützten Hintergrundformats wird akzeptiert
    # Happy path: Nutzer lädt eine gültige Datei hoch und der Hintergrund wird angezeigt
    Given der Nutzer hat eine Hintergrunddatei vorbereitet
    When der Nutzer lädt eine Datei im Format "<format>" mit der Größe "<size_mb>" MB hoch
    Then der Hintergrund wird akzeptiert
    And der hochgeladene Hintergrund wird im Chat angezeigt

    Examples:
      | format | size_mb |
      | jpg | 2 |
      | png | 4 |

  @@regression @@negative
  Scenario Outline: Upload eines nicht unterstützten Formats wird abgelehnt
    # Error scenario: Nutzer lädt ein nicht unterstütztes Format hoch
    Given der aktuelle Hintergrund ist "<aktueller_hintergrund>"
    When der Nutzer lädt eine Datei im Format "<format>" hoch
    Then der Nutzer erhält eine verständliche Fehlermeldung
    And der aktuelle Hintergrund bleibt unverändert

    Examples:
      | aktueller_hintergrund | format |
      | Nachtmodus | gif |
      | Natur | bmp |

  @@regression @@negative
  Scenario Outline: Upload mit zu großer Dateigröße wird abgelehnt
    # Error scenario: Datei überschreitet das Größenlimit
    Given das maximale Upload-Limit beträgt "<limit_mb>" MB
    And der aktuelle Hintergrund ist "<aktueller_hintergrund>"
    When der Nutzer lädt eine Datei im Format "<format>" mit der Größe "<size_mb>" MB hoch
    Then der Nutzer erhält eine verständliche Fehlermeldung
    And der aktuelle Hintergrund bleibt unverändert

    Examples:
      | limit_mb | aktueller_hintergrund | format | size_mb |
      | 5 | Nachtmodus | jpg | 6 |

  @@regression @@edge-case
  Scenario Outline: Upload mit Dateigröße am Grenzwert wird akzeptiert
    # Boundary condition: Datei mit exakt maximaler Größe wird akzeptiert
    Given das maximale Upload-Limit beträgt "<limit_mb>" MB
    When der Nutzer lädt eine Datei im Format "<format>" mit der Größe "<size_mb>" MB hoch
    Then der Hintergrund wird akzeptiert
    And der hochgeladene Hintergrund wird im Chat angezeigt

    Examples:
      | limit_mb | format | size_mb |
      | 5 | png | 5 |

  @@regression @@edge-case
  Scenario Outline: Auswahlwechsel ohne Speichern ändert den Hintergrund nicht dauerhaft
    # Edge case: Auswahl ohne Speichern wird nicht persistiert
    Given der aktuell gespeicherte Hintergrund ist "<gespeichert>"
    When der Nutzer wählt den Hintergrund "<neu>" aber speichert nicht
    Then der gespeicherte Hintergrund bleibt "<gespeichert>"
    And nach erneutem Öffnen der Chat-Ansicht wird "<gespeichert>" angezeigt

    Examples:
      | gespeichert | neu |
      | Nachtmodus | Natur |
