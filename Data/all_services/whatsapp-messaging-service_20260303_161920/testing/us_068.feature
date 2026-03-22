@smoke @regression
Feature: Nicht stoeren Modus verwalten
  As a registrierter Nutzer
  I want to den Nicht-stören-Modus aktivieren und deaktivieren
  So that Benachrichtigungen zeitweise zu pausieren, um konzentriert zu bleiben und dennoch die Zustellung später zuverlässig zu erhalten

  Background:
    Given der Nutzer ist registriert und angemeldet

  @happy-path @smoke @regression
  Scenario: Aktivieren des Nicht-stoeren-Modus zeigt aktiven Status
    # Happy path: Aktivierung des Modus in den Einstellungen mit sichtbarem Status
    Given der Nutzer befindet sich in den Einstellungen
    When er den Nicht-stören-Modus aktiviert
    Then werden alle Benachrichtigungen stummgeschaltet
    And der aktive Status wird sichtbar angezeigt

  @edge-case @regression
  Scenario: Eingehende Nachricht wird im Nicht-stoeren-Modus nicht benachrichtigt
    # Edge case: Nachricht trifft ein während der Modus aktiv ist
    Given der Nicht-stören-Modus ist aktiviert
    When eine neue Nachricht eingeht
    Then wird keine Benachrichtigung angezeigt
    And die Nachricht bleibt im Posteingang erhalten

  @happy-path @regression
  Scenario: Deaktivieren des Nicht-stoeren-Modus stellt Benachrichtigungen wieder her
    # Happy path: Deaktivierung des Modus mit aktualisiertem Status
    Given der Nicht-stören-Modus ist aktiviert
    When der Nutzer den Modus deaktiviert
    Then werden Benachrichtigungen wieder normal zugestellt
    And der Status wird als deaktiviert angezeigt

  @negative @regression
  Scenario: Aktivieren des Modus ohne Berechtigung wird verhindert
    # Error scenario: nicht angemeldeter Nutzer versucht die Einstellung zu ändern
    Given der Nutzer ist nicht angemeldet
    When er versucht den Nicht-stören-Modus zu aktivieren
    Then wird der Zugriff verweigert
    And der Modus bleibt deaktiviert

  @edge-case @regression
  Scenario Outline: Mehrfaches Umschalten des Modus bleibt konsistent
    # Boundary condition: wiederholtes Umschalten darf keinen inkonsistenten Status erzeugen
    Given der Nutzer befindet sich in den Einstellungen
    When er den Nicht-stören-Modus <toggle_sequence> umschaltet
    Then ist der finale Status <expected_status>
    And die Benachrichtigungseinstellungen entsprechen dem finalen Status

    Examples:
      | toggle_sequence | expected_status |
      | zweimal hintereinander | deaktiviert |
      | dreimal hintereinander | aktiviert |
