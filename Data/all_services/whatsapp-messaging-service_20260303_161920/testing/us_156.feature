@smoke @regression
Feature: WCAG 2.1 AA Compliance Verification
  As a QA Engineer
  I want to validate that all user interfaces meet WCAG 2.1 AA accessibility standards
  So that ensures users with disabilities can effectively use the system and reduces compliance risk

  Background:
    Given the WCAG 2.1 AA checklist, automated scanner, and test environments are available

  @happy-path @smoke @regression
  Scenario: Full WCAG conformance on core pages
    # Validates 100% WCAG 2.1 AA success criteria pass on tested pages
    Given automated accessibility scans and manual audits are configured for all core pages
    When the WCAG 2.1 AA conformance results are measured
    Then 100% of tested pages pass all WCAG 2.1 AA success criteria
    And all findings are recorded with no critical or major violations

  @happy-path @regression
  Scenario: Keyboard-only navigation across critical flows
    # Ensures all interactive elements are reachable and operable via keyboard
    Given manual keyboard-only navigation tests are prepared for critical user flows
    When each flow is completed using only Tab, Shift+Tab, Enter, and Space
    Then 100% of interactive elements are reachable and operable via keyboard
    And focus indicators remain visible on all focusable elements

  @happy-path @regression
  Scenario: Screen reader usability on supported platforms
    # Validates critical flows are fully usable with NVDA and VoiceOver
    Given manual tests using NVDA on Windows and VoiceOver on macOS are prepared
    When critical user flows are executed with a screen reader enabled
    Then all critical flows are fully usable with the screen reader
    And all form fields and controls have accurate accessible names

  @regression @boundary
  Scenario: Color contrast compliance across text sizes
    # Verifies contrast ratios meet WCAG 2.1 AA thresholds
    Given automated contrast checks are configured with spot manual verification
    When contrast ratios are measured for normal and large text
    Then normal text meets 4.5:1 and large text meets 3:1 minimum contrast ratios
    And UI components and graphical objects meet the minimum required contrast

  @regression @edge-case
  Scenario Outline: Outline - WCAG scan results by page set
    # Data-driven validation of WCAG conformance by page group
    Given the page set <page_set> is selected for automated scanning and manual audit
    When WCAG 2.1 AA conformance is measured
    Then the pass rate is <expected_pass_rate> for the selected page set
    And all high-impact issues are captured in the report

    Examples:
      | page_set | expected_pass_rate |
      | core authenticated pages | 100% |
      | public marketing pages | 100% |

  @edge-case @regression
  Scenario Outline: Outline - Keyboard navigation on dynamic components
    # Validates keyboard accessibility on dynamic UI elements
    Given the dynamic component <component> is available in a core flow
    When the component is operated using only the keyboard
    Then all actions are possible and focus order is logical
    And no keyboard trap occurs

    Examples:
      | component |
      | modal dialog with form fields |
      | dropdown menu with nested items |
      | carousel with next/previous controls |

  @boundary @regression
  Scenario Outline: Outline - Color contrast boundary values
    # Checks boundary contrast ratios at thresholds
    Given a text element of size <text_size> is rendered
    When the measured contrast ratio is <contrast_ratio>
    Then the contrast evaluation result is <expected_result>

    Examples:
      | text_size | contrast_ratio | expected_result |
      | normal | 4.5:1 | pass |
      | normal | 4.49:1 | fail |
      | large | 3:1 | pass |
      | large | 2.99:1 | fail |

  @negative @regression
  Scenario: Accessibility scan detects violations
    # Ensures failures are reported when WCAG criteria are not met
    Given a page contains missing form labels and insufficient contrast
    When automated and manual WCAG 2.1 AA checks are executed
    Then the page fails WCAG 2.1 AA conformance
    And violations are logged with severity and remediation guidance

  @negative @regression
  Scenario: Screen reader fails on critical flow
    # Validates that critical flow usability failures are detected
    Given a critical flow includes a button without an accessible name
    When the flow is executed with a screen reader enabled
    Then the flow is not fully usable and is marked as failed
    And the missing accessible name is recorded as a blocking issue

  @negative @edge-case
  Scenario: Keyboard navigation blocked by a focus trap
    # Ensures keyboard traps are detected and reported
    Given a modal dialog opens without a focus escape path
    When the user attempts to navigate out using keyboard only
    Then a keyboard trap is detected and the test fails
    And the failure is logged with reproduction steps
