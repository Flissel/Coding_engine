@smoke @regression
Feature: Chat sperren
  As a registrierter Nutzer
  I want to einen einzelnen Chat mit zusaetzlicher Authentifizierung sperren
  So that meine privaten Gespraeche vor unbefugtem Zugriff zu schuetzen und die Datensicherheit zu erhoehen

  Background:
    Given der Nutzer ist angemeldet und hat einen geoeffneten Chat

  @happy-path @smoke @regression
  Scenario: Chat erfolgreich sperren mit zusaetzlicher Authentifizierung
    # Happy path fuer erfolgreiches Sperren eines Chats
    Given der Chat ist entsperrt
    When der Nutzer waehlt die Option „Chat sperren“
    And der Nutzer schliesst die zusaetzliche Authentifizierung erfolgreich ab
    Then der Chat wird gesperrt
    And der Chat ist nur nach erneuter erfolgreicher Authentifizierung zugreifbar

  @happy-path @regression
  Scenario: Gesperrten Chat oeffnen erfordert zusaetzliche Authentifizierung
    # Happy path fuer Zugriff auf bereits gesperrten Chat
    Given der Chat ist bereits gesperrt
    When der Nutzer versucht den Chat zu oeffnen
    Then das System fordert zusaetzliche Authentifizierung an
    And der Zugriff wird bis zum Erfolg blockiert

  @negative @regression
  Scenario: Sperren des Chats bei abgebrochener oder fehlgeschlagener Authentifizierung
    # Error scenario wenn die zusaetzliche Authentifizierung nicht erfolgreich ist
    Given der Chat ist entsperrt
    When der Nutzer waehlt die Option „Chat sperren“
    And die zusaetzliche Authentifizierung wird abgebrochen oder schlaegt fehl
    Then der Chat bleibt entsperrt
    And eine klare Fehlermeldung wird angezeigt

  @negative @regression
  Scenario Outline: Sperren des Chats mit verschiedenen Authentifizierungsproblemen
    # Data-driven error cases fuer Authentifizierungsprobleme
    Given der Chat ist entsperrt
    When der Nutzer waehlt die Option „Chat sperren“
    And die zusaetzliche Authentifizierung liefert den Status <auth_status>
    Then der Chat bleibt entsperrt
    And die Fehlermeldung <error_message> wird angezeigt

    Examples:
      | auth_status | error_message |
      | fehlgeschlagen | Authentifizierung fehlgeschlagen |
      | abgebrochen | Authentifizierung abgebrochen |
      | timeout | Authentifizierung abgelaufen |

  @edge @regression
  Scenario: Mehrfaches Sperren eines bereits gesperrten Chats
    # Edge case wenn der Nutzer erneut versucht einen gesperrten Chat zu sperren
    Given der Chat ist bereits gesperrt
    When der Nutzer waehlt die Option „Chat sperren“ erneut
    Then der Chat bleibt gesperrt
    And es wird eine informative Meldung angezeigt dass der Chat bereits gesperrt ist

  @edge @negative @regression
  Scenario Outline: Zugriff auf gesperrten Chat mit mehreren Fehlversuchen
    # Boundary condition fuer maximale fehlgeschlagene Authentifizierungsversuche
    Given der Chat ist bereits gesperrt
    When der Nutzer versucht den Chat zu oeffnen und liefert <attempts> fehlgeschlagene Authentifizierungen
    Then der Zugriff bleibt blockiert
    And die Fehlermeldung <error_message> wird angezeigt

    Examples:
      | attempts | error_message |
      | 1 | Authentifizierung fehlgeschlagen |
      | 3 | Zu viele Fehlversuche |
