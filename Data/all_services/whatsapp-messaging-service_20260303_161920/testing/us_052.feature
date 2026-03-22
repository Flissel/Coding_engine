@smoke @regression
Feature: GIFs suchen und senden
  As a Endnutzer
  I want to GIFs suchen und in einer Nachricht versenden
  So that um die Kommunikation ansprechender und schneller zu gestalten

  Background:
    Given der Endnutzer befindet sich im Nachrichten-Composer

  @@smoke @@regression @@happy-path
  Scenario Outline: GIF aus Suchergebnissen auswählen und Nachricht senden
    # Erfolgreiches Suchen, Einfügen und Versenden eines GIFs
    Given eine stabile Internetverbindung besteht
    When der Endnutzer nach dem Stichwort "<keyword>" sucht
    And der Endnutzer ein GIF aus den Ergebnissen auswählt
    Then wird das GIF in die Nachricht eingefügt
    And beim Senden wird das GIF zuverlässig zugestellt

    Examples:
      | keyword |
      | lustig |
      | hallo |

  @@regression @@edge @@negative
  Scenario Outline: GIF-Suche liefert keine Treffer
    # Hinweis anzeigen und keine GIFs einfügen, wenn keine Ergebnisse vorhanden sind
    Given der Endnutzer befindet sich in der GIF-Suche
    When die Suche nach dem Stichwort "<keyword>" keine Treffer liefert
    Then wird eine verständliche Hinweisnachricht angezeigt
    And es werden keine GIFs eingefügt

    Examples:
      | keyword |
      | xyzabc123 |
      | unbekannterbegriff |

  @@regression @@negative @@error
  Scenario Outline: GIF-Suche schlägt wegen Dienstfehler oder fehlender Verbindung fehl
    # Fehlermeldung anzeigen und erneute Suche ermöglichen
    When die GIF-Suche aufgrund von "<reason>" fehlschlägt
    Then wird eine Fehlermeldung angezeigt
    And der Nutzer kann die Suche erneut versuchen

    Examples:
      | reason |
      | Dienstfehler |
      | fehlender Verbindung |

  @@regression @@boundary
  Scenario Outline: Boundary: Suchbegriff mit minimaler und maximaler Länge
    # Validierung der Suchfunktion bei Grenzwerten der Eingabelänge
    Given eine stabile Internetverbindung besteht
    When der Endnutzer nach dem Stichwort "<keyword>" sucht
    Then werden Suchergebnisse angezeigt oder ein Hinweis auf keine Treffer
    And es wird kein unerwarteter Fehler angezeigt

    Examples:
      | keyword |
      | a |
      | abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyzabcdefghijklmn |
