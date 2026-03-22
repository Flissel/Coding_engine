@smoke @regression
Feature: Enforce code quality gates and coverage thresholds in CI/CD
  As a QA Engineer
  I want to Verify that code quality gates and automated test coverage thresholds are enforced in CI/CD
  So that Ensures maintainable code and reduces defects through consistent automated testing standards

  Background:
    Given the CI pipeline is configured with coverage thresholds and quality gate rules

  @@smoke @@regression @@happy-path
  Scenario: Happy path: All quality checks pass on main branch
    # Validates that coverage, quality gate, and tests pass under normal conditions
    Given the main branch build is triggered with the full test suite
    When the CI pipeline generates the coverage report and runs static analysis
    Then unit test line coverage on core modules is at least 80%
    And the quality gate status is Pass with no blocker or critical issues
    And all automated tests pass and the build is green

  @@regression @@boundary
  Scenario: Boundary: Coverage exactly at the minimum threshold
    # Ensures the pipeline accepts coverage at the boundary value
    Given the coverage report is generated for core modules
    When the measured line coverage is exactly 80%
    Then the coverage gate is marked as passed
    And the pipeline proceeds to the next stage

  @@regression @@edge
  Scenario: Edge case: Coverage slightly above threshold with minor issues
    # Validates that passing coverage does not override quality gate failures
    Given core module coverage is 80.1% and static analysis is executed
    When static analysis reports one critical issue
    Then the quality gate status is Fail
    And the pipeline fails despite coverage meeting the threshold

  @@regression @@negative
  Scenario: Error scenario: Coverage below threshold fails the gate
    # Verifies pipeline failure when coverage is below minimum
    Given the coverage report is generated for core modules
    When the measured line coverage is below 80%
    Then the coverage gate is marked as failed
    And the pipeline status is failed

  @@smoke @@regression
  Scenario Outline: Scenario Outline: Automated test execution results on main branch
    # Data-driven validation of test pass rates affecting build status
    Given the main branch build runs the full automated test suite
    When the test pass rate is <pass_rate>%
    Then the build status is <build_status>
    And the pipeline enforces the 100% pass requirement

    Examples:
      | pass_rate | build_status |
      | 100 | green |
      | 99.9 | failed |

  @@regression @@negative
  Scenario Outline: Scenario Outline: Static analysis quality gate outcomes
    # Validates quality gate logic for blocker and critical issues
    Given the CI pipeline runs static analysis with configured rules
    When the analysis reports <blocker_count> blocker issues and <critical_count> critical issues
    Then the quality gate status is <gate_status>
    And the pipeline enforces the quality gate decision

    Examples:
      | blocker_count | critical_count | gate_status |
      | 0 | 0 | Pass |
      | 1 | 0 | Fail |
      | 0 | 2 | Fail |
