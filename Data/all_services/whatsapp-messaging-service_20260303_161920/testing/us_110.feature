@smoke @regression
Feature: Offline-Modus grundlegende Funktionen
  As a registrierter Nutzer
  I want to grundlegende Funktionen im Offline-Modus nutzen
  So that die App auch ohne Internetverbindung zuverlässig verwenden und Arbeitsabläufe fortsetzen zu können

  Background:
    Given der Nutzer ist zuvor online angemeldet und die App ist gestartet

  @happy-path @smoke @regression
  Scenario Outline: Weiterarbeiten bei Verbindungsabbruch ohne Absturz
    # Happy path: grundlegende Offline-Funktionen bleiben nutzbar, wenn die Verbindung abbricht
    When die Internetverbindung während der Nutzung ausfällt
    And der Nutzer führt eine grundlegende Funktion aus
    Then die App bleibt stabil und stürzt nicht ab
    And die grundlegende Funktion wird erfolgreich ausgeführt

    Examples:
      | grundlegende_funktion |
      | Eintrag lokal anzeigen |
      | Suche in lokalen Daten |

  @happy-path @regression
  Scenario Outline: Offline erstellte Vorgänge werden lokal gespeichert und als ausstehend markiert
    # Happy path: offline erstellte, online-pflichtige Vorgänge werden zwischengespeichert
    Given die App befindet sich im Offline-Modus
    When der Nutzer erstellt einen Vorgang, der online gesendet werden muss
    Then der Vorgang wird lokal gespeichert
    And der Vorgang wird als ausstehend markiert

    Examples:
      | vorgang |
      | Nachricht senden |
      | Eintrag an Server übermitteln |

  @happy-path @regression
  Scenario Outline: Automatische Synchronisierung nach Wiederherstellung der Verbindung
    # Happy path: ausstehende Vorgänge werden automatisch synchronisiert und bestätigt
    Given es bestehen ausstehende Vorgänge aus dem Offline-Modus
    When die Internetverbindung wiederhergestellt wird
    Then die ausstehenden Vorgänge werden automatisch synchronisiert
    And der Nutzer erhält eine Bestätigung über die Synchronisierung

    Examples:
      | anzahl_vorgaenge |
      | 1 |
      | 10 |

  @negative @regression
  Scenario Outline: Fehlermeldung bei online-pflichtiger Funktion im Offline-Modus
    # Error scenario: verständliche Fehlermeldung bei Funktionen, die zwingend online sind
    Given die App befindet sich im Offline-Modus
    When der Nutzer versucht eine zwingend online erforderliche Funktion auszuführen
    Then der Nutzer erhält eine verständliche Fehlermeldung
    And die Fehlermeldung weist auf die erforderliche Internetverbindung hin

    Examples:
      | funktion |
      | Live-Datenabruf |
      | Anmeldung mit Online-Verifizierung |

  @edge-case @regression
  Scenario Outline: Grenzfall: Wiederherstellung der Verbindung bei leerer Warteschlange
    # Boundary condition: keine ausstehenden Vorgänge, wenn die Verbindung wiederkehrt
    Given es bestehen keine ausstehenden Vorgänge aus dem Offline-Modus
    When die Internetverbindung wiederhergestellt wird
    Then es wird keine Synchronisierung gestartet
    And es wird keine irreführende Bestätigung angezeigt

    Examples:
      | warteschlange |
      | 0 |
