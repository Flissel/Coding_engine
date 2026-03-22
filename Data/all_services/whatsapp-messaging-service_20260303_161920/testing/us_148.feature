@@smoke @@regression
Feature: Verify data minimization and retention compliance
  As a QA Engineer
  I want to Verify that personal data is retained only for defined periods and is deletable upon request
  So that Ensures compliance with data minimization principles and user privacy obligations

  Background:
    Given retention schedules and deletion policies are configured and active

  @@happy-path @@regression
  Scenario: Retention duration compliance meets 100% target
    # Happy path verifying all personal data records are within approved retention periods
    Given the system is under Review retention policy mappings and run database queries to compare record timestamps against retention schedules conditions
    When measuring Retention duration compliance
    Then the result meets target: 100% of personal data records stored no longer than the approved retention period
    And all retention schedule mappings are found for each personal data category

  @@happy-path @@smoke @@regression
  Scenario: Deletion request fulfillment time meets SLA thresholds
    # Happy path verifying deletion requests are completed within policy timelines
    Given the system is under Audit deletion request logs and timestamps from intake to completion conditions
    When measuring Deletion request fulfillment time
    Then the result meets target: 95% of deletion requests completed within 30 days; 100% within 45 days
    And no request has a negative or missing completion timestamp

  @@happy-path @@regression
  Scenario: Deletion completeness across primary and backups
    # Happy path verifying deleted data is removed from primary and backup systems
    Given the system is under Perform data discovery scans and backup restoration tests to confirm absence of deleted records conditions
    When measuring Deletion completeness
    Then the result meets target: 100% of requested personal data removed from primary and backup systems per policy
    And no deleted identifiers are detected in discovery scan results

  @@boundary @@regression
  Scenario Outline: Retention boundary conditions by category
    # Boundary testing of records at, just before, and just after retention limits
    Given retention schedules specify <retention_days> days for <category>
    And a record for <category> has an age of <record_age_days> days
    When measuring Retention duration compliance
    Then the record is <expected_status> retention compliance

    Examples:
      | category | retention_days | record_age_days | expected_status |
      | billing | 365 | 365 | within |
      | billing | 365 | 364 | within |
      | billing | 365 | 366 | out of |

  @@edge @@regression
  Scenario Outline: Deletion SLA edge cases around 30 and 45 day limits
    # Edge case validation for deletion fulfillment thresholds
    Given a deletion request is completed in <completion_days> days
    When measuring Deletion request fulfillment time
    Then the request is <expected_sla_status> the SLA policy

    Examples:
      | completion_days | expected_sla_status |
      | 30 | within |
      | 31 | within |
      | 45 | within |
      | 46 | outside |

  @@negative @@regression
  Scenario: Missing retention mapping triggers error handling
    # Error scenario when a personal data category lacks a retention schedule mapping
    Given a personal data category exists without a retention schedule mapping
    When measuring Retention duration compliance
    Then the system flags a compliance error for missing retention mapping
    And the compliance report excludes the unmapped category from the 100% calculation

  @@negative @@regression
  Scenario: Deletion completeness error when backups retain records
    # Error scenario when deleted records are still present in backups
    Given a deletion request has been completed for a user
    And backup restoration tests reveal residual records for that user
    When measuring Deletion completeness
    Then the system reports a deletion completeness failure
    And the residual records are listed for remediation
