@smoke @regression
Feature: IP-Adresse schuetzen
  As a Endnutzer
  I want to IP-Adressen bei Anrufen verschleiern
  So that die Privatsphaere und den Datenschutz zu erhoehen und Missbrauch zu vermeiden

  Background:
    Given ein Endnutzer ist in der Plattform angemeldet und der Client ist gestartet

  @@smoke @@regression @@happy-path
  Scenario: Anruf initiieren und IP-Adressen sind nicht sichtbar
    # Verifiziert die Verschleierung der IP-Adressen bei einem ausgehenden Anruf
    Given ein Endnutzer initiiert einen Anruf an einen anderen Endnutzer
    When der Anruf verbunden wird
    Then werden die IP-Adressen beider Parteien nicht im Client angezeigt
    And werden keine IP-Adressen im Client übermittelt oder angezeigt

  @@regression @@happy-path
  Scenario: Eingehender Anruf verschleiert IP-Adresse des Anrufers
    # Stellt sicher, dass der Empfänger die IP-Adresse des Anrufers nicht sehen kann
    Given ein Endnutzer erhält einen eingehenden Anruf
    When die Verbindung aufgebaut wird
    Then ist die IP-Adresse des Anrufers für den Empfänger nicht sichtbar
    And werden keine IP-Adressen in der UI angezeigt

  @@regression @@negative
  Scenario: Client-Logs enthalten keine Klardaten-IP-Adressen während aktiver Sitzung
    # Prüft, dass Logs keine Klartext-IP-Adressen während eines aktiven Anrufs enthalten
    Given ein Endnutzer versucht die IP-Adresse über Client-Logs zu ermitteln
    When die Sitzung aktiv ist
    Then enthalten die bereitgestellten Client-Logs keine Klardaten-IP-Adressen
    And werden sensible IP-Felder in Logs maskiert oder entfernt

  @@regression @@edge
  Scenario Outline: Scenario Outline: Netzwerk-Tools zeigen keine Klartext-IP-Adressen
    # Edge Case: Überprüft verschiedene Netzwerk-Tools auf sichtbare IPs während aktiver Sitzung
    Given ein Endnutzer nutzt <network_tool> im Client
    When eine aktive Anrufsession besteht
    Then werden keine Klartext-IP-Adressen angezeigt
    And werden alle IP-Informationen anonymisiert oder entfernt

    Examples:
      | network_tool |
      | integrierter Netzwerkmonitor |
      | Entwickler-Konsole |
      | Proxy-Log im Client |

  @@regression @@negative
  Scenario Outline: Scenario Outline: Verbindungsfehler zeigt keine IP-Adressen
    # Error Scenario: Bei Verbindungsabbrüchen dürfen keine IPs geleakt werden
    Given ein Endnutzer startet einen Anruf
    When ein Verbindungsfehler durch <error_type> auftritt
    Then werden keine IP-Adressen im Client angezeigt
    And enthalten Fehler-Logs keine Klardaten-IP-Adressen

    Examples:
      | error_type |
      | Timeout |
      | Netzwerkunterbrechung |
      | Verbindungsabbruch durch Gegenstelle |

  @@regression @@boundary
  Scenario Outline: Scenario Outline: Boundary Conditions fuer Log-Groesse
    # Boundary: Große Logdateien enthalten keine Klartext-IP-Adressen
    Given der Client schreibt Logs mit einer Größe von <log_size_mb> MB
    When ein Anruf aktiv ist
    Then enthalten die Logs keine Klardaten-IP-Adressen
    And bleibt die Maskierung unabhängig von der Log-Größe aktiv

    Examples:
      | log_size_mb |
      | 1 |
      | 50 |
      | 200 |
