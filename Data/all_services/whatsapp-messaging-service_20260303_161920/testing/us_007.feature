@@smoke @@regression
Feature: Anzeigename im Profil speichern
  As a registrierter Nutzer
  I want to einen konfigurierbaren Anzeigenamen im Profil festlegen und speichern
  So that eine klare und konsistente Darstellung im Chat zu erreichen, was die Kommunikation und Wiedererkennbarkeit verbessert

  Background:
    Given der Nutzer ist angemeldet und befindet sich im Profilbereich

  @@smoke @@regression @@happy-path
  Scenario Outline: Anzeigename erfolgreich speichern und anzeigen
    # Happy Path: gültiger Anzeigename wird gespeichert und überall angezeigt
    When der Nutzer einen gültigen Anzeigenamen "<display_name>" eingibt und speichert
    Then wird der Anzeigename gespeichert
    And der Anzeigename wird in Profil und Chat angezeigt

    Examples:
      | display_name |
      | MaxMuster |
      | TeamLead_Anna |

  @@regression @@boundary
  Scenario Outline: Anzeigename auf minimale zulässige Länge setzen
    # Boundary: minimale Länge wird akzeptiert
    When der Nutzer einen Anzeigenamen mit der minimalen zulässigen Länge "<display_name>" eingibt und speichert
    Then wird der Anzeigename gespeichert
    And der Anzeigename wird in Profil und Chat angezeigt

    Examples:
      | display_name |
      | A |

  @@regression @@boundary
  Scenario Outline: Anzeigename auf maximale zulässige Länge setzen
    # Boundary: maximale Länge wird akzeptiert
    When der Nutzer einen Anzeigenamen mit der maximalen zulässigen Länge "<display_name>" eingibt und speichert
    Then wird der Anzeigename gespeichert
    And der Anzeigename wird in Profil und Chat angezeigt

    Examples:
      | display_name |
      | ABCDEFGHIJKLMNOPQRSTUVWXYZ1234 |

  @@regression @@negative
  Scenario Outline: Anzeigename auf leer setzen
    # Error: leerer Anzeigename wird abgelehnt und vorheriger Wert bleibt erhalten
    Given der Nutzer hat einen bestehenden Anzeigenamen "<previous_name>"
    When der Nutzer den Anzeigenamen leert und speichert
    Then wird eine Validierungsmeldung angezeigt
    And der vorherige Anzeigename bleibt erhalten

    Examples:
      | previous_name |
      | MaxMuster |

  @@regression @@negative
  Scenario Outline: Nicht erlaubte Zeichen im Anzeigenamen
    # Error: nicht erlaubte Zeichen werden abgelehnt
    When der Nutzer einen Anzeigenamen mit nicht erlaubten Zeichen "<display_name>" eingibt und speichert
    Then wird eine Fehlermeldung angezeigt
    And der Anzeigename wird nicht gespeichert

    Examples:
      | display_name |
      | Max<>Muster |
      | Anna#2024 |

  @@regression @@negative @@edge
  Scenario Outline: Anzeigename über maximaler Länge
    # Edge/Error: zu langer Anzeigename wird abgelehnt
    When der Nutzer einen Anzeigenamen über der maximalen Länge "<display_name>" eingibt und speichert
    Then wird eine Fehlermeldung angezeigt
    And der Anzeigename wird nicht gespeichert

    Examples:
      | display_name |
      | ABCDEFGHIJKLMNOPQRSTUVWXYZ12345 |
