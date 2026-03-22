@@smoke @@regression
Feature: Chatverlauf auf neues Gerät übertragen
  As a registrierter Nutzer
  I want to den Chatverlauf auf ein neues Gerät übertragen
  So that damit ich ohne Unterbrechung weiterkommunizieren kann und meine bisherigen Nachrichten sicher verfügbar bleiben

  Background:
    Given der Nutzer ist registriert und auf dem alten Gerät angemeldet
    And ein vorhandener Chatverlauf liegt auf dem alten Gerät vor

  @@smoke @@regression @@happy-path
  Scenario: Erfolgreiche Übertragung des vollständigen Chatverlaufs
    # Happy path: vollständige Übertragung innerhalb angemessener Zeit nach Anmeldung auf neuem Gerät
    Given das neue Gerät ist kompatibel und hat ausreichend Speicherplatz
    When der Nutzer initiiert die Übertragung und meldet sich auf dem neuen Gerät an
    Then der vollständige Chatverlauf wird innerhalb der definierten Zeit übertragen
    And der Nutzer kann ohne Unterbrechung weiterkommunizieren

  @@regression @@edge
  Scenario: Fortsetzung der Übertragung nach Netzwerkunterbrechung
    # Edge case: Übertragung pausiert bei instabiler Verbindung und setzt automatisch fort
    Given die Übertragung ist gestartet und die Netzwerkverbindung ist instabil
    When die Verbindung wird unterbrochen und anschließend wiederhergestellt
    Then die Übertragung wird pausiert und automatisch fortgesetzt
    And es tritt kein Datenverlust im Chatverlauf auf

  @@negative @@regression
  Scenario: Abbruch der Übertragung bei unzureichendem Speicherplatz
    # Error scenario: System bricht Übertragung ab und zeigt verständliche Fehlermeldung
    Given das neue Gerät hat unzureichenden Speicherplatz für den Chatverlauf
    When das System prüft die Voraussetzungen für die Übertragung
    Then die Übertragung wird abgebrochen
    And der Nutzer erhält eine verständliche Fehlermeldung mit Handlungsempfehlung

  @@regression @@boundary
  Scenario: Übertragung bei Grenzwert der Speicherkapazität
    # Boundary condition: Speicherplatz ist exakt gleich der benötigten Größe
    Given das neue Gerät hat exakt den benötigten Speicherplatz für den Chatverlauf
    When der Nutzer initiiert die Übertragung und meldet sich auf dem neuen Gerät an
    Then die Übertragung wird erfolgreich abgeschlossen
    And der Chatverlauf ist vollständig und konsistent verfügbar

  @@regression @@outline
  Scenario Outline: Szenario-Outline: Übertragung bei unterschiedlichen Chatverlauf-Größen
    # Data-driven test für unterschiedliche Größen zur Validierung der Übertragungszeit
    Given der Chatverlauf hat die Größe <history_size_mb> MB
    And das neue Gerät hat mindestens <required_space_mb> MB freien Speicher
    When der Nutzer initiiert die Übertragung und meldet sich auf dem neuen Gerät an
    Then die Übertragung ist innerhalb von <max_time_seconds> Sekunden abgeschlossen
    And der vollständige Chatverlauf ist verfügbar

    Examples:
      | history_size_mb | required_space_mb | max_time_seconds |
      | 50 | 60 | 30 |
      | 500 | 550 | 120 |
