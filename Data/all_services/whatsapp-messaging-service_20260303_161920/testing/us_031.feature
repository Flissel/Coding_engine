@@smoke @@regression
Feature: Community
  As a Endnutzer
  I want to eine Community mit mehreren Gruppen erstellen und verwalten
  So that damit unterschiedliche Themenbereiche getrennt organisiert und dennoch unter einem gemeinsamen Rahmen kommuniziert werden koennen

  Background:
    Given ich bin als Endnutzer angemeldet und habe Berechtigung zur Community-Erstellung

  @@happy-path @@smoke @@regression
  Scenario: Community mit mehreren Gruppen erfolgreich erstellen
    # Happy path: Community wird erstellt und Gruppen werden korrekt zugeordnet
    Given ich befinde mich im Bereich zur Community-Erstellung
    When ich lege eine neue Community mit dem Namen "Tech-Forum" an
    And ich fuege die Gruppen "AI" und "DevOps" hinzu
    Then die Community "Tech-Forum" wird erstellt
    And die Gruppen "AI" und "DevOps" sind eindeutig der Community zugeordnet

  @@happy-path @@regression
  Scenario: Gruppe aus bestehender Community entfernen
    # Happy path: nur die ausgewaehlte Gruppe wird entfernt
    Given eine bestehende Community "Tech-Forum" mit den Gruppen "AI", "DevOps" und "Cloud" existiert
    When ich entferne die Gruppe "DevOps" aus der Community
    Then die Gruppe "DevOps" ist nicht mehr der Community zugeordnet
    And die Gruppen "AI" und "Cloud" bleiben unveraendert bestehen

  @@negative @@regression
  Scenario: Community speichern ohne Gruppen
    # Error scenario: Community darf nicht ohne Gruppen erstellt werden
    Given ich befinde mich im Bereich zur Community-Erstellung
    When ich versuche eine neue Community mit dem Namen "Leer" zu speichern
    And ich habe keine Gruppe hinzugefuegt
    Then ich erhalte eine Fehlermeldung "Mindestens eine Gruppe ist erforderlich"
    And die Community wird nicht erstellt

  @@edge @@regression
  Scenario Outline: Grenzwerte fuer Anzahl der Gruppen bei Erstellung
    # Boundary condition: minimale und maximale Anzahl an Gruppen wird validiert
    Given ich befinde mich im Bereich zur Community-Erstellung
    When ich lege eine neue Community mit dem Namen "Grenztest" an
    And ich fuege <anzahl> Gruppe(n) hinzu
    Then das System reagiert mit <ergebnis>

    Examples:
      | anzahl | ergebnis |
      | 1 | erfolgreicher Erstellung |
      | 50 | erfolgreicher Erstellung |

  @@edge @@negative @@regression
  Scenario Outline: Ungueltige Gruppennamen bei Erstellung
    # Edge case: ungueltige oder doppelte Gruppennamen werden abgefangen
    Given ich befinde mich im Bereich zur Community-Erstellung
    When ich lege eine neue Community mit dem Namen "Validierung" an
    And ich fuege die Gruppen <gruppenliste> hinzu
    Then das System zeigt die Meldung <meldung>
    And die Community wird <status> erstellt

    Examples:
      | gruppenliste | meldung | status |
      | "AI", "AI" | Gruppennamen muessen eindeutig sein | nicht |
      | "   " | Gruppenname darf nicht leer sein | nicht |
