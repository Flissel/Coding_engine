@smoke @regression
Feature: Business-Statistiken
  As a Business-Admin
  I want to grundlegende Nachrichtenstatistiken zu seinen Business-Konversationen im Dashboard einsehen
  So that die Kundenkommunikation zu optimieren und fundierte Entscheidungen auf Basis von Leistungskennzahlen zu treffen

  Background:
    Given der Business-Admin ist authentifiziert und hat Zugriff auf das Business-Dashboard

  @smoke @regression @happy-path
  Scenario Outline: Anzeigen grundlegender Kennzahlen für einen Zeitraum mit Aktivität
    # Happy path: korrekte Kennzahlen werden für einen aktiven Zeitraum angezeigt
    Given es existieren Nachrichtenstatistiken für den ausgewählten Zeitraum
    When der Business-Admin die Statistikansicht für den ausgewählten Zeitraum öffnet
    Then werden gesendete Nachrichten, zugestellte Nachrichten und Antwortrate korrekt angezeigt
    And die Kennzahlen entsprechen den zugrunde liegenden Daten

    Examples:
      | zeitraum | gesendet | zugestellt | antwortrate |
      | letzte 7 Tage | 120 | 115 | 35% |

  @regression @edge
  Scenario Outline: Zeitraum ohne Nachrichtenaktivität zeigt 0-Werte und Hinweis
    # Edge case: Zeitraum mit keiner Aktivität zeigt 0-Werte und Hinweistext
    Given es gibt keine Nachrichtenaktivität im ausgewählten Zeitraum
    When der Business-Admin die Statistikansicht für den ausgewählten Zeitraum öffnet
    Then werden alle Kennzahlen mit 0-Werten angezeigt
    And es erscheint ein Hinweis, dass keine Aktivität vorliegt

    Examples:
      | zeitraum | gesendet | zugestellt | antwortrate |
      | letzte 24 Stunden | 0 | 0 | 0% |

  @regression @negative
  Scenario Outline: Fehler beim Laden der Statistikdaten zeigt Fehlermeldung und Reload-Option
    # Error scenario: Systemfehler verhindert Laden der Statistikdaten
    Given ein Systemfehler verhindert das Laden der Statistikdaten
    When der Business-Admin die Statistikansicht öffnet
    Then wird eine verständliche Fehlermeldung angezeigt
    And es gibt eine Option zum erneuten Laden

    Examples:
      | fehlercode | meldung |
      | 500 | Statistiken konnten nicht geladen werden |

  @regression @boundary
  Scenario Outline: Grenzwert: Zeitraum mit genau einer Nachricht
    # Boundary condition: minimaler Aktivitätsumfang wird korrekt berechnet
    Given es gibt genau eine gesendete Nachricht im ausgewählten Zeitraum
    When der Business-Admin die Statistikansicht für den ausgewählten Zeitraum öffnet
    Then wird die Anzahl gesendeter Nachrichten als 1 angezeigt
    And wird die Antwortrate entsprechend den Daten berechnet

    Examples:
      | zeitraum | gesendet | zugestellt | antwortrate |
      | letzter Tag | 1 | 1 | 0% |

  @regression @data-driven
  Scenario Outline: Zeitraum-Auswahl als Datengetriebener Test
    # Scenario Outline: unterschiedliche Zeiträume liefern konsistente Kennzahlen
    Given es existieren Nachrichtenstatistiken für den ausgewählten Zeitraum
    When der Business-Admin die Statistikansicht für den Zeitraum "<zeitraum>" öffnet
    Then werden gesendete Nachrichten als "<gesendet>" angezeigt
    And werden zugestellte Nachrichten als "<zugestellt>" angezeigt

    Examples:
      | zeitraum | gesendet | zugestellt |
      | letzte 7 Tage | 120 | 115 |
      | letzte 30 Tage | 540 | 520 |
