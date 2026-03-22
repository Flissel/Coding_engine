@@smoke @@regression
Feature: Verify failover time and user impact during node and zone failures
  As a DevOps Engineer
  I want to Verify automatic failover time and user impact during node and zone failures
  So that Ensures service continuity and minimal disruption to users during infrastructure failures

  Background:
    Given staging environment is configured with synthetic monitoring, APM, and load testing instrumentation enabled

  @@smoke @@happy-path
  Scenario: Failover time meets target for node failure
    # Validates node failure failover time within 60 seconds under controlled conditions
    Given a controlled node failure is induced on a single node in the cluster
    When synthetic monitoring measures service availability restoration time
    Then the failover time is less than or equal to 60 seconds
    And service availability is restored for all critical endpoints

  @@regression @@happy-path
  Scenario: Failover time meets target for zone outage
    # Validates zone failover routing within 120 seconds using monitoring timestamps
    Given a zone outage is simulated for the primary availability zone
    When monitoring timestamps capture traffic routing to the healthy zone
    Then the failover time is less than or equal to 120 seconds
    And all incoming traffic is served by the healthy zone

  @@regression @@edge-case
  Scenario: User-visible error rate remains within target during failover
    # Validates error rate does not exceed 1% during the 5-minute failover window
    Given failover drills are running with APM error capture and load testing enabled
    When the user-visible HTTP error rate is measured over a 5-minute window
    Then the error rate is less than or equal to 1% of requests
    And no critical endpoint exceeds the error rate threshold

  @@regression @@edge-case
  Scenario: Session continuity rate meets threshold during failover
    # Validates session retention across failover using session logs and synthetic journeys
    Given active user sessions are established before the failover drill
    When session logs and synthetic user journeys are analyzed during failover
    Then the session continuity rate is greater than or equal to 99%
    And session drops are correlated to failover timestamps

  @@regression @@boundary
  Scenario Outline: Failover time boundary conditions for node and zone failures
    # Validates boundary values at exact thresholds for node and zone failover times
    Given a <failure_type> is induced under controlled conditions
    When the failover time is measured as <measured_seconds> seconds
    Then the result is <expected_outcome> against the <threshold_seconds> seconds threshold

    Examples:
      | failure_type | measured_seconds | threshold_seconds | expected_outcome |
      | node failure | 60 | 60 | accepted |
      | zone failure | 120 | 120 | accepted |

  @@regression @@negative
  Scenario Outline: Failover exceeds target thresholds
    # Validates system behavior when failover time exceeds targets
    Given a <failure_type> is induced with constrained recovery conditions
    When the failover time is measured as <measured_seconds> seconds
    Then the result is flagged as a failure against the <threshold_seconds> seconds target
    And an incident alert is generated for the exceeded threshold

    Examples:
      | failure_type | measured_seconds | threshold_seconds |
      | node failure | 75 | 60 |
      | zone failure | 150 | 120 |

  @@regression @@negative
  Scenario Outline: Session continuity drops below threshold
    # Validates error scenario when session continuity is below target
    Given active user sessions are established before the failover drill
    When session continuity is measured as <continuity_rate> percent during failover
    Then the result is flagged as a failure against the 99% target
    And a session retention report is generated with impacted sessions

    Examples:
      | continuity_rate |
      | 98.5 |
