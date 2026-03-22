@smoke @regression
Feature: Anruflink
  As a Kundenservice-Mitarbeiter
  I want to einen Anruflink für einen geplanten Anruf erstellen und teilen
  So that Kunden den einfachen Beitritt zum geplanten Anruf ermöglichen und die professionelle Kommunikation verbessern

  Background:
    Given ein Kundenservice-Mitarbeiter ist im System angemeldet

  @smoke @regression @happy-path
  Scenario: Erfolgreiche Erstellung eines Anruflinks für einen geplanten Anruf
    # Happy path für die Erzeugung eines eindeutigen Anruflinks
    Given ein geplanter Anruf mit gültigem Datum und Uhrzeit existiert
    When der Nutzer den Anruflink erzeugt
    Then erstellt das System einen eindeutigen Anruflink
    And der Anruflink wird zur sicheren Weitergabe angezeigt

  @regression @happy-path
  Scenario: Kunde öffnet einen gültigen Anruflink auf unterstützter Plattform
    # Happy path für das Öffnen eines gültigen Anruflinks durch den Kunden
    Given ein gültiger Anruflink wurde mit einem Kunden geteilt
    When der Kunde den Link auf einer unterstützten Plattform öffnet
    Then führt der Link den Kunden direkt zum vorgesehenen Anruf
    And der geplante Zeitpunkt des Anrufs wird angezeigt

  @regression @negative
  Scenario: Erstellung eines Anruflinks wird für vergangene Startzeit verhindert
    # Negativfall wenn der geplante Anruf in der Vergangenheit liegt
    Given ein geplanter Anruf mit Startzeit liegt in der Vergangenheit
    When der Nutzer versucht einen Anruflink zu erzeugen
    Then verhindert das System die Erstellung des Anruflinks
    And eine verständliche Fehlermeldung wird angezeigt

  @regression @edge
  Scenario: Grenzfall: Anruflink-Erstellung nahe an der Startzeit
    # Boundary condition für eine Startzeit kurz vor dem aktuellen Zeitpunkt
    Given ein geplanter Anruf startet in weniger als einer Minute
    When der Nutzer den Anruflink erzeugt
    Then erstellt das System einen eindeutigen Anruflink
    And der Anruflink zeigt den korrekten geplanten Zeitpunkt an

  @regression @negative
  Scenario: Ungültige Plattform beim Öffnen des Anruflinks
    # Negativfall wenn der Kunde den Link auf einer nicht unterstützten Plattform öffnet
    Given ein gültiger Anruflink wurde mit einem Kunden geteilt
    When der Kunde den Link auf einer nicht unterstützten Plattform öffnet
    Then informiert das System den Kunden über die nicht unterstützte Plattform
    And es wird keine Verbindung zum Anruf hergestellt

  @regression @negative @edge
  Scenario Outline: Scenario Outline: Erstellung eines Anruflinks mit variierenden Zeitangaben
    # Datengetriebene Tests für gültige und ungültige Zeitangaben
    Given ein geplanter Anruf mit Startzeit <start_time> existiert
    When der Nutzer den Anruflink erzeugt
    Then das System <expected_result>
    And es wird <message_type> angezeigt

    Examples:
      | start_time | expected_result | message_type |
      | in 30 Minuten | erstellt einen eindeutigen Anruflink | der Anruflink zur sicheren Weitergabe |
      | in 1 Minute | erstellt einen eindeutigen Anruflink | der Anruflink mit korrektem Zeitpunkt |
      | vor 5 Minuten | verhindert die Erstellung des Anruflinks | eine verständliche Fehlermeldung |
