@@smoke @@regression
Feature: Bildschirmfreigabe
  As a registrierter Nutzer
  I want to während eines laufenden Anrufs die Bildschirmfreigabe starten und beenden
  So that um Inhalte klar zu erklären und die Kommunikation effizienter zu gestalten

  Background:
    Given ein aktiver Anruf zwischen zwei Teilnehmern besteht
    And beide Teilnehmer sind verbunden und können Audio empfangen

  @@smoke @@happy-path @@regression
  Scenario Outline: Bildschirmfreigabe starten und Ansicht in Echtzeit sehen
    # Validiert den erfolgreichen Start der Bildschirmfreigabe für unterschiedliche Freigabetypen
    Given der Nutzer hat Berechtigung zur Bildschirmfreigabe im Betriebssystem erteilt
    When der Nutzer die Funktion „Bildschirmfreigabe starten“ auswählt und den Freigabetyp <share_type> bestätigt
    Then sehen alle Teilnehmer die geteilte Ansicht in Echtzeit
    And die Anzeige „Bildschirmfreigabe aktiv“ wird dem Nutzer angezeigt

    Examples:
      | share_type |
      | gesamter Bildschirm |
      | ein bestimmtes Fenster |

  @@regression @@happy-path
  Scenario: Bildschirmfreigabe beenden
    # Validiert das sofortige Stoppen der Übertragung und die Endansicht für alle Teilnehmer
    Given eine aktive Bildschirmfreigabe läuft
    When der Nutzer die Bildschirmfreigabe beendet
    Then wird die Übertragung sofort gestoppt
    And alle Teilnehmer erhalten die Ansicht „Freigabe beendet“

  @@negative @@regression
  Scenario: Fehler bei fehlender Berechtigung oder verweigerter Freigabe
    # Validiert verständliche Fehlermeldung und dass keine Freigabe startet
    Given der Nutzer hat keine Berechtigung zur Bildschirmfreigabe oder verweigert die Freigabe im Betriebssystem
    When der Nutzer die Funktion „Bildschirmfreigabe starten“ auswählt
    Then wird eine verständliche Fehlermeldung angezeigt
    And es wird keine Bildschirmfreigabe gestartet

  @@edge @@regression
  Scenario: Abbruch des Freigabedialogs ohne Auswahl
    # Edge Case: Nutzer schließt den Freigabedialog ohne Auswahl
    Given der Freigabedialog des Betriebssystems ist geöffnet
    When der Nutzer den Dialog ohne Auswahl abbricht
    Then wird keine Bildschirmfreigabe gestartet
    And eine verständliche Information über den Abbruch wird angezeigt

  @@boundary @@regression
  Scenario Outline: Starten der Freigabe direkt nach Anrufbeginn
    # Boundary Condition: Freigabe wird unmittelbar nach Gesprächsaufbau gestartet
    Given der Anruf wurde gerade aufgebaut und ist aktiv
    When der Nutzer sofort die Funktion „Bildschirmfreigabe starten“ auswählt und den Freigabetyp <share_type> bestätigt
    Then sehen alle Teilnehmer die geteilte Ansicht in Echtzeit
    And der Anruf bleibt aktiv ohne Unterbrechung

    Examples:
      | share_type |
      | gesamter Bildschirm |
      | ein bestimmtes Fenster |
