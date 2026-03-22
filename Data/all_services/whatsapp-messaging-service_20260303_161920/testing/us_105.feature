@@smoke @@regression
Feature: API-Zugang Business-API
  As a Integrationsentwickler
  I want to über eine dokumentierte Business-API Nachrichten und Unternehmensdaten sicher integrieren
  So that automatisierte und zuverlässige Integrationen mit schneller Performance zu ermöglichen

  Background:
    Given ein registriertes Business-Profil mit aktiver API-Berechtigung existiert
    And die Business-API ist gemäß Dokumentation erreichbar

  @@smoke @@happy-path
  Scenario: Erfolgreiche API-Anfrage innerhalb der Performance-Grenzen
    # Validiert eine autorisierte Anfrage mit gültigem API-Schlüssel und akzeptabler Antwortzeit
    Given ein gültiger API-Schlüssel und ein autorisierter Client
    When der Entwickler eine autorisierte GET-Anfrage an den Business-API-Endpunkt sendet
    Then liefert die API einen 200-Statuscode mit den erwarteten Daten
    And die Antwortzeit liegt innerhalb der definierten Performance-Grenzen

  @@regression @@negative
  Scenario Outline: Autorisierung mit ungültigen oder fehlenden API-Schlüsseln
    # Validiert klare 401/403-Fehler bei fehlender oder ungültiger Authentifizierung
    Given ein API-Schlüsselzustand ist <key_state>
    When eine Anfrage an die Business-API gestellt wird
    Then antwortet die API mit dem Statuscode <status_code>
    And die Fehlermeldung beschreibt verständlich den Authentifizierungsfehler

    Examples:
      | key_state | status_code |
      | fehlt | 401 |
      | ungültig | 403 |

  @@regression @@negative @@edge
  Scenario: Rate-Limit erreicht und Reset-Zeitpunkt geliefert
    # Validiert das Verhalten bei Überschreitung des definierten Rate-Limits
    Given das definierte Rate-Limit für die API ist erreicht
    When weitere Anfragen an die Business-API gesendet werden
    Then weist die API die Anfragen mit einem Rate-Limit-Fehler zurück
    And die Antwort enthält Informationen zum Reset-Zeitpunkt

  @@regression @@boundary
  Scenario Outline: Boundary: Antwortzeit an der oberen Performance-Grenze
    # Validiert akzeptables Verhalten bei Antwortzeit am Grenzwert
    Given ein gültiger API-Schlüssel und ein autorisierter Client
    When der Entwickler eine autorisierte Anfrage sendet und die Antwortzeit <response_time_ms> ms beträgt
    Then liefert die API einen 200-Statuscode
    And die Antwortzeit ist innerhalb der definierten Performance-Grenze von <max_allowed_ms> ms

    Examples:
      | response_time_ms | max_allowed_ms |
      | 499 | 500 |
      | 500 | 500 |

  @@regression @@edge
  Scenario Outline: Edge: Rate-Limit knapp unterschritten
    # Validiert erfolgreiche Anfrage kurz vor Erreichen des Rate-Limits
    Given die Anzahl bisheriger Anfragen liegt bei <request_count> von <rate_limit>
    When eine weitere autorisierte Anfrage gesendet wird
    Then liefert die API einen 200-Statuscode
    And die Antwort enthält verbleibende Rate-Limit-Informationen

    Examples:
      | request_count | rate_limit |
      | 99 | 100 |
