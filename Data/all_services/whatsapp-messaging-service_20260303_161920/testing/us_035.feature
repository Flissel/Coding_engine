@@smoke @@regression
Feature: Verschlüsselter Sprachanruf
  As a Endnutzer
  I want to einen verschlüsselten Sprachanruf starten und führen
  So that damit ich sicher und zuverlässig kommunizieren kann und meine Privatsphäre geschützt ist

  Background:
    Given der Nutzer ist angemeldet

  @@smoke @@regression @@happy-path
  Scenario: Erfolgreicher Aufbau eines verschlüsselten Sprachanrufs
    # Happy Path: Anruf wird aufgebaut und durchgehend verschlüsselt übertragen
    Given der Empfänger ist erreichbar
    When der Nutzer einen Sprachanruf startet
    Then wird der Anruf aufgebaut
    And die Sprachübertragung ist durchgehend verschlüsselt

  @@regression @@negative
  Scenario Outline: Empfänger lehnt ab oder ist nicht erreichbar
    # Error Path: Nutzer erhält klare Statusbenachrichtigung
    Given der Empfängerstatus ist "<status>"
    When der Nutzer einen Sprachanruf startet
    Then erhält der Nutzer eine klare Benachrichtigung über den Status des Anrufs
    And der Anruf wird nicht verbunden

    Examples:
      | status |
      | abgelehnt |
      | nicht erreichbar |

  @@regression @@edge
  Scenario Outline: Instabile Netzwerkverbindung mit Paketverlusten
    # Edge Case: System versucht zu stabilisieren und informiert bei Abbruch
    Given ein verschlüsselter Sprachanruf ist aktiv
    And die Netzwerkverbindung ist instabil
    When Paketverluste von "<loss_rate>" auftreten
    Then versucht das System die Verbindung zu stabilisieren
    And der Nutzer wird bei Abbruch informiert

    Examples:
      | loss_rate |
      | 5% |
      | 20% |

  @@regression @@negative @@boundary
  Scenario Outline: Boundary: Verbindung bricht nach Stabilisierung endgültig ab
    # Boundary Condition: Wiederholte Stabilisierung scheitert und der Nutzer wird informiert
    Given ein verschlüsselter Sprachanruf ist aktiv
    And das System hat "<retry_count>" Stabilisierungsversuche unternommen
    When die Verbindung weiterhin nicht stabilisiert werden kann
    Then wird der Anruf beendet
    And der Nutzer erhält eine Abbruchbenachrichtigung

    Examples:
      | retry_count |
      | 1 |
      | 3 |
