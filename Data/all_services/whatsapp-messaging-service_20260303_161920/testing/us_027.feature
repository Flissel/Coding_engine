@smoke @regression
Feature: Gruppenadministration
  As a Gruppenadministrator
  I want to Gruppenmitglieder verwalten und Gruppenrechte konfigurieren
  So that damit die Gruppenkommunikation sicher, effizient und konform gesteuert werden kann

  Background:
    Given eine bestehende Gruppe mit Administratorrechten des Nutzers

  @happy-path @smoke @regression
  Scenario Outline: Mitglieder hinzufügen und Rollen ändern werden sofort wirksam
    # Happy path für Hinzufügen, Entfernen und Rollenänderung mit Protokollierung
    Given eine Gruppe mit aktivierter Protokollierung
    When der Gruppenadministrator das Mitglied "<mitglied>" mit Rolle "<rolle>" hinzufügt
    Then wird das Mitglied in der Mitgliederliste mit Rolle "<rolle>" angezeigt
    And ein Protokolleintrag für das Hinzufügen ist sichtbar

    Examples:
      | mitglied | rolle |
      | Max Mustermann | Moderator |
      | Erika Musterfrau | Mitglied |

  @negative @regression
  Scenario Outline: Rollenänderung gegen Datenschutz- und Sicherheitsregeln wird blockiert
    # Error scenario bei Regelverstoß
    Given eine Gruppe mit definierten Datenschutz- und Sicherheitsregeln
    When der Gruppenadministrator versucht, die Rolle "<rolle>" für das Mitglied "<mitglied>" zuzuweisen
    Then blockiert das System die Aktion
    And eine verständliche Fehlermeldung "<fehlermeldung>" wird angezeigt

    Examples:
      | mitglied | rolle | fehlermeldung |
      | Alex Beispiel | Datenschutzbeauftragter | Rolle verstößt gegen Gruppenrichtlinien |
      | Chris Demo | Externer Auditor | Rolle nicht zulässig für diese Gruppe |

  @edge @regression
  Scenario Outline: Performante Suche und Rollenaktualisierung in großer Gruppe
    # Edge case mit großer Mitgliederzahl und performanter Suche
    Given eine große Gruppe mit "<anzahl>" Mitgliedern
    When der Gruppenadministrator nach dem Mitglied "<mitglied>" sucht und die Rolle zu "<rolle>" aktualisiert
    Then liefert das System die Suche performant und ohne Verzögerung
    And die Rollenänderung wird bestätigt und angezeigt

    Examples:
      | anzahl | mitglied | rolle |
      | 10000 | User-9999 | Moderator |
      | 50000 | User-50000 | Mitglied |

  @boundary @regression
  Scenario Outline: Grenzfall: Entfernen des letzten Mitglieds verhindert oder bestätigt
    # Boundary condition für Mindestanzahl an Mitgliedern
    Given eine Gruppe mit genau "<anzahl>" Mitglied
    When der Gruppenadministrator versucht, das Mitglied "<mitglied>" zu entfernen
    Then zeigt das System das Ergebnis "<ergebnis>" an
    And ein Protokolleintrag zur Aktion ist vorhanden oder es wird eine Regelverletzung gemeldet

    Examples:
      | anzahl | mitglied | ergebnis |
      | 1 | Solo User | Entfernen blockiert: Gruppe darf nicht leer sein |
      | 2 | Second User | Mitglied entfernt |
