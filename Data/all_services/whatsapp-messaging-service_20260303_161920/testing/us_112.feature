@@smoke @@regression
Feature: Effiziente Synchronisation
  As a Endnutzer
  I want to Nachrichten über alle Geräte hinweg synchronisieren
  So that um stets den aktuellen Nachrichtenstand zu haben und zuverlässig antworten zu können

  Background:
    Given der Nutzer ist auf Gerät A und Gerät B angemeldet
    And beide Geräte sind mit derselben Nachrichten-ID verknüpft

  @@happy-path @@smoke @@regression
  Scenario: Synchronisation neuer Nachricht innerhalb der Zeitvorgabe
    # Prüft die erfolgreiche Synchronisation einer neuen Nachricht zwischen zwei Geräten
    Given Gerät A und Gerät B haben eine aktive Internetverbindung
    When eine neue Nachricht auf Gerät A eingeht
    Then wird die Nachricht innerhalb von 5 Sekunden auf Gerät B angezeigt
    And die Nachricht ist auf beiden Geräten identisch

  @@happy-path @@regression
  Scenario: Synchronisation des Lesestatus
    # Stellt sicher, dass der Lesestatus korrekt übertragen wird
    Given auf Gerät A ist eine ungelesene Nachricht vorhanden
    When der Nutzer liest die Nachricht auf Gerät A
    Then wird der Lesestatus nach Abschluss der Synchronisation auf Gerät B als gelesen angezeigt
    And der Zeitstempel des Lesestatus entspricht dem Ereignis auf Gerät A

  @@edge-case @@regression
  Scenario: Synchronisation nach Offline-Phase in korrekter Reihenfolge
    # Verifiziert die automatische Nachsynchronisation nach Wiederverbindung
    Given Gerät B ist vorübergehend offline
    When die Verbindung von Gerät B wiederhergestellt wird
    Then werden alle während der Offline-Zeit empfangenen Nachrichten automatisch synchronisiert
    And die Nachrichten erscheinen auf Gerät B in korrekter Reihenfolge

  @@negative @@error @@regression
  Scenario: Synchronisationsfehler bei Serverstörung
    # Überprüft Fehlermeldung und automatischen Wiederholungsversuch bei Serverausfall
    Given die Synchronisation ist aufgrund einer Serverstörung nicht möglich
    When eine Synchronisation ausgelöst wird
    Then wird eine verständliche Fehlermeldung angezeigt
    And ein automatischer Wiederholungsversuch wird gestartet

  @@boundary @@regression
  Scenario Outline: Synchronisation innerhalb der Zeitgrenze von 5 Sekunden
    # Boundary-Test für die maximale Synchronisationsdauer
    Given Gerät A und Gerät B haben eine aktive Internetverbindung
    When eine neue Nachricht auf Gerät A eingeht
    Then wird die Nachricht innerhalb von <max_sync_seconds> Sekunden auf Gerät B angezeigt
    And die Synchronisationsdauer wird protokolliert

    Examples:
      | max_sync_seconds |
      | 5 |

  @@edge-case @@regression
  Scenario Outline: Nachsynchronisation mit unterschiedlichen Offline-Dauern
    # Datengetriebener Test für variierende Offline-Zeiten und Nachrichtenanzahl
    Given Gerät B ist für <offline_duration_minutes> Minuten offline
    When während der Offline-Zeit <message_count> Nachrichten empfangen werden
    Then werden nach Wiederverbindung alle <message_count> Nachrichten synchronisiert
    And die Nachrichtenreihenfolge entspricht dem Empfangszeitpunkt

    Examples:
      | offline_duration_minutes | message_count |
      | 1 | 1 |
      | 30 | 25 |
