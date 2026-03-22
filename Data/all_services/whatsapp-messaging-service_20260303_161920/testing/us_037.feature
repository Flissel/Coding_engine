@smoke @regression
Feature: Gruppenanruf
  As a registrierter Nutzer
  I want to einen Gruppen-Sprach- oder Videoanruf mit mehreren Teilnehmern starten und beitreten
  So that um schnell und zuverlässig plattformübergreifend mit mehreren Personen zu kommunizieren

  Background:
    Given der Nutzer ist angemeldet
    And der Nutzer hat mindestens zwei Kontakte verfügbar

  @smoke @happy-path @regression
  Scenario Outline: Erfolgreicher Start eines Gruppenanrufs mit gewählter Medienart
    # Happy path für Sprach- und Videoanruf mit Benachrichtigung aller Teilnehmer
    Given der Nutzer hat eine Teilnehmerliste aus mehreren Kontakten ausgewählt
    When der Nutzer startet einen Gruppenanruf mit Medienart <media_type>
    Then alle eingeladenen Teilnehmer werden benachrichtigt
    And der Gruppenanruf wird mit der Medienart <media_type> aufgebaut

    Examples:
      | media_type |
      | Sprach |
      | Video |

  @regression @happy-path
  Scenario: Beitritt eines neuen Teilnehmers zu einem laufenden Gruppenanruf
    # Happy path für das Hinzufügen eines Teilnehmers ohne Unterbrechung
    Given ein Gruppenanruf ist aktiv
    And ein weiterer Teilnehmer wird eingeladen
    When der Teilnehmer die Einladung annimmt
    Then der Teilnehmer wird dem laufenden Gruppenanruf hinzugefügt
    And bestehende Teilnehmer erleben keine Unterbrechung

  @edge-case @regression
  Scenario Outline: Kantenfall: maximale Teilnehmerzahl erreicht
    # Boundary condition bei Erreichen der maximal unterstützten Teilnehmerzahl
    Given ein Gruppenanruf ist aktiv mit <max_participants> Teilnehmern
    When ein weiterer Teilnehmer eingeladen wird
    Then die Einladung wird abgelehnt
    And der Nutzer sieht eine verständliche Meldung zur maximalen Teilnehmerzahl

    Examples:
      | max_participants |
      | maximal unterstützte Anzahl |

  @negative @regression
  Scenario: Fehlerfall: Teilnehmer hat instabile Verbindung und Wiederverbindung schlägt fehl
    # Error scenario für automatische Wiederverbindung mit verständlicher Fehlermeldung
    Given die Netzwerkverbindung des Teilnehmers ist instabil
    When der Teilnehmer dem Gruppenanruf beitreten oder verbunden bleiben möchte
    Then das System versucht automatisch eine Wiederverbindung
    And bei Fehlschlag wird eine verständliche Fehlermeldung angezeigt

  @edge-case @regression
  Scenario: Kantenfall: Einladung wird angenommen, während Netzwerk kurzzeitig getrennt ist
    # Edge case für kurzzeitigen Netzwerkabbruch beim Beitritt
    Given ein Gruppenanruf ist aktiv
    And der Teilnehmer hat eine Einladung erhalten
    When der Teilnehmer die Einladung während eines kurzen Netzwerkabbruchs annimmt
    Then das System versucht automatisch eine Wiederverbindung
    And der Teilnehmer wird nach erfolgreicher Wiederverbindung dem Anruf hinzugefügt
