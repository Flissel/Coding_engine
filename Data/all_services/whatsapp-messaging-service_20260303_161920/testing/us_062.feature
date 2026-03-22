@smoke @regression
Feature: Zwei-Schritte-Verifizierung per PIN
  As a registrierter Nutzer
  I want to eine optionale zusätzliche PIN-Sicherung für mein Konto aktivieren
  So that um meine Privatsphäre und Sicherheit zu erhöhen, ohne die Bedienung zu verkomplizieren

  Background:
    Given der Nutzer ist angemeldet und befindet sich in den Sicherheitseinstellungen

  @smoke @regression @happy-path
  Scenario Outline: PIN-Sicherung erfolgreich aktivieren und bei sensibler Aktion abfragen
    # Happy Path für Aktivierung und Abfrage der PIN bei sensibler Aktion
    When er die PIN-Sicherung aktiviert und die PIN "<pin>" bestätigt
    Then ist die PIN-Sicherung aktiv
    And bei der sensiblen Aktion "<action>" wird eine PIN-Eingabe abgefragt

    Examples:
      | pin | action |
      | 1234 | E-Mail-Adresse ändern |
      | 9876 | Zahlungsmethode hinzufügen |

  @regression @negative
  Scenario Outline: Aktivierung mit ungültiger PIN verhindern
    # Error Scenario für ungültige PIN-Formate oder Längen
    When er die PIN-Sicherung aktiviert und die ungültige PIN "<pin>" bestätigt
    Then wird eine verständliche Fehlermeldung "<error>" angezeigt
    And die PIN-Sicherung bleibt deaktiviert

    Examples:
      | pin | error |
      | 12 | Die PIN muss genau 4 Ziffern enthalten. |
      | 12345 | Die PIN muss genau 4 Ziffern enthalten. |
      | 12ab | Die PIN darf nur Ziffern enthalten. |

  @regression @negative
  Scenario Outline: Mehrfache falsche PIN-Eingaben blockieren geschützte Aktion
    # Edge/Error Scenario für temporäre Sperre nach wiederholten Fehlversuchen
    Given die PIN-Sicherung ist aktiv
    When der Nutzer die PIN bei der sensiblen Aktion "<action>" "<attempts>"-mal falsch eingibt
    Then wird der Zugriff auf die geschützte Aktion vorübergehend blockiert
    And eine Sicherheitsmeldung "<message>" wird angezeigt

    Examples:
      | action | attempts | message |
      | E-Mail-Adresse ändern | 3 | Zu viele Fehlversuche. Bitte später erneut versuchen. |

  @regression @boundary
  Scenario Outline: Boundary: PIN mit minimal zulässiger Länge aktivieren
    # Boundary Condition für minimale gültige PIN-Länge
    When er die PIN-Sicherung aktiviert und die PIN "<pin>" bestätigt
    Then ist die PIN-Sicherung aktiv
    And die PIN wird sicher gespeichert

    Examples:
      | pin |
      | 0000 |
