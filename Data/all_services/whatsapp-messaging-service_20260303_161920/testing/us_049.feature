@smoke @regression
Feature: Dokumente senden
  As a Endnutzer
  I want to beliebige Dokumente über den Dienst senden
  So that um schnell, sicher und plattformübergreifend Informationen mit anderen zu teilen

  Background:
    Given der Nutzer ist angemeldet und ein Empfänger wurde ausgewählt

  @happy-path @smoke @regression
  Scenario Outline: Unterstütztes Dokument erfolgreich senden
    # Happy Path: Ein unterstütztes Dokument wird erfolgreich übertragen und bestätigt
    When der Nutzer wählt ein unterstütztes Dokument mit der Dateigröße "<file_size_mb>" MB aus
    And der Nutzer klickt auf „Senden“
    Then das Dokument wird erfolgreich übertragen
    And eine Versandbestätigung wird angezeigt

    Examples:
      | file_size_mb |
      | 2 |
      | 10 |

  @edge @regression @negative
  Scenario Outline: Größenbeschränkung bei zu großem Dokument
    # Boundary/Edge: Dokumente über dem Grenzwert werden blockiert
    Given die maximale Dateigröße beträgt "<max_size_mb>" MB
    When der Nutzer wählt ein Dokument mit der Dateigröße "<file_size_mb>" MB aus
    Then der Nutzer wird über Größenbeschränkungen informiert
    And das Senden wird verhindert

    Examples:
      | max_size_mb | file_size_mb |
      | 20 | 21 |
      | 20 | 100 |

  @boundary @regression
  Scenario Outline: Senden am Grenzwert der Dateigröße
    # Boundary: Dokument genau am Grenzwert kann gesendet werden
    Given die maximale Dateigröße beträgt "<max_size_mb>" MB
    When der Nutzer wählt ein Dokument mit der Dateigröße "<file_size_mb>" MB aus
    And der Nutzer klickt auf „Senden“
    Then das Dokument wird erfolgreich übertragen
    And eine Versandbestätigung wird angezeigt

    Examples:
      | max_size_mb | file_size_mb |
      | 20 | 20 |

  @error @regression @negative
  Scenario: Netzwerkabbruch während des Sendens
    # Error: Abbruch der Netzwerkverbindung zeigt Fehler und ermöglicht Wiederholung
    Given eine stabile Netzwerkverbindung besteht
    When der Nutzer wählt ein unterstütztes Dokument aus und startet den Versand
    And die Netzwerkverbindung bricht während des Sendens ab
    Then der Nutzer erhält eine Fehlermeldung
    And der Nutzer kann den Versand erneut versuchen
