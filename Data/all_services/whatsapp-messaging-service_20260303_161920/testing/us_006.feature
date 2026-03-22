@@smoke @@regression
Feature: Profilbild verwalten
  As a registrierter Benutzer
  I want to ein Profilbild hochladen, anzeigen und bei Bedarf ersetzen oder entfernen
  So that damit mein Profil personalisiert ist und andere mich schneller erkennen

  Background:
    Given ich bin als registrierter Benutzer angemeldet
    And ich befinde mich in den Profileinstellungen

  @@smoke @@regression @@happy-path
  Scenario: Profilbild erfolgreich hochladen und anzeigen
    # Erfolgreicher Upload eines gültigen Bildes
    Given ich habe noch kein Profilbild
    When ich lade ein Bild im erlaubten Format und innerhalb der maximalen Dateigroesse hoch
    Then das Profilbild wird gespeichert
    And das neue Profilbild wird sofort im Profil angezeigt

  @@regression @@happy-path
  Scenario: Vorhandenes Profilbild durch neues ersetzen
    # Ersetzen eines bestehenden Profilbilds
    Given ich habe bereits ein Profilbild
    When ich lade ein neues gültiges Bild hoch
    Then das neue Profilbild ersetzt das alte
    And das alte Profilbild wird nicht mehr angezeigt

  @@regression @@negative
  Scenario Outline: Upload abgelehnt bei nicht unterstütztem Format oder zu grosser Datei
    # Fehlerfälle beim Upload mit unzulässigen Dateien
    When ich starte den Upload mit einer unzulaessigen Datei
    Then der Upload wird abgelehnt
    And eine verstaendliche Fehlermeldung wird angezeigt

    Examples:
      | datei_typ | datei_groesse | grund |
      | TXT | 1 MB | nicht unterstuetztes Format |
      | JPG | max_groesse_plus_1_byte | Datei zu gross |

  @@regression @@edge @@boundary
  Scenario Outline: Upload akzeptiert bei maximal zulaessiger Dateigroesse
    # Grenzwerttest fuer die maximale Dateigroesse
    When ich lade ein Bild im erlaubten Format mit exakt der maximalen Dateigroesse hoch
    Then das Profilbild wird gespeichert
    And das Profilbild wird sofort im Profil angezeigt

    Examples:
      | datei_typ | datei_groesse |
      | PNG | max_groesse |
