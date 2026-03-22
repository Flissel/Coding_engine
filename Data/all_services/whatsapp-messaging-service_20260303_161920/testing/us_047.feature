@@smoke @@regression
Feature: US-047 Bilder senden
  As a registrierter Nutzer
  I want to ein Bild in einem Chat senden
  So that damit Informationen visuell schneller und klarer übermittelt werden können und die Kommunikation effizienter ist

  Background:
    Given der Nutzer ist angemeldet und befindet sich in einem bestehenden Chat

  @@smoke @@regression @@happy-path
  Scenario: Bild im gültigen Format erfolgreich senden
    # Happy Path: Ein gültiges Bild wird gesendet und erscheint bei Sender und Empfänger
    When der Nutzer ein gültiges Bildformat auswählt und auf „Senden“ tippt
    Then wird das Bild gesendet
    And das Bild wird im Chat für Sender und Empfänger angezeigt

  @@regression @@happy-path
  Scenario Outline: Unterstützte Bildformate senden
    # Happy Path datengetrieben: Mehrere unterstützte Formate senden
    When der Nutzer ein Bild im Format <format> auswählt und auf „Senden“ tippt
    Then wird das Bild gesendet
    And das Bild wird im Chat für Sender und Empfänger angezeigt

    Examples:
      | format |
      | jpg |
      | png |
      | gif |

  @@negative @@regression
  Scenario Outline: Nicht unterstütztes Dateiformat verhindern
    # Error Scenario: Senden eines nicht unterstützten Formats wird blockiert
    When der Nutzer ein nicht unterstütztes Dateiformat als Bild auswählt und auf „Senden“ tippt
    Then wird das Senden verhindert
    And eine verständliche Fehlermeldung wird angezeigt

    Examples:
      | format |
      | exe |
      | pdf |

  @@negative @@regression @@boundary
  Scenario Outline: Bildgröße über dem Limit ablehnen
    # Boundary/Error: Bilddatei überschreitet die maximale Größe
    When der Nutzer eine Bilddatei auswählt, die größer als das maximale Limit ist, und auf „Senden“ tippt
    Then wird das Senden abgelehnt
    And eine Meldung mit Hinweis zur Größenbegrenzung wird angezeigt

    Examples:
      | size_mb |
      | max_limit_plus_1 |

  @@regression @@boundary
  Scenario Outline: Bildgröße am Limit zulassen
    # Boundary: Bilddatei mit genau maximal zulässiger Größe wird gesendet
    When der Nutzer eine Bilddatei auswählt, die genau der maximal zulässigen Größe entspricht, und auf „Senden“ tippt
    Then wird das Bild gesendet
    And das Bild wird im Chat für Sender und Empfänger angezeigt

    Examples:
      | size_mb |
      | max_limit |

  @@negative @@regression
  Scenario: Übertragung schlägt bei instabiler Verbindung fehl und kann erneut versucht werden
    # Error Scenario: Netzwerkfehler zeigt Fehlermeldung und erlaubt erneuten Versand
    Given die Netzwerkverbindung ist instabil
    When der Nutzer ein Bild sendet und die Übertragung fehlschlägt
    Then wird der Fehler angezeigt
    And der Nutzer kann den Versand erneut versuchen
