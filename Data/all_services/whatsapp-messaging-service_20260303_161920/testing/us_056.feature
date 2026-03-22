@@smoke @@regression
Feature: HD-Medien senden
  As a Nutzer
  I want to Medien in HD-Qualität senden
  So that damit die Kommunikation hochwertig wirkt und Details klar erkennbar sind

  Background:
    Given der Nutzer ist in der Medienansicht eines Chats
    And das Gerät unterstützt HD-Medienversand

  @@smoke @@regression @@happy-path
  Scenario: HD-Foto erfolgreich senden und empfangen
    # Happy path: HD-Foto wird in HD übertragen und angezeigt
    Given die Netzwerkverbindung ist stabil
    And das Foto liegt innerhalb der HD-Grenzen
    When der Nutzer das Foto als HD sendet
    Then wird das Foto in HD-Qualität übertragen
    And der Empfänger sieht das Foto in HD

  @@regression @@happy-path
  Scenario: HD-Video erfolgreich senden und empfangen
    # Happy path: HD-Video wird in HD übertragen und angezeigt
    Given die Netzwerkverbindung ist stabil
    And das Video liegt innerhalb der HD-Grenzen
    When der Nutzer das Video als HD sendet
    Then wird das Video in HD-Qualität übertragen
    And der Empfänger sieht das Video in HD

  @@regression @@boundary
  Scenario Outline: Grenzwerte für HD-Dateigröße und Auflösung
    # Boundary conditions: genau an den zulässigen HD-Grenzen senden
    Given die Netzwerkverbindung ist stabil
    And das Medium hat Dateigröße und Auflösung exakt an der HD-Grenze
    When der Nutzer das Medium als HD sendet
    Then wird das Medium in HD-Qualität übertragen
    And der Empfänger sieht das Medium in HD

    Examples:
      | media_type | file_size_mb | resolution |
      | Foto | max_hd_size | max_hd_resolution |
      | Video | max_hd_size | max_hd_resolution |

  @@regression @@negative
  Scenario Outline: Überschreitung der HD-Dateigröße oder Auflösung
    # Error scenario: verständliche Fehlermeldung bei Überschreitung
    Given die Netzwerkverbindung ist stabil
    And das Medium überschreitet die HD-Grenzen
    When der Nutzer den Versand startet
    Then erhält der Nutzer eine verständliche Fehlermeldung
    And die Fehlermeldung nennt die zulässigen Grenzen

    Examples:
      | media_type | excess_type |
      | Foto | Dateigröße |
      | Video | Auflösung |

  @@regression @@edge
  Scenario Outline: Instabile oder langsame Verbindung beim HD-Versand
    # Edge case: Versand wird abgeschlossen oder Wiederholung angeboten
    Given die Netzwerkverbindung ist instabil oder langsam
    And das Medium liegt innerhalb der HD-Grenzen
    When der Nutzer das Medium als HD sendet
    Then wird der Versand zuverlässig abgeschlossen oder eine Wiederholungs-Meldung angezeigt
    And bei Wiederholung kann der Nutzer den Versand erneut starten

    Examples:
      | network_condition |
      | instabil |
      | langsam |
