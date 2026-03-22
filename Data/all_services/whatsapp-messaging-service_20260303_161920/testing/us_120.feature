@smoke @regression
Feature: Web-Version Access
  As a Endnutzer
  I want to die Anwendung ueber eine Web-Version im Browser nutzen
  So that um plattformuebergreifend und ohne Installation schnell und zuverlaessig kommunizieren zu koennen

  Background:
    Given die Web-Anwendung ist verfuegbar und der Endnutzer hat ein gueltiges Benutzerkonto

  @smoke @regression @happy-path
  Scenario Outline: Successful login and core features available in supported browsers
    # Validiert, dass die Web-Version nach gueltigem Login in unterstuetzten Browsern geladen wird und Kernfunktionen verfuegbar sind
    Given der Endnutzer oeffnet einen unterstuetzten Browser
    When die Web-Anwendung aufgerufen und ein gueltiger Login durchgefuehrt wird
    Then die Web-Version wird geladen
    And alle Kernfunktionen sind verfuegbar

    Examples:
      | browser |
      | Chrome |
      | Firefox |
      | Edge |

  @regression @edge-case
  Scenario Outline: Session continues after кратzeitiger Verbindungsabbruch
    # Validiert die Statusmeldung und Fortsetzung der Sitzung nach kurzer Unterbrechung
    Given der Endnutzer nutzt die Web-Version und ist eingeloggt
    When die Internetverbindung kurzzeitig unterbrochen wird und wiederhergestellt wird
    Then der Nutzer erhaelt eine klare Statusmeldung zur Unterbrechung
    And die Sitzung wird nach Wiederverbindung fortgesetzt

    Examples:
      | disconnect_duration_seconds |
      | 5 |
      | 10 |

  @regression @negative @error
  Scenario Outline: Unsupported browser shows guidance
    # Validiert die Hinweis- und Empfehlungstexte bei nicht unterstuetztem Browser
    Given der Endnutzer oeffnet einen nicht unterstuetzten Browser
    When die Web-Anwendung aufgerufen wird
    Then es wird ein Hinweis angezeigt, dass der Browser nicht unterstuetzt ist
    And eine Empfehlung zu unterstuetzten Browsern wird gegeben

    Examples:
      | browser |
      | Internet Explorer 11 |
      | Legacy Android Browser |

  @regression @boundary
  Scenario Outline: Boundary: Login attempt with minimal credentials length
    # Validiert das Verhalten bei minimal gueltigen Eingaben fuer den Login
    Given der Endnutzer oeffnet einen unterstuetzten Browser
    When die Web-Anwendung aufgerufen und der Login mit minimal gueltigen Zugangsdaten durchgefuehrt wird
    Then die Web-Version wird geladen
    And alle Kernfunktionen sind verfuegbar

    Examples:
      | username_length | password_length |
      | 3 | 8 |
