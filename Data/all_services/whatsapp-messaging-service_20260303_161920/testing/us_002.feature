@@smoke @@regression
Feature: Zwei-Faktor-Authentifizierung mit 6-stelliger PIN
  As a registrierter Nutzer
  I want to die Zwei-Faktor-Authentifizierung mit einer 6-stelligen PIN aktivieren und beim Login verwenden
  So that mein Konto durch eine zusätzliche Sicherheitsschicht vor unbefugtem Zugriff schützen

  Background:
    Given ein registrierter Nutzer ist angemeldet und die 2FA-Funktion ist verfügbar

  @@smoke @@regression @@happy-path
  Scenario: 2FA aktivieren mit gültiger 6-stelliger PIN
    # Erfolgreiche Aktivierung der 2FA mit gültiger PIN und Abfrage beim nächsten Login
    When der Nutzer aktiviert 2FA und bestätigt die PIN "123456"
    Then wird 2FA für das Konto aktiviert
    And beim nächsten Login wird die PIN-Abfrage angezeigt

  @@smoke @@regression @@happy-path
  Scenario: Login mit korrekten Zugangsdaten und korrekter 6-stelliger PIN
    # Erfolgreicher Login bei aktivierter 2FA
    Given 2FA ist für das Konto aktiviert
    When der Nutzer meldet sich mit korrekten Zugangsdaten und der PIN "654321" an
    Then wird der Login erfolgreich abgeschlossen

  @@regression @@negative
  Scenario Outline: Login mit ungültiger PIN wird abgelehnt
    # Fehlerhafte PINs führen zu Login-Ablehnung und verständlicher Fehlermeldung
    Given 2FA ist für das Konto aktiviert
    When der Nutzer meldet sich mit korrekten Zugangsdaten und der PIN "<pin>" an
    Then wird der Login abgelehnt
    And der Nutzer erhält eine verständliche Fehlermeldung

    Examples:
      | pin |
      | 12345 |
      | 1234567 |
      | abcdef |
      | 000000 |

  @@regression @@edge
  Scenario Outline: PIN-Aktivierung mit führenden Nullen ist gültig
    # Edge Case: 6-stellige PIN mit führenden Nullen wird akzeptiert
    When der Nutzer aktiviert 2FA und bestätigt die PIN "<pin>"
    Then wird 2FA für das Konto aktiviert

    Examples:
      | pin |
      | 000001 |
      | 001234 |

  @@regression @@negative @@error
  Scenario Outline: PIN-Aktivierung mit nicht numerischen Zeichen wird abgelehnt
    # Error Scenario: PIN muss numerisch und 6-stellig sein
    When der Nutzer aktiviert 2FA und bestätigt die PIN "<pin>"
    Then wird 2FA nicht aktiviert
    And der Nutzer erhält eine verständliche Fehlermeldung zur PIN-Anforderung

    Examples:
      | pin |
      | 12a456 |
      | 12 456 |
      | !@#$%^ |
