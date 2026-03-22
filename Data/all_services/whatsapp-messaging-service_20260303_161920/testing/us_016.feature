@@smoke @@regression
Feature: Nachricht zitieren
  As a registrierter Nutzer
  I want to eine spezifische Nachricht zitieren und darauf antworten
  So that damit die Kommunikation klarer und kontextbezogen nachvollziehbar bleibt

  Background:
    Given der Nutzer ist registriert, angemeldet und befindet sich in einer bestehenden Unterhaltung

  @@smoke @@regression @@happy-path
  Scenario: Antwort mit Zitat senden (Happy Path)
    # Prüft, dass eine ausgewählte Nachricht korrekt zitiert und die Antwort gesendet wird
    Given die Unterhaltung enthält mehrere sichtbare Nachrichten
    When der Nutzer wählt eine Nachricht aus und nutzt die Zitier-/Antwort-Funktion
    And der Nutzer sendet eine Antwort
    Then wird die ausgewählte Nachricht im Antwortfeld als Zitat angezeigt
    And die Antwort wird mit Bezug auf die zitierte Nachricht zugestellt

  @@regression @@negative @@error
  Scenario: Zitieren einer gelöschten oder nicht sichtbaren Nachricht verhindern
    # Prüft die Fehlermeldung und das Verhindern des Zitierens
    Given die zu zitierende Nachricht wurde gelöscht oder ist für den Nutzer nicht sichtbar
    When der Nutzer versucht, diese Nachricht zu zitieren
    Then wird eine verständliche Meldung angezeigt
    And das Zitieren wird verhindert

  @@regression @@happy-path
  Scenario: Antwort mit Zitat ist für berechtigte Empfänger sichtbar
    # Prüft, dass Empfänger die Antwort samt korrektem Zitat und Zeitstempel sehen
    Given der Nutzer erstellt eine Antwort mit Zitat in der Unterhaltung
    When die Nachricht wird zugestellt
    Then sehen alle berechtigten Empfänger die Antwort samt korrektem Zitat
    And der Zeitstempel der zitierten Nachricht ist korrekt sichtbar

  @@regression @@boundary
  Scenario Outline: Zitieren der ältesten und neuesten Nachricht (Boundary)
    # Prüft Grenzen beim Zitieren der ersten und letzten Nachricht
    Given die Unterhaltung enthält Nachrichten mit eindeutigen Zeitstempeln
    When der Nutzer zitiert die Nachricht an Position <position>
    Then wird die korrekte Nachricht als Zitat im Antwortfeld angezeigt
    And die Antwort referenziert den korrekten Zeitstempel

    Examples:
      | position |
      | erste |
      | letzte |

  @@regression @@edge
  Scenario: Zitieren nach schneller Nachrichtenaktualisierung (Edge Case)
    # Prüft, dass das Zitieren korrekt bleibt, wenn neue Nachrichten eintreffen
    Given die Unterhaltung wird in Echtzeit aktualisiert
    When der Nutzer wählt eine Nachricht aus und währenddessen trifft eine neue Nachricht ein
    Then bleibt die ausgewählte Nachricht im Antwortfeld als Zitat erhalten
    And die Antwort wird mit Bezug auf die ursprünglich ausgewählte Nachricht gesendet

  @@regression @@negative @@error
  Scenario: Fehler beim Senden der Antwort mit Zitat
    # Prüft Fehlerbehandlung, wenn die Zustellung fehlschlägt
    Given die Antwort mit Zitat ist verfasst
    When das System kann die Nachricht nicht zustellen
    Then wird eine verständliche Fehlermeldung angezeigt
    And die zitierte Nachricht bleibt im Antwortfeld erhalten

  @@regression @@edge
  Scenario: Mehrere Empfänger mit unterschiedlicher Sichtbarkeit (Edge Case)
    # Prüft, dass nur berechtigte Empfänger die Antwort mit Zitat sehen
    Given die Unterhaltung enthält Empfänger mit unterschiedlichen Berechtigungen
    When der Nutzer sendet eine Antwort mit Zitat
    Then sehen nur berechtigte Empfänger die Antwort samt Zitat
    And unberechtigte Empfänger sehen die Antwort nicht

  @@regression @@happy-path
  Scenario Outline: Zitieren mit verschiedenen Nachrichtentypen (Scenario Outline)
    # Prüft, dass das Zitieren für verschiedene Nachrichtentypen funktioniert
    Given eine Nachricht vom Typ <message_type> ist sichtbar
    When der Nutzer zitiert die Nachricht und sendet eine Antwort
    Then wird der Inhalt der zitierten Nachricht korrekt im Antwortfeld angezeigt
    And die Antwort wird mit Bezug auf die zitierte Nachricht zugestellt

    Examples:
      | message_type |
      | Text |
      | Bild mit Textbeschreibung |
      | Datei mit Titel |
