@@smoke @@regression
Feature: Regionale Formate
  As a registrierter Nutzer
  I want to regionale Formate fuer Datum, Uhrzeit, Zahlen und Waerungen im System verwenden
  So that ich Informationen korrekt verstehen und Eingaben fehlerfrei vornehmen kann

  Background:
    Given der Nutzer ist registriert und angemeldet
    And das System zeigt Nachrichten, Preise und Zeitstempel im UI

  @@smoke @@happy-path
  Scenario: Anzeigeformate im de-DE Standard
    # Validiert die korrekte Anzeige von Datum, Uhrzeit, Zahlen und Waehrungen fuer de-DE
    Given die Systemsprache und Region sind auf de-DE eingestellt
    When der Nutzer Nachrichten, Preise und Zeitstempel im UI ansieht
    Then werden Datumsangaben im Format TT.MM.JJJJ angezeigt
    And werden Uhrzeiten im 24-Stunden-Format mit Doppelpunkt angezeigt
    And werden Zahlen mit Punkt als Tausendertrennzeichen und Komma als Dezimaltrennzeichen angezeigt
    And werden Waehrungen mit Euro-Symbol und Komma als Dezimaltrennzeichen angezeigt

  @@regression @@happy-path
  Scenario Outline: Regionale Anzeige- und Validierungsformate je Nutzerregion
    # Stellt sicher, dass Anzeige und Validierung gemaess gewaehlter Region erfolgen
    Given der Nutzer hat die Region "<region>" in den Einstellungen gewaehlt
    When das System Betraege und Datumsangaben darstellt
    Then werden Datumsangaben im Format "<date_format>" angezeigt
    And werden Betraege im Waehrungsformat "<currency_format>" angezeigt
    When der Nutzer einen Betrag "<amount_input>" und ein Datum "<date_input>" eingibt
    Then werden die Eingaben als gueltig akzeptiert

    Examples:
      | region | date_format | currency_format | amount_input | date_input |
      | en-US | MM/DD/YYYY | $1,234.56 | 1,234.56 | 12/31/2024 |
      | fr-FR | DD/MM/YYYY | 1 234,56 € | 1 234,56 | 31/12/2024 |

  @@negative @@regression
  Scenario Outline: Fehler bei Eingabe im falschen regionalen Format
    # Validiert Fehlermeldung bei nicht zur Region passendem Format
    Given der Nutzer hat die Region "<region>" in den Einstellungen gewaehlt
    When der Nutzer einen Betrag "<invalid_amount>" und ein Datum "<invalid_date>" eingibt
    And die Eingabe gespeichert werden soll
    Then zeigt das System eine verstaendliche Fehlermeldung
    And weist das System auf das erwartete Format "<expected_format>" hin

    Examples:
      | region | invalid_amount | invalid_date | expected_format |
      | de-DE | 1,234.56 | 12/31/2024 | Betrag: 1.234,56; Datum: 31.12.2024 |
      | en-US | 1.234,56 | 31.12.2024 | Amount: 1,234.56; Date: 12/31/2024 |

  @@edge @@regression
  Scenario Outline: Grenzwerte fuer Zahlen und Datumsangaben in der Region
    # Prueft Grenzwerte und Formatierung grosser Zahlen und Datumsgrenzen
    Given die Systemsprache und Region sind auf de-DE eingestellt
    When das System den Betrag "<amount>" und das Datum "<date>" darstellt
    Then wird der Betrag als "<formatted_amount>" angezeigt
    And wird das Datum als "<formatted_date>" angezeigt

    Examples:
      | amount | formatted_amount | date | formatted_date |
      | 0 | 0,00 € | 1900-01-01 | 01.01.1900 |
      | 1000000.5 | 1.000.000,50 € | 2099-12-31 | 31.12.2099 |
