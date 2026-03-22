@@smoke @@regression
Feature: Widgets
  As a Endnutzer
  I want to Home-Screen-Widgets für die App hinzufügen und konfigurieren
  So that um wichtige Informationen schnell und plattformübergreifend mit hoher Performance und sicherer Datenverarbeitung zu sehen

  Background:
    Given the app is installed on a device that supports home-screen widgets

  @@smoke @@happy-path
  Scenario: Add widget and load content successfully
    # Verifies that a widget can be added and loads content quickly and correctly
    Given the user has a valid session and has accepted privacy permissions
    When the user adds a widget to the home screen and selects the view "Overview"
    Then the widget is displayed and loads content quickly
    And the displayed content matches the selected view

  @@regression @@happy-path
  Scenario Outline: Widget view selection loads correct content
    # Validates multiple available views render correctly using data-driven testing
    Given the user has a valid session and has accepted privacy permissions
    When the user adds a widget and selects the view "<view_name>"
    Then the widget is displayed and loads content quickly
    And the widget shows data for "<view_name>"

    Examples:
      | view_name |
      | Overview |
      | Tasks |
      | Notifications |

  @@negative @@regression
  Scenario: Widget requires authentication or privacy consent
    # Ensures no data is shown without session or consent
    Given the user has no valid session or has not accepted privacy permissions
    When the widget attempts to load data
    Then the widget shows a message that login or consent is required
    And no user data is displayed

  @@negative @@regression
  Scenario: Widget shows error and keeps cached data when backend is unreachable
    # Validates error handling and data retention on network failure
    Given the widget has previously loaded data successfully
    And there is no network connection or the backend service is unreachable
    When the widget refreshes its content
    Then the widget shows a clear error message
    And the widget retains the last successful data

  @@regression @@edge-case
  Scenario Outline: Widget refresh respects boundary conditions for rapid updates
    # Checks behavior when refresh is triggered at the minimum allowed interval
    Given the user has a valid session and has accepted privacy permissions
    And the widget was refreshed "<seconds_ago>" seconds ago
    When the user triggers a widget refresh
    Then the widget adheres to the refresh policy and does not exceed rate limits
    And the widget remains responsive

    Examples:
      | seconds_ago |
      | 0 |
      | 5 |
