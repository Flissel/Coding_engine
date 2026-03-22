@@smoke @@regression
Feature: Videoanruf
  As a Endnutzer
  I want to einen verschlüsselten Videoanruf starten und empfangen
  So that vertraulich und plattformübergreifend in hoher Qualität kommunizieren zu können

  Background:
    Given zwei Endnutzer haben gültige Konten und die App ist gestartet

  @@smoke @@regression @@happy-path
  Scenario: Verschlüsselter Videoanruf zwischen zwei Online-Nutzern
    # Happy path: erfolgreicher Aufbau eines Ende-zu-Ende-verschlüsselten Videoanrufs
    Given beide Endnutzer sind online und verfügbar
    When Nutzer A startet einen Videoanruf an Nutzer B und Nutzer B nimmt an
    Then der Videoanruf wird mit Ende-zu-Ende-Verschlüsselung aufgebaut
    And beide sehen und hören sich in hoher Qualität

  @@regression @@negative
  Scenario: Empfänger nicht verfügbar
    # Error scenario: Anruf wird nicht gestartet, wenn Empfänger offline oder nicht verfügbar ist
    Given der Empfänger ist offline oder nicht verfügbar
    When ein Nutzer einen Videoanruf startet
    Then das System zeigt eine nicht verfügbare Benachrichtigung an
    And der Anruf wird nicht gestartet

  @@regression @@edge
  Scenario: Wiederverbindung bei instabilem Netzwerk
    # Edge case: System versucht Wiederverbindung und informiert bei Fehlschlag
    Given ein Videoanruf ist aktiv
    When die Netzwerkverbindung wird instabil oder unterbrochen
    Then das System versucht eine Wiederverbindung
    And bei Fehlschlag informiert das System den Nutzer verständlich

  @@regression @@boundary
  Scenario Outline: Videoanruf-Aufbau auf unterschiedlichen Plattformen
    # Boundary condition: plattformübergreifender Anruf mit unterschiedlichen Geräten
    Given Nutzer A ist auf <plattform_A> und Nutzer B ist auf <plattform_B> online
    When Nutzer A einen Videoanruf an Nutzer B startet und Nutzer B annimmt
    Then der Anruf wird erfolgreich aufgebaut und ist Ende-zu-Ende-verschlüsselt
    And Audio und Video sind beidseitig verfügbar

    Examples:
      | plattform_A | plattform_B |
      | iOS | Android |
      | Web | iOS |

  @@regression @@negative @@boundary
  Scenario Outline: Wiederverbindung scheitert nach maximalen Versuchen
    # Error boundary: Abbruch nach maximalen Wiederverbindungsversuchen
    Given ein Videoanruf ist aktiv und das System erlaubt maximal <max_versuche> Wiederverbindungsversuche
    When die Verbindung bleibt unterbrochen für <dauer_sekunden> Sekunden
    Then das System bricht den Anruf nach Erreichen der maximalen Versuche ab
    And der Nutzer erhält eine verständliche Fehlermeldung

    Examples:
      | max_versuche | dauer_sekunden |
      | 3 | 30 |
      | 5 | 60 |
