@@smoke @@regression
Feature: Deployment Frequency and Reliability Metrics Verification
  As a DevOps Engineer
  I want to Verify that the deployment pipeline supports frequent, low-risk releases through automation, rollback capability, and short lead times
  So that Ensures the system can deliver changes rapidly with minimal disruption, reducing risk and improving responsiveness to stakeholder needs

  Background:
    Given the 4-week review period is defined with complete CI/CD, incident, and audit logs

  @@smoke @@regression @@happy-path
  Scenario: Happy path: All deployment performance targets are met
    # Validates that frequency, change failure rate, lead time, and automation coverage meet targets
    Given the deployment logs show 4 weeks of production deployments
    When the system calculates deployment frequency, change failure rate, lead time, and automation coverage
    Then deployment frequency is at least 3 per week
    And change failure rate is less than or equal to 5 percent
    And median lead time from merge to production is under 24 hours
    And automation coverage for production deployments is 100 percent

  @@regression @@boundary
  Scenario Outline: Boundary conditions: Metrics exactly at thresholds
    # Ensures thresholds are inclusive at boundary values
    Given the 4-week period has <total_deployments> production deployments and <rollbacks> rollbacks or hotfixes
    And median lead time from merge to production is <median_lead_time_hours> hours
    And all production deployments were executed by the CI/CD pipeline
    When the system evaluates deployment metrics
    Then deployment frequency meets the target of at least 3 per week
    And change failure rate meets the target of less than or equal to 5 percent
    And median lead time meets the target under 24 hours

    Examples:
      | total_deployments | rollbacks | median_lead_time_hours |
      | 12 | 0 | 23.9 |
      | 12 | 1 | 24 |

  @@regression @@negative
  Scenario Outline: Edge case: Deployment frequency just below target
    # Validates failure when deployment frequency is below minimum
    Given the 4-week period has <total_deployments> production deployments
    When deployment frequency is calculated
    Then the deployment frequency target is not met

    Examples:
      | total_deployments |
      | 11 |

  @@regression @@negative
  Scenario Outline: Edge case: Change failure rate exceeds target
    # Validates failure when rollbacks or hotfixes exceed 5 percent
    Given the 4-week period has <total_deployments> production deployments and <rollbacks> rollbacks or hotfixes
    When change failure rate is calculated
    Then the change failure rate target is not met

    Examples:
      | total_deployments | rollbacks |
      | 20 | 2 |

  @@regression @@negative
  Scenario: Error scenario: Missing logs prevent metric calculation
    # Ensures an error is reported when required logs are unavailable
    Given CI/CD deployment logs for the 4-week period are missing
    When the system attempts to calculate deployment frequency
    Then the system reports an error indicating missing deployment logs

  @@regression @@negative
  Scenario Outline: Edge case: Automated deployment coverage is below 100 percent
    # Validates failure when any production deployment is not via CI/CD pipeline
    Given the 4-week period has <total_deployments> production deployments with <manual_deployments> manual executions
    When automated deployment coverage is calculated
    Then the automated deployment coverage target is not met

    Examples:
      | total_deployments | manual_deployments |
      | 100 | 1 |
