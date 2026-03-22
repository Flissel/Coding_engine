@@smoke @@regression
Feature: Audio-Dateien senden
  As a Endnutzer
  I want to Audio-Dateien in einer Nachricht senden
  So that um Informationen schnell und intuitiv zu teilen und eine zuverlässige Kommunikation sicherzustellen

  Background:
    Given der Endnutzer ist im Chat mit einem Empfänger angemeldet
    And der Chat ist geöffnet und bereit für den Nachrichtversand

  @@smoke @@regression @@happy-path
  Scenario Outline: Erfolgreiches Senden unterstützter Audio-Dateien
    # Validiert, dass unterstützte Audio-Dateien erfolgreich übertragen und beim Empfänger abspielbar sind
    Given der Endnutzer hat eine unterstützte Audio-Datei <format> mit Größe <size_mb> MB ausgewählt
    When er die Nachricht sendet
    Then wird die Audio-Datei erfolgreich übertragen
    And die Audio-Datei ist beim Empfänger abspielbar

    Examples:
      | format | size_mb |
      | mp3 | 3 |
      | wav | 8 |

  @@regression @@negative
  Scenario Outline: Blockierung nicht unterstützter oder zu großer Audio-Dateien
    # Validiert, dass ungültige Audio-Dateien blockiert und verständliche Fehlermeldungen angezeigt werden
    Given der Endnutzer hat eine Audio-Datei <format> mit Größe <size_mb> MB ausgewählt
    And die maximale zulässige Dateigröße beträgt <max_size_mb> MB
    When er versucht, die Nachricht zu senden
    Then wird die Übertragung blockiert
    And eine verständliche Fehlermeldung <error_message> wird angezeigt

    Examples:
      | format | size_mb | max_size_mb | error_message |
      | exe | 2 | 10 | Dateiformat wird nicht unterstützt |
      | mp3 | 15 | 10 | Datei überschreitet die maximale Größe |

  @@regression @@negative
  Scenario Outline: Sendestatus bei instabiler Netzwerkverbindung
    # Validiert den Sendestatus und Wiederholungslogik bei Netzwerkproblemen
    Given der Endnutzer hat eine unterstützte Audio-Datei <format> mit Größe <size_mb> MB ausgewählt
    And die Netzwerkverbindung ist <network_state>
    When er die Nachricht sendet
    Then wird der Sendestatus <status_display> angezeigt
    And die Übertragung wird <retry_behavior>

    Examples:
      | format | size_mb | network_state | status_display | retry_behavior |
      | mp3 | 5 | instabil | Wird gesendet | automatisch wiederholt |
      | mp3 | 5 | unterbrochen | Fehlgeschlagen | als fehlgeschlagen markiert |

  @@regression @@boundary
  Scenario Outline: Grenzwerte für maximale Dateigröße
    # Validiert das Verhalten bei Dateigrößen an der Grenze der zulässigen Größe
    Given die maximale zulässige Dateigröße beträgt <max_size_mb> MB
    And der Endnutzer hat eine unterstützte Audio-Datei mit Größe <size_mb> MB ausgewählt
    When er die Nachricht sendet
    Then ist das Ergebnis <expected_outcome>
    And die Benutzeroberfläche zeigt die Meldung <ui_message>

    Examples:
      | max_size_mb | size_mb | expected_outcome | ui_message |
      | 10 | 10 | Übertragung erfolgreich | Nachricht gesendet |
      | 10 | 10.01 | Übertragung blockiert | Datei überschreitet die maximale Größe |
