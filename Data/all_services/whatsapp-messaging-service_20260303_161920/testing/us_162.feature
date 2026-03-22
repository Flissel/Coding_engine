@smoke @regression
Feature: US-162 Verify Backup Strategy
  As a DevOps Engineer
  I want to Verify that backups are executed frequently and are reliable across regions through scheduled checks and restore tests
  So that Ensures data resilience and availability in case of regional failures or data loss

  Background:
    Given the backup monitoring system has access to backup schedules, logs, replication reports, and restore test results for the last 30 days

  @smoke @regression @happy-path
  Scenario: Validate backup frequency meets 15-minute target for critical data stores
    # Happy path verifying backup frequency meets or exceeds the 15-minute target
    Given critical data stores have recorded backup timestamps for the last 30 days
    When I calculate the maximum interval between consecutive backups for each critical data store
    Then the maximum interval is less than or equal to 15 minutes for each critical data store
    And no gaps in the backup schedule exceed the target interval

  @regression @happy-path
  Scenario: Cross-region replication success rate meets monthly target
    # Happy path verifying replication success rate is at least 99.9% per month
    Given monthly replication job reports and failure logs across regions are available
    When I compute the monthly replication success rate from the reports
    Then the success rate is greater than or equal to 99.9%
    And any failed replications are documented with remediation status

  @regression @happy-path
  Scenario: Monthly cross-region restore tests achieve 100% success
    # Happy path verifying all scheduled restore tests succeed in the month
    Given scheduled restore tests were executed for all regions this month
    When I review the outcomes of each scheduled restore test
    Then all restore tests are marked as successful
    And the restore evidence includes validation of data integrity

  @regression @boundary
  Scenario Outline: RPO boundary validation for restore tests
    # Boundary condition validating RPO at and above the 15-minute limit
    Given restore test results include measured data loss windows
    When I evaluate the Recovery Point Objective for each restore test
    Then the RPO is within the allowed threshold
    And any RPO above the threshold is flagged as a failure

    Examples:
      | measured_rpo_minutes | expected_outcome |
      | 15 | pass |
      | 16 | fail |

  @regression @edge-case
  Scenario: Backup frequency edge case with intermittent delays
    # Edge case where backup intervals occasionally approach the 15-minute limit
    Given backup logs show intermittent delays for a critical data store
    When I compute the maximum backup interval over the last 30 days
    Then the maximum interval does not exceed the 15-minute target
    And intervals within 1 minute of the target are recorded for trend analysis

  @regression @negative
  Scenario: Replication report missing data results in analysis failure
    # Error scenario where replication data is incomplete
    Given replication job reports are missing for one or more regions
    When I attempt to calculate the monthly replication success rate
    Then the calculation fails due to incomplete data
    And an alert is raised to request missing reports

  @regression @negative
  Scenario: Restore test failure is detected and reported
    # Error scenario where a scheduled restore test fails
    Given a scheduled cross-region restore test has a failed outcome
    When I review the restore test outcomes for the month
    Then the monthly restore success rate is below 100%
    And the failure is logged with root cause and corrective action
