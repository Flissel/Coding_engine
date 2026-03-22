@@smoke @@regression
Feature: Compliance reporting verification for GDPR and CCPA
  As a Security Team
  I want to verify that privacy controls and compliance reporting meet GDPR and CCPA requirements
  So that to ensure regulatory compliance and reduce legal and reputational risk

  Background:
    Given the compliance reporting system is available in the test environment

  @@smoke @@regression @@happy-path
  Scenario: GDPR reporting coverage is 100% for required elements
    # Validates full GDPR reporting coverage for all required elements
    Given the GDPR checklist contains all required reporting elements
    When I measure GDPR compliance coverage in the generated report
    Then the coverage result is 100% of required GDPR reporting elements present
    And the report lists data processing, consent, data subject rights, and breach notification elements

  @@regression @@happy-path
  Scenario: CCPA reporting coverage is 100% for required elements
    # Validates full CCPA reporting coverage for all required elements
    Given the CCPA checklist contains all required reporting elements
    When I measure CCPA compliance coverage in the generated report
    Then the coverage result is 100% of required CCPA reporting elements present
    And the report lists notice, opt-out, access, deletion, and non-discrimination elements

  @@regression @@happy-path
  Scenario: Evidence traceability is complete for sampled report items
    # Ensures evidence artifacts and logs are linked for sampled controls
    Given a 30% random sample of report items is selected
    When I verify evidence artifacts and system logs for sampled items
    Then 100% of sampled reported controls are linked to auditable evidence
    And each evidence link is accessible and time-stamped

  @@smoke @@regression @@happy-path
  Scenario: Report generation is available on demand within 24 hours
    # Validates report generation availability and timeliness
    Given a compliance report request is submitted
    When I measure the time until the report is available
    Then the report is available on demand
    And the report becomes available within 24 hours of the request

  @@regression @@edge
  Scenario Outline: Scenario Outline: GDPR coverage edge case with minimum required elements
    # Checks boundary coverage when only minimum required elements are present
    Given the report includes exactly the minimum GDPR elements: <elements>
    When I measure GDPR compliance coverage in the generated report
    Then the coverage result is <expected_coverage>

    Examples:
      | elements | expected_coverage |
      | data processing, consent, data subject rights, breach notification | 100% |

  @@regression @@negative
  Scenario Outline: Scenario Outline: CCPA coverage error when a required element is missing
    # Verifies failure when any required CCPA reporting element is missing
    Given the report is missing the required CCPA element: <missing_element>
    When I measure CCPA compliance coverage in the generated report
    Then the coverage result is less than 100%
    And the missing element <missing_element> is flagged in the coverage report

    Examples:
      | missing_element |
      | opt-out |
      | deletion |

  @@regression @@boundary
  Scenario Outline: Scenario Outline: Report availability boundary condition at 24 hours
    # Validates boundary timing for report availability
    Given a compliance report request is submitted at <request_time>
    When the report becomes available at <available_time>
    Then the availability time is within 24 hours

    Examples:
      | request_time | available_time |
      | 2024-01-01T08:00:00Z | 2024-01-02T08:00:00Z |

  @@regression @@negative
  Scenario Outline: Scenario Outline: Evidence traceability error when evidence link is missing
    # Ensures missing evidence links are detected for sampled items
    Given a 30% random sample of report items is selected
    When I verify evidence artifacts and system logs for sampled items
    Then any item with missing evidence links is reported as non-compliant
    And the missing evidence reference for <control_id> is logged

    Examples:
      | control_id |
      | GDPR-DSR-02 |
      | CCPA-OPT-01 |
