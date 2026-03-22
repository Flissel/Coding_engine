@smoke @regression
Feature: Biometrische Entsperrung
  As a registrierter Nutzer
  I want to die App per Fingerabdruck oder Face ID entsperren
  So that damit ich schnell und sicher auf meine Nachrichten zugreifen kann, ohne ein Passwort eingeben zu muessen

  Background:
    Given der Nutzer ist registriert und die App ist installiert

  @smoke @regression @happy-path
  Scenario: Erfolgreiche biometrische Entsperrung
    # Happy Path: App entsperrt sich nach erfolgreicher Biometrics-Authentifizierung
    Given die biometrische Entsperrung ist in den Einstellungen aktiviert
    And das Geraet unterstuetzt Biometrics und Biometrics sind eingerichtet
    When der Nutzer oeffnet die App
    Then die App fordert eine biometrische Authentifizierung an
    And die App entsperrt sich nach erfolgreicher Authentifizierung und zeigt die Startansicht

  @regression @negative
  Scenario: Biometrische Authentifizierung schlaegt fehl und PIN/Passwort wird angeboten
    # Error Scenario: Zugriff wird verweigert und alternative Entsperrung wird angeboten
    Given die biometrische Entsperrung ist in den Einstellungen aktiviert
    And das Geraet unterstuetzt Biometrics und Biometrics sind eingerichtet
    When die biometrische Authentifizierung fehlschlaegt
    Then die App verweigert den Zugriff
    And die App bietet eine alternative Entsperrung per PIN/Passwort an

  @regression @edge-case
  Scenario: Kein Biometrics-Support oder keine Einrichtung
    # Edge Case: Geraet ohne Biometrics oder ohne Einrichtung bietet Standardanmeldung
    Given die biometrische Entsperrung ist in den Einstellungen aktiviert
    And das Geraet unterstuetzt keine Biometrics oder Biometrics sind nicht eingerichtet
    When der Nutzer oeffnet die App
    Then die App bietet keine biometrische Entsperrung an
    And die App fordert die Standardanmeldung per PIN/Passwort

  @regression @negative @boundary
  Scenario: Sperrung nach mehrfachen fehlgeschlagenen Biometrie-Versuchen
    # Boundary Condition: Erreichen des maximalen Fehlversuchlimits
    Given die biometrische Entsperrung ist in den Einstellungen aktiviert
    And das Geraet unterstuetzt Biometrics und Biometrics sind eingerichtet
    When der Nutzer erreicht die maximale Anzahl fehlgeschlagener Biometrics-Versuche
    Then die biometrische Entsperrung wird voruebergehend gesperrt
    And die App fordert die Entsperrung per PIN/Passwort an

  @regression @happy-path
  Scenario Outline: Biometrische Entsperrung mit verschiedenen Biometrics-Typen
    # Scenario Outline: Erfolgreiche Entsperrung fuer Fingerabdruck und Face ID
    Given die biometrische Entsperrung ist in den Einstellungen aktiviert
    And das Geraet unterstuetzt <biometric_type> und <biometric_type> ist eingerichtet
    When der Nutzer oeffnet die App und authentifiziert sich erfolgreich mit <biometric_type>
    Then die App entsperrt sich und zeigt die Startansicht

    Examples:
      | biometric_type |
      | Fingerabdruck |
      | Face ID |
