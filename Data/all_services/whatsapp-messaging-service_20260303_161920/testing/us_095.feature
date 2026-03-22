@@smoke @@regression
Feature: Chat anpinnen
  As a registrierter Nutzer
  I want to wichtige Chats anpinnen
  So that damit ich relevante Unterhaltungen schnell finde und effizient kommunizieren kann

  Background:
    Given ich bin als registrierter Nutzer angemeldet

  @@smoke @@regression @@happy-path
  Scenario: Chat erfolgreich anpinnen und oben anzeigen
    # Prüft das erfolgreiche Anpinnen eines nicht angepinnten Chats und die Anzeige oben in der Liste
    Given ich befinde mich in der Chatliste und der Chat "Projekt A" ist nicht angepinnt
    When ich die Option „Anpinnen“ für den Chat "Projekt A" auswähle
    Then wird der Chat "Projekt A" als angepinnt markiert
    And der Chat "Projekt A" wird in der Chatliste oben angezeigt

  @@regression @@happy-path
  Scenario Outline: Mehrere angepinnte Chats behalten ihre Reihenfolge nach Aktualisierung
    # Validiert die Reihenfolge der angepinnten Chats nach Öffnen oder Aktualisieren der Chatliste
    Given ich habe die Chats <PinnedChats> angepinnt und <UnpinnedChats> nicht angepinnt
    When ich die Chatliste öffne oder aktualisiere
    Then werden alle angepinnten Chats oberhalb der nicht angepinnten Chats angezeigt
    And die Reihenfolge der angepinnten Chats bleibt <ExpectedOrder>

    Examples:
      | PinnedChats | UnpinnedChats | ExpectedOrder |
      | Chat A, Chat B, Chat C | Chat D, Chat E | Chat A, Chat B, Chat C |
      | Chat X, Chat Y | Chat Z | Chat X, Chat Y |

  @@regression @@negative @@edge-case
  Scenario: Erneutes Anpinnen eines bereits angepinnten Chats
    # Edge Case: verhindert doppeltes Anpinnen und zeigt Statushinweis
    Given der Chat "Support" ist bereits angepinnt
    When ich die Option „Anpinnen“ erneut für den Chat "Support" auswähle
    Then wird der Chat nicht doppelt angepinnt
    And das System zeigt den Status „bereits angepinnt“ an

  @@regression @@negative @@error
  Scenario: Anpinnen schlägt fehl bei nicht erreichbarem Server
    # Fehlerszenario: Server nicht erreichbar und keine Änderung am Chat
    Given der Server ist nicht erreichbar und der Chat "Team" ist nicht angepinnt
    When ich die Option „Anpinnen“ für den Chat "Team" auswähle
    Then erhalte ich eine Fehlermeldung
    And der Chat "Team" bleibt unverändert und nicht angepinnt

  @@regression @@boundary
  Scenario: Anpinnen des ersten Chats in einer leeren Pin-Sektion
    # Boundary Condition: erster angepinnter Chat wird korrekt in der Pin-Sektion platziert
    Given es gibt keine angepinnten Chats und der Chat "Onboarding" ist nicht angepinnt
    When ich die Option „Anpinnen“ für den Chat "Onboarding" auswähle
    Then der Chat "Onboarding" wird als angepinnt markiert
    And die Pin-Sektion enthält genau den Chat "Onboarding"
