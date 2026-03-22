@@smoke @@regression
Feature: Events planen und erstellen
  As a Gruppenmitglied
  I want to ein Event in einer Gruppe planen und erstellen
  So that damit alle Gruppenmitglieder zuverlässig informiert werden und die Organisation einfacher wird

  Background:
    Given das Gruppenmitglied ist in einer Gruppe angemeldet und hat Berechtigung zum Erstellen von Events

  @@happy-path @@smoke @@regression
  Scenario: Event erfolgreich erstellen und Benachrichtigungen senden
    # Prüft den Happy Path für das Speichern eines Events mit allen Pflichtfeldern
    When das Gruppenmitglied einen gültigen Titel, Datum/Uhrzeit in der Zukunft, Ort und Beschreibung eingibt und das Event speichert
    Then wird das Event in der Gruppe angezeigt
    And eine Benachrichtigung wird an alle Gruppenmitglieder gesendet

  @@boundary @@regression
  Scenario: Event erstellen mit minimal gültigen Feldlängen
    # Prüft Boundary Conditions für minimale gültige Eingaben
    When das Gruppenmitglied ein Event mit minimal erlaubter Titel- und Beschreibungslänge sowie gültigem Datum/Uhrzeit und Ort speichert
    Then wird das Event erfolgreich gespeichert und angezeigt
    And eine Benachrichtigung wird an alle Gruppenmitglieder gesendet

  @@negative @@regression
  Scenario Outline: Pflichtfelder fehlen beim Speichern
    # Prüft Validierung bei fehlenden Pflichtfeldern
    When das Gruppenmitglied versucht das Event mit fehlendem Pflichtfeld zu speichern
    Then wird eine verständliche Validierungsmeldung angezeigt
    And das Event wird nicht gespeichert

    Examples:
      | missing_field |
      | Titel |
      | Datum/Uhrzeit |
      | Ort |

  @@negative @@regression
  Scenario: Eventdatum in der Vergangenheit
    # Prüft Fehlerbehandlung für vergangene Daten
    When das Gruppenmitglied ein Event mit einem Datum in der Vergangenheit speichert
    Then wird das Speichern verhindert
    And eine Fehlermeldung wird angezeigt

  @@boundary @@regression
  Scenario: Event genau zum aktuellen Zeitpunkt
    # Prüft Boundary Condition für Datum/Uhrzeit gleich jetzt
    When das Gruppenmitglied ein Event mit Datum/Uhrzeit genau auf dem aktuellen Zeitpunkt speichert
    Then wird eine Validierungsmeldung angezeigt, dass das Datum in der Zukunft liegen muss
    And das Event wird nicht gespeichert

  @@negative @@regression
  Scenario Outline: Datumsformat ungültig
    # Prüft Fehlermeldung bei ungültigem Datumsformat
    When das Gruppenmitglied ein Event mit ungültigem Datumsformat eingibt und speichert
    Then wird eine verständliche Validierungsmeldung angezeigt
    And das Event wird nicht gespeichert

    Examples:
      | date_input |
      | 32.13.2025 25:61 |
      | 2025-02-30 10:00 |
