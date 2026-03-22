@@smoke @@regression
Feature: End-to-End Verschluesselung
  As a registrierter Nutzer
  I want to Nachrichten senden und empfangen, ohne dass Dritte die Inhalte lesen koennen
  So that um Datenschutz und Sicherheit meiner Kommunikation zu gewaehrleisten

  Background:
    Given ein registrierter Nutzer ist angemeldet
    And eine Konversation mit einem anderen registrierten Nutzer ist geoeffnet

  @@smoke @@regression @@happy-path
  Scenario: Erfolgreiches Senden und Empfangen einer verschluesselten Nachricht
    # Happy path fuer end-to-end verschluesselte Uebertragung und Entschluesselung
    When der Nutzer eine Nachricht mit gueltigen Endgeraet-Schluesseln sendet
    Then wird die Nachricht end-to-end verschluesselt uebertragen
    And kann die Nachricht nur auf den beteiligten Endgeraeten entschluesselt werden

  @@regression @@negative
  Scenario: Dritte koennen transportierte oder gespeicherte Nachrichten nicht lesen
    # Negative Szenario fuer Zugriff durch Dritte oder Systemdienste
    Given eine verschluesselte Nachricht wurde gesendet und gespeichert
    When ein Dritter ohne Endgeraet-Schluessel versucht den Inhalt zu lesen
    Then ist der Inhalt unlesbar
    And die Nachricht ist nicht entschluesselbar ohne die Endgeraet-Schluessel

  @@regression @@negative @@error
  Scenario: Empfang ohne gueltigen Schluessel zeigt keine Klartextnachricht
    # Fehlerszenario bei fehlenden oder inkonsistenten Schluesseln
    Given das Endgeraet hat keinen gueltigen Schluessel oder Schluessel sind inkonsistent
    When eine Nachricht empfangen wird
    Then wird die Nachricht nicht im Klartext angezeigt
    And der Nutzer erhaelt eine Fehlermeldung mit Hinweis zur Wiederherstellung

  @@regression @@boundary
  Scenario Outline: Verschluesselung bei Nachrichtenlaenge an der Grenze
    # Boundary Condition fuer minimale und maximale Nachrichtenlaenge
    Given der Nutzer hat gueltige Endgeraet-Schluessel
    When der Nutzer eine Nachricht mit Laenge <message_length> sendet
    Then wird die Nachricht end-to-end verschluesselt uebertragen
    And die Nachricht wird auf dem Empfaengergeraet korrekt entschluesselt

    Examples:
      | message_length |
      | 1 |
      | 5000 |

  @@regression @@edge
  Scenario: Empfang bei Schluesselrotation waehrend der Uebertragung
    # Edge Case bei Schluesselwechsel zwischen Senden und Empfangen
    Given der Sender rotiert seine Endgeraet-Schluessel nach dem Senden
    When der Empfaenger die Nachricht mit den urspruenglichen Schluesseln entschluesselt
    Then kann die Nachricht mit den urspruenglichen Schluesseln entschluesselt werden
    And die Nachricht bleibt fuer Dritte unlesbar
