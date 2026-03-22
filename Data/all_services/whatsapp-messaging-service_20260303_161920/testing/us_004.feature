@@smoke @@regression
Feature: Multi-Device Support
  As a registrierter Nutzer
  I want to die Anwendung gleichzeitig auf mehreren Geräten nutzen
  So that um jederzeit nahtlos kommunizieren zu können und keine Nachrichten zu verpassen

  Background:
    Given ein registrierter Nutzer mit gültigen Zugangsdaten

  @@smoke @@regression @@happy-path
  Scenario: Aktive Sitzungen und Echtzeit-Synchronisierung auf zwei Geräten
    # Happy path: Anmeldung auf zwei Geräten und Nachrichten-Sync in Echtzeit
    Given der Nutzer ist auf Gerät A angemeldet
    When der Nutzer meldet sich zusätzlich auf Gerät B an
    Then sind beide Sitzungen aktiv
    And eine neue Nachricht erscheint in Echtzeit auf beiden Geräten

  @@regression @@edge
  Scenario Outline: Status-Synchronisierung beim Lesen oder Löschen
    # Edge case: Status wird innerhalb weniger Sekunden auf dem zweiten Gerät aktualisiert
    Given der Nutzer verwendet Gerät A und Gerät B parallel
    When der Nutzer <aktion> eine Nachricht auf Gerät A
    Then wird der Status auf Gerät B innerhalb von <sekunden> Sekunden aktualisiert

    Examples:
      | aktion | sekunden |
      | liest | 3 |
      | löscht | 3 |

  @@regression @@negative @@error
  Scenario Outline: Anmeldung eines dritten Geräts bei erreichtem Gerätelimit
    # Error scenario: Anmeldung wird abgelehnt und Fehlermeldung angezeigt
    Given das Gerätelimit von <limit> ist erreicht und der Nutzer ist auf <limit> Geräten angemeldet
    When der Nutzer versucht ein drittes Gerät anzumelden
    Then wird die Anmeldung abgelehnt
    And der Nutzer erhält eine klare Fehlermeldung

    Examples:
      | limit |
      | 2 |

  @@regression @@boundary
  Scenario Outline: Grenzwert: Anmeldung genau bis zum Gerätelimit
    # Boundary condition: Anmeldung bis zum Limit ist erlaubt, nächstes Gerät wird abgelehnt
    Given das Gerätelimit beträgt <limit> und der Nutzer ist auf <angemeldet> Geräten angemeldet
    When der Nutzer meldet ein weiteres Gerät an
    Then ist die Anmeldung <ergebnis>
    And die Anzahl aktiver Sitzungen beträgt <sitzungen>

    Examples:
      | limit | angemeldet | ergebnis | sitzungen |
      | 2 | 1 | erfolgreich | 2 |
      | 2 | 2 | abgelehnt | 2 |
