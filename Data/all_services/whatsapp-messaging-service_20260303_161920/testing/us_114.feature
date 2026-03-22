@@smoke @@regression
Feature: Speichereffizienz
  As a Systemadministrator
  I want to Speicherverbrauch des Systems überwachen und sicherstellen, dass Nachrichten und Medien speichereffizient abgelegt werden
  So that Betriebskosten senken und eine schnelle Performance sowie zuverlässige Zustellung sicherstellen

  Background:
    Given das System befindet sich im Normalbetrieb und die Speicherüberwachung ist aktiviert

  @@smoke @@regression @@happy-path
  Scenario: Komprimierung und Deduplizierung reduziert Speicherverbrauch pro Nachricht
    # Happy path: Daten werden komprimiert und dedupliziert gespeichert und bleiben unter dem Grenzwert
    Given eine Nachricht und ein Medienobjekt mit wiederholten Inhalten liegen zur Speicherung vor
    When die Daten gespeichert werden
    Then werden die Daten komprimiert abgelegt
    And identische Datenblöcke werden dedupliziert
    And der Speicherverbrauch pro Nachricht liegt unter dem definierten Grenzwert

  @@regression @@edge @@boundary
  Scenario: Archivierung/Bereinigung wird am Warnschwellwert automatisch angewendet
    # Edge case und Boundary: nahe am Warnschwellwert wird automatisch archiviert/bereinigt ohne Ausfälle
    Given der verfügbare Speicher liegt bei 1% über dem Warnschwellwert
    When neue Inhalte gespeichert werden sollen
    Then Archivierungs- oder Bereinigungsregeln werden automatisch angewendet
    And der Betrieb bleibt ohne Ausfälle
    And die neuen Inhalte werden erfolgreich gespeichert

  @@regression @@negative @@error
  Scenario: Nicht komprimierbare oder beschädigte Datei wird abgelehnt
    # Error scenario: Speichern schlägt fehl, Fehler wird protokolliert und andere Daten bleiben unbeeinträchtigt
    Given eine nicht komprimierbare oder beschädigte Datei liegt zur Speicherung vor
    When das System die Speicherung versucht
    Then wird ein definierter Fehler protokolliert
    And die Speicherung der Datei wird abgelehnt
    And andere bereits gespeicherte Daten bleiben unverändert

  @@regression @@boundary
  Scenario Outline: Scenario Outline: Speicherverbrauch pro Nachricht bleibt unter Grenzwert für verschiedene Datengrößen
    # Boundary conditions: verschiedene Größen und Kompressionsraten werden geprüft
    Given eine Nachricht mit Rohgröße <raw_size_mb> MB und Kompressionsrate <compression_rate> liegt zur Speicherung vor
    When die Nachricht gespeichert wird
    Then der Speicherverbrauch pro Nachricht ist kleiner oder gleich <storage_limit_mb> MB
    And die Nachricht ist erfolgreich abrufbar

    Examples:
      | raw_size_mb | compression_rate | storage_limit_mb |
      | 10 | 0.5 | 6 |
      | 50 | 0.8 | 40 |
      | 100 | 0.9 | 90 |
