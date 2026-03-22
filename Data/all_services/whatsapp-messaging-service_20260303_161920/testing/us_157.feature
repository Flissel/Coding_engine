@@smoke @@regression
Feature: Assistive technology support for core user flows
  As a QA Engineer
  I want to Verify that core user flows are fully operable with screen readers and keyboard-only navigation
  So that Ensures accessibility compliance and usability for users relying on assistive technologies

  Background:
    Given the test environment is configured with NVDA on Windows and VoiceOver on macOS

  @@smoke @@regression @@happy-path
  Scenario: Happy path: Screen reader labels, roles, and focus order are complete for all core flow screens
    # Validates 100% screen reader coverage for meaningful labels, roles, and focus order in core flows
    Given the accessibility tree inspection tool is enabled
    When the tester runs the scripted walkthrough for all core flow screens
    Then each screen exposes meaningful labels and roles to the screen reader
    And the focus order announced by the screen reader matches the visual flow

  @@regression @@happy-path
  Scenario Outline: Scenario Outline: Keyboard-only task completion across core flows
    # Ensures tasks can be completed using only Tab/Shift+Tab/Enter/Space
    Given the user starts at the <start_page> of the <core_flow>
    When the user completes the flow using only keyboard navigation
    Then the <core_flow> is completed without using a mouse
    And all required fields are reachable and actionable via keyboard

    Examples:
      | core_flow | start_page |
      | Login | Login page |
      | Checkout | Cart page |
      | Profile Update | Profile page |

  @@regression @@edge
  Scenario: Edge case: Focus visibility and order on dynamic content updates
    # Checks focus visibility and logical order when content is dynamically loaded
    Given a core flow page loads additional fields dynamically after a selection
    When the user tabs through interactive elements after the update
    Then a visible focus indicator is present on each interactive element
    And the focus order remains logical and consistent with the visual layout

  @@regression @@negative
  Scenario: Error scenario: Missing label or role on an interactive element
    # Validates that missing accessible labels/roles are detected and reported
    Given an interactive element in a core flow lacks an accessible label or role
    When the screen reader inspects the accessibility tree for that element
    Then the coverage check fails for that screen
    And the defect is logged with the element identifier and page context

  @@regression @@boundary
  Scenario: Boundary condition: Minimum focus indicator contrast and visibility
    # Ensures focus indicators are visible at the minimum acceptable contrast threshold
    Given the UI theme is set to the lowest supported contrast setting
    When the user tabs through all interactive elements in a core flow page
    Then the focus indicator is still visible on every element
    And the focus order remains logical and complete
