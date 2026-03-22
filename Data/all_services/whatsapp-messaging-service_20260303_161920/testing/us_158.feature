@@smoke @@regression
Feature: Verify API standards compliance
  As a QA Engineer
  I want to verify that all external and internal APIs conform to documented integration standards
  So that ensures consistent integration behavior, reduces integration defects, and simplifies onboarding for consumers

  Background:
    Given all published API specifications and versions are available in the repository

  @@smoke @@regression @@happy-path
  Scenario: 100% compliance for linting and schema validation
    # Happy path where all APIs conform to approved standard schema and style guide
    Given automated linting and schema validation are enabled against the API standards checklist
    When the compliance rate is measured for all published APIs
    Then the compliance rate is 100%
    And no linting or schema violations are reported

  @@regression @@happy-path
  Scenario: Contract tests pass for each API version
    # Happy path where contract tests pass for request/response formats and error handling
    Given contract tests are configured in CI for each API version
    When the contract test pass rate is measured
    Then the pass rate is 100%
    And all request, response, and error schemas match the specifications

  @@regression @@happy-path
  Scenario: Documentation completeness for required sections
    # Happy path where documentation includes required sections for all APIs
    Given documentation audit uses a checklist and automated OpenAPI spec parsing
    When documentation completeness is measured
    Then 100% of APIs include required documentation sections
    And the sections include auth, endpoints, error codes, and versioning

  @@regression @@edge-case
  Scenario: Edge case for mixed API versions and legacy endpoints
    # Edge case where multiple versions and legacy endpoints are included in compliance checks
    Given the inventory includes current and legacy API versions
    When linting, contract testing, and documentation audits run across all versions
    Then all versions meet the 100% compliance targets
    And legacy endpoints do not introduce schema or documentation gaps

  @@regression @@boundary
  Scenario: Boundary condition for minimum required documentation sections
    # Boundary test where APIs include exactly the minimum required documentation sections
    Given an API documentation set includes only the minimum required sections
    When documentation completeness is evaluated
    Then the completeness score is 100%
    And no missing-section violations are reported

  @@regression @@negative
  Scenario: Error scenario for non-compliant schemas detected
    # Negative test where schema violations cause compliance rate to drop below target
    Given an API specification has a schema violation against the standard checklist
    When the compliance rate is measured for all published APIs
    Then the compliance rate is below 100%
    And the violation is reported with a failing checklist rule

  @@regression @@negative
  Scenario Outline: Scenario Outline: Contract test failures by error handling variation
    # Negative test for different error format deviations in contract tests
    Given a contract test suite runs for API version <version>
    When the API returns error response with <error_issue>
    Then the contract test fails for error handling
    And the failure is reported with the <error_issue> detail

    Examples:
      | version | error_issue |
      | v1 | missing error code field |
      | v2 | incorrect error schema structure |

  @@regression @@negative
  Scenario Outline: Scenario Outline: Documentation section omissions
    # Negative test where required documentation sections are missing
    Given API documentation is parsed for <api_name>
    When the <section> section is missing
    Then documentation completeness is below 100%
    And the missing <section> is reported

    Examples:
      | api_name | section |
      | Payments API | auth |
      | Accounts API | error codes |
      | Orders API | versioning |
