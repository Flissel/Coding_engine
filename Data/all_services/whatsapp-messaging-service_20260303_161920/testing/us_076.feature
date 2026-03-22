@smoke @regression
Feature: Nachrichtensuche
  As a Endnutzer
  I want to Nachrichten per Volltextsuche durchsuchen
  So that um relevante Informationen schnell zu finden und die Kommunikation effizient fortzusetzen

  Background:
    Given der Endnutzer ist im Nachrichtensystem angemeldet
    And der Endnutzer hat einen Nachrichtenverlauf

  @@smoke @@regression @@happy-path
  Scenario Outline: Volltextsuche liefert passende Nachrichten
    # Validiert die erfolgreiche Suche nach vorhandenen Begriffen
    When der Endnutzer den Suchbegriff "<suchbegriff>" in die Volltextsuche eingibt und die Suche ausführt
    Then werden Nachrichten angezeigt, die den Suchbegriff enthalten
    And die Ergebnisse werden innerhalb der akzeptierten Antwortzeit angezeigt

    Examples:
      | suchbegriff |
      | Rechnung |
      | Terminbestätigung |

  @@regression @@edge
  Scenario Outline: Suche mit seltenem oder nicht vorhandenem Begriff
    # Prüft die Anzeige leerer Ergebnisse bei keinen Treffern
    When der Endnutzer den Suchbegriff "<suchbegriff>" in die Volltextsuche eingibt und die Suche ausführt
    Then wird eine leere Ergebnisliste angezeigt
    And ein Hinweis wird angezeigt, dass keine Treffer gefunden wurden

    Examples:
      | suchbegriff |
      | xqzv-9843 |
      | unbekannterbegriff |

  @@regression @@negative @@error
  Scenario Outline: Suchfunktion vorübergehend nicht verfügbar
    # Stellt eine verständliche Fehlermeldung und beibehaltene Eingabe sicher
    Given die Suchfunktion ist vorübergehend nicht verfügbar
    When der Endnutzer den Suchbegriff "<suchbegriff>" eingibt und die Suche startet
    Then wird eine verständliche Fehlermeldung angezeigt
    And der eingegebene Suchbegriff bleibt im Suchfeld erhalten

    Examples:
      | suchbegriff |
      | Projektstatus |

  @@regression @@boundary
  Scenario Outline: Boundary: minimale und maximale Suchlänge
    # Validiert Grenzwerte der Eingabelänge
    When der Endnutzer den Suchbegriff "<suchbegriff>" in die Volltextsuche eingibt und die Suche ausführt
    Then wird die Suche korrekt ausgeführt oder eine valide Eingabemeldung angezeigt
    And das Verhalten entspricht der definierten Eingabelängenregel

    Examples:
      | suchbegriff |
      | A |
      | AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA |
