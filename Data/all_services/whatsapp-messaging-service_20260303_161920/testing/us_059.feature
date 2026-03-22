@@smoke @@regression
Feature: Nachrichtensperre
  As a registrierter Nutzer
  I want to die App manuell sperren und per Authentifizierung wieder entsperren
  So that um meine Nachrichten und personenbezogenen Daten zu schuetzen, wenn das Geraet unbeaufsichtigt ist

  Background:
    Given die App ist installiert und der Nutzer ist angemeldet

  @@smoke @@happy-path @@regression
  Scenario Outline: App-Sperre aktivieren und erfolgreiche Entsperrung
    # Prueft den Happy Path: Sperre aktivieren und per korrekter Authentifizierung entsperren
    Given die App-Sperre ist deaktiviert
    When der Nutzer aktiviert die App-Sperre und legt die Authentifizierungsmethode <auth_method> fest
    Then die App sperrt sich und erfordert bei jedem Oeffnen eine erfolgreiche Authentifizierung
    When der Nutzer oeffnet die App und authentifiziert sich erfolgreich mit <auth_method>
    Then die App wird entsperrt und der Nutzer hat Zugriff auf seine Nachrichten

    Examples:
      | auth_method |
      | PIN |
      | Biometrie |

  @@negative @@regression
  Scenario Outline: Falsche Authentifizierung bei gesperrter App
    # Prueft den Fehlerfall: falsche Authentifizierung fuehrt zu verweigertem Zugriff
    Given die App ist gesperrt und die Authentifizierungsmethode <auth_method> ist festgelegt
    When der Nutzer versucht die App mit einer falschen Eingabe <invalid_input> zu entsperren
    Then der Zugriff wird verweigert und die Nachrichten bleiben verborgen
    And die App bleibt gesperrt

    Examples:
      | auth_method | invalid_input |
      | PIN | 0000 |
      | Biometrie | nicht erkannter Fingerabdruck |

  @@edge @@regression
  Scenario Outline: Sperre erzwingt Authentifizierung bei erneutem Oeffnen
    # Prueft den Edge Case: nach Sperre ist jede App-Oeffnung geschuetzt
    Given die App-Sperre ist aktiviert und die App ist gesperrt
    When der Nutzer oeffnet die App nach <reopen_trigger>
    Then die App fordert eine Authentifizierung an
    And ohne Authentifizierung sind keine Nachrichten sichtbar

    Examples:
      | reopen_trigger |
      | App-Neustart |
      | Wechsel vom Hintergrund in den Vordergrund |

  @@boundary @@regression
  Scenario Outline: Grenzfall: Minimale PIN-Laenge wird akzeptiert
    # Prueft eine Boundary Condition fuer die Authentifizierungsmethode PIN
    Given die App-Sperre ist deaktiviert
    When der Nutzer aktiviert die App-Sperre und legt eine PIN mit Laenge <pin_length> fest
    Then die PIN wird akzeptiert und die App sperrt sich
    And bei Oeffnen ist eine erfolgreiche PIN-Authentifizierung erforderlich

    Examples:
      | pin_length |
      | 4 |
