@@smoke @@regression
Feature: Textnachricht senden
  As a registrierter Nutzer
  I want to Textnachrichten in Echtzeit an andere Nutzer senden
  So that schnell und zuverlässig kommunizieren zu können

  Background:
    Given der Nutzer ist angemeldet und die Chat-Anwendung ist geöffnet

  @@smoke @@regression @@happy-path
  Scenario: Echtzeitversand an gültigen Empfänger
    # Happy path: Nachricht wird in Echtzeit zugestellt und als gesendet bestätigt
    Given der Empfänger ist online und gültig
    And die Internetverbindung ist stabil
    When der Nutzer eine Textnachricht mit Inhalt sendet
    Then wird die Nachricht in Echtzeit zugestellt
    And die Nachricht wird als gesendet bestätigt

  @@regression @@edge
  Scenario: Versand an offline Empfänger wird serverseitig gespeichert
    # Edge case: Empfänger ist offline, Nachricht wird gespeichert und später zugestellt
    Given der Empfänger ist offline
    When der Nutzer eine Textnachricht mit Inhalt sendet
    Then wird die Nachricht serverseitig gespeichert
    And die Nachricht wird bei Verfügbarkeit des Empfängers zugestellt

  @@regression @@negative
  Scenario: Leere Nachricht wird verhindert
    # Error scenario: Versand ohne Inhalt führt zu Fehler
    When der Nutzer eine Textnachricht ohne Inhalt sendet
    Then wird der Versand verhindert
    And eine verständliche Fehlermeldung wird angezeigt

  @@regression @@boundary
  Scenario Outline: Grenzwert für Nachrichtenlänge
    # Boundary condition: minimale und maximale Nachrichtenlängen werden verarbeitet
    Given der Empfänger ist online und gültig
    When der Nutzer eine Textnachricht mit <length_case> sendet
    Then <expected_result>

    Examples:
      | length_case | expected_result |
      | minimalem zulässigem Inhalt | wird die Nachricht zugestellt und als gesendet bestätigt |
      | maximal zulässigem Inhalt | wird die Nachricht zugestellt und als gesendet bestätigt |
      | mehr als maximal zulässigem Inhalt | wird der Versand verhindert und eine verständliche Fehlermeldung angezeigt |

  @@regression @@negative
  Scenario: Ungültiger Empfänger
    # Error scenario: ungültige Empfänger-ID verhindert Versand
    When der Nutzer eine Textnachricht an einen ungültigen Empfänger sendet
    Then wird der Versand verhindert
    And eine verständliche Fehlermeldung wird angezeigt

  @@smoke @@regression @@happy-path
  Scenario Outline: Datengetriebener Echtzeitversand
    # Scenario outline für verschiedene gültige Empfänger
    Given der Empfänger <recipient_status> ist und gültig
    And die Internetverbindung ist stabil
    When der Nutzer eine Textnachricht mit Inhalt sendet
    Then <delivery_expectation>

    Examples:
      | recipient_status | delivery_expectation |
      | online | wird die Nachricht in Echtzeit zugestellt und als gesendet bestätigt |
      | offline | wird die Nachricht serverseitig gespeichert und bei Verfügbarkeit zugestellt |
