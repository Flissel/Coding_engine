@smoke @regression
Feature: QR-Code Profil
  As a Primärer Nutzer
  I want to einen scanbaren QR-Code für sein Profil generieren und anzeigen lassen
  So that Kontakte schnell und einfach hinzufügen können, ohne manuelle Eingabe, bei gleichzeitiger einfacher Bedienung

  Background:
    Given der Nutzer befindet sich in der Profilansicht der Anwendung

  @happy-path @smoke @regression
  Scenario: QR-Code anzeigen für aktives Profil
    # Happy path: Ein angemeldeter Nutzer mit aktivem Profil kann den QR-Code anzeigen
    Given der Nutzer ist angemeldet
    And der Nutzer hat ein aktives Profil
    When der Nutzer die Funktion „QR-Code anzeigen“ auswählt
    Then wird ein scanbarer QR-Code für sein Profil angezeigt
    And der QR-Code enthält die eindeutige Profil-URL

  @happy-path @regression
  Scenario: QR-Code scannen und Profil öffnen
    # Happy path: Ein anderer Nutzer scannt den QR-Code und öffnet das Profil
    Given der QR-Code für ein aktives Profil wird angezeigt
    When ein anderer Nutzer den QR-Code scannt
    Then wird das zugehörige Profil korrekt geöffnet
    And das Profil kann hinzugefügt werden

  @negative @regression
  Scenario Outline: QR-Code Generierung verweigert bei fehlender Anmeldung oder inaktivem Profil
    # Error path: Fehlermeldung bei nicht angemeldetem Nutzer oder inaktivem Profil
    Given der Nutzerzustand ist <user_state>
    When der Nutzer versucht, einen QR-Code zu generieren
    Then erhält der Nutzer eine verständliche Fehlermeldung
    And es wird kein QR-Code angezeigt

    Examples:
      | user_state |
      | nicht angemeldet |
      | angemeldet ohne aktives Profil |

  @edge @regression
  Scenario: QR-Code Anzeige bei wiederholtem Aufruf
    # Edge case: Wiederholtes Öffnen zeigt denselben gültigen QR-Code
    Given der Nutzer ist angemeldet
    And der Nutzer hat ein aktives Profil
    When der Nutzer die Funktion „QR-Code anzeigen“ zweimal hintereinander auswählt
    Then wird jeweils ein scanbarer QR-Code angezeigt
    And der QR-Code verweist in beiden Fällen auf dieselbe Profil-URL

  @boundary @regression
  Scenario Outline: QR-Code Scan bei langsamer Netzwerkverbindung
    # Boundary condition: Profil öffnet korrekt trotz hoher Latenz
    Given der QR-Code für ein aktives Profil wird angezeigt
    And die Netzwerkverbindung des scannenden Nutzers hat eine Latenz von <latency_ms> ms
    When der scannende Nutzer den QR-Code scannt
    Then wird das Profil korrekt geöffnet
    And es wird eine Ladeanzeige bis zur vollständigen Anzeige gezeigt

    Examples:
      | latency_ms |
      | 500 |
      | 1500 |
