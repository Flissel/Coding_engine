@smoke @regression
Feature: Kontakte synchronisieren
  As a WhatsApp-Nutzer
  I want to Geraete-Kontakte mit WhatsApp-Nutzern synchronisieren
  So that um vorhandene Kontakte schnell zu finden und sofort Nachrichten senden zu koennen

  Background:
    Given die App ist installiert und der Nutzer ist angemeldet

  @happy-path @smoke @regression
  Scenario: Synchronisierung zeigt uebereinstimmende WhatsApp-Nutzer an
    # Happy path: Bei erteilter Berechtigung werden passende Kontakte als WhatsApp-Nutzer angezeigt
    Given der Nutzer hat der App den Zugriff auf die Geraete-Kontakte erlaubt
    And die Geraete-Kontakte enthalten mindestens einen Kontakt mit WhatsApp-Konto
    When der Nutzer die Synchronisierung startet
    Then werden alle uebereinstimmenden Kontakte als WhatsApp-Nutzer in der Kontaktliste angezeigt
    And die Synchronisierung wird als abgeschlossen angezeigt

  @edge @regression
  Scenario: Kontakte ohne WhatsApp bleiben unveraendert
    # Edge case: Nicht uebereinstimmende Kontakte werden nicht als WhatsApp-Nutzer markiert
    Given der Nutzer hat der App den Zugriff auf die Geraete-Kontakte erlaubt
    And die Geraete-Kontakte enthalten Kontakte ohne WhatsApp-Konto
    When die Synchronisierung abgeschlossen ist
    Then werden Kontakte ohne WhatsApp-Konto nicht als WhatsApp-Nutzer markiert
    And diese Kontakte bleiben in der Kontaktliste unveraendert

  @negative @regression
  Scenario: Berechtigung verweigert zeigt Fehlermeldung
    # Error scenario: Bei verweigerter Berechtigung wird eine klare Fehlermeldung angezeigt
    Given der Nutzer hat den Zugriff auf die Geraete-Kontakte verweigert
    When eine Synchronisierung angefordert wird
    Then zeigt das System eine klare Fehlermeldung an
    And es wird eine Anleitung zur Aktivierung der Berechtigung angezeigt

  @boundary @regression
  Scenario Outline: Synchronisierung mit unterschiedlichen Kontaktmengen
    # Boundary condition: Verhalten bei leerer, kleiner und grosser Kontaktliste
    Given der Nutzer hat der App den Zugriff auf die Geraete-Kontakte erlaubt
    And die Geraete-Kontakte enthalten <kontakt_anzahl> Kontakte
    When der Nutzer die Synchronisierung startet
    Then wird die Synchronisierung abgeschlossen ohne Fehler
    And die Kontaktliste zeigt passende WhatsApp-Nutzer korrekt an

    Examples:
      | kontakt_anzahl |
      | 0 |
      | 1 |
      | 10000 |

  @happy-path @regression
  Scenario Outline: Teilweise Uebereinstimmung mit WhatsApp-Konten
    # Data-driven: Anteil uebereinstimmender Kontakte wird korrekt markiert
    Given der Nutzer hat der App den Zugriff auf die Geraete-Kontakte erlaubt
    And die Geraete-Kontakte enthalten <gesamt> Kontakte, davon haben <whatsapp> ein WhatsApp-Konto
    When der Nutzer die Synchronisierung startet
    Then werden genau <whatsapp> Kontakte als WhatsApp-Nutzer angezeigt
    And die uebrigen Kontakte bleiben unveraendert

    Examples:
      | gesamt | whatsapp |
      | 5 | 2 |
      | 10 | 10 |
      | 10 | 0 |
