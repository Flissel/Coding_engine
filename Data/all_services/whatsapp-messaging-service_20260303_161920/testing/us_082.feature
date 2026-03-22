@@smoke @@regression
Feature: Profilbild-Sichtbarkeit konfigurieren
  As a registrierter Nutzer
  I want to die Sichtbarkeit meines Profilbildes konfigurieren
  So that meine Privatsphaere kontrollieren und gleichzeitig je nach Bedarf Vertrauen in der Kommunikation aufbauen

  Background:
    Given ich bin als registrierter Nutzer angemeldet
    And ich befinde mich in den Profileinstellungen

  @@smoke @@regression @@happy-path
  Scenario: Sichtbarkeit speichern und sofort wirksam
    # Happy path: eine gueltige Sichtbarkeitsoption wird gespeichert und wirkt sofort
    When ich waehle die Sichtbarkeitsoption "Nur Kontakte"
    And ich speichere die Aenderung
    Then die ausgewaehlte Profilbild-Sichtbarkeit ist gespeichert
    And die neue Sichtbarkeit ist sofort wirksam

  @@regression @@happy-path
  Scenario: Profilbild fuer andere Nutzer ausblenden
    # Happy path: Einstellung 'Niemand' blendet Profilbild ohne Platzhalter aus
    Given ich habe die Sichtbarkeit auf "Niemand" gesetzt
    When ein anderer Nutzer ruft mein Profil auf
    Then mein Profilbild wird nicht angezeigt
    And es erscheint kein Platzhalter mit Identifikationsmerkmalen

  @@regression @@edge
  Scenario Outline: Gueltige Sichtbarkeitsoptionen speichern (Outline)
    # Edge case: alle gueltigen Optionen lassen sich speichern
    When ich waehle die Sichtbarkeitsoption "<option>"
    And ich speichere die Aenderung
    Then die ausgewaehlte Profilbild-Sichtbarkeit ist gespeichert
    And die neue Sichtbarkeit ist sofort wirksam

    Examples:
      | option |
      | Alle |
      | Nur Kontakte |
      | Niemand |

  @@regression @@negative
  Scenario Outline: Ungueltige Sichtbarkeitsoption ablehnen (Outline)
    # Error scenario: ungueltige Optionen werden abgelehnt und die vorherige Einstellung bleibt bestehen
    Given meine aktuelle Sichtbarkeit ist "Nur Kontakte"
    When ich versuche die Sichtbarkeitsoption "<invalid_option>" zu speichern
    Then das System zeigt eine Fehlermeldung
    And die bisherige gueltige Einstellung bleibt "Nur Kontakte"

    Examples:
      | invalid_option |
      | Alle+ |
      |  |
      | Unbekannt |

  @@regression @@boundary
  Scenario: Sofortige Wirksamkeit nach Rueckkehr zum Profil
    # Boundary condition: Sichtbarkeit wirkt ohne erneutes Laden der Einstellungen
    When ich setze die Sichtbarkeit auf "Niemand" und speichere
    And ich rufe unmittelbar danach mein Profil in einer neuen Ansicht auf
    Then mein Profilbild ist in der neuen Ansicht nicht sichtbar
