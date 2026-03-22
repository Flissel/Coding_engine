@@smoke @@regression
Feature: Nachricht weiterleiten
  As a registrierter Nutzer
  I want to eine empfangene Nachricht an einen oder mehrere Kontakte weiterleiten
  So that damit relevante Informationen schnell und zuverlässig geteilt werden können

  Background:
    Given der Nutzer ist registriert und eingeloggt
    And der Nutzer hat eine empfangene Nachricht geöffnet

  @@smoke @@regression @@happy-path
  Scenario Outline: Erfolgreiches Weiterleiten an einen oder mehrere Empfänger
    # Prüft die erfolgreiche Zustellung und Bestätigung bei gültigen Empfängern
    Given die Weiterleitungsfunktion ist verfügbar
    When der Nutzer wählt die Weiterleitungsfunktion und bestätigt die Empfänger <empfaenger_liste>
    Then die Nachricht wird an alle ausgewählten Empfänger zugestellt
    And der Nutzer erhält eine Bestätigung über die erfolgreiche Weiterleitung

    Examples:
      | empfaenger_liste |
      | ein einzelner Kontakt |
      | mehrere Kontakte |

  @@regression @@negative @@error
  Scenario: Keine Empfänger ausgewählt
    # Verhindert das Senden ohne Empfänger und zeigt einen Hinweis
    Given der Nutzer startet die Weiterleitung
    When der Nutzer bestätigt die Weiterleitung ohne Empfängerauswahl
    Then das System verhindert das Senden
    And das System zeigt einen Hinweis zur Empfängerauswahl

  @@regression @@negative @@error
  Scenario: Empfänger nicht erreichbar
    # Meldet Zustellfehler und bietet erneute Zustellung an
    Given der Nutzer wählt einen Empfänger, der nicht erreichbar ist
    When der Nutzer schickt die Weiterleitung ab
    Then das System meldet den Zustellfehler
    And das System bietet eine erneute Zustellung an

  @@regression @@edge @@boundary
  Scenario Outline: Grenzwert: Maximale Anzahl von Empfängern
    # Stellt sicher, dass das System die definierte Maximalzahl an Empfängern akzeptiert
    Given die maximale Empfängeranzahl ist auf <max_empfaenger> festgelegt
    When der Nutzer wählt genau <max_empfaenger> Empfänger und bestätigt
    Then die Nachricht wird an alle ausgewählten Empfänger zugestellt
    And der Nutzer erhält eine Bestätigung über die erfolgreiche Weiterleitung

    Examples:
      | max_empfaenger |
      | 10 |

  @@regression @@negative @@boundary
  Scenario Outline: Grenzwertüberschreitung: Mehr Empfänger als erlaubt
    # Verhindert die Weiterleitung, wenn die maximale Empfängeranzahl überschritten wird
    Given die maximale Empfängeranzahl ist auf <max_empfaenger> festgelegt
    When der Nutzer wählt <ueber_max_empfaenger> Empfänger und bestätigt
    Then das System verhindert das Senden
    And das System zeigt einen Hinweis zur maximalen Empfängeranzahl

    Examples:
      | max_empfaenger | ueber_max_empfaenger |
      | 10 | 11 |
