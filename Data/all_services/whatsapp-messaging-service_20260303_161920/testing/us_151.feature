@@smoke @@regression
Feature: Verify Error Budget Definitions and Enforcement
  As a DevOps Engineer
  I want to verify that reliability targets are defined and enforced through explicit error budgets with monitoring and alerting in place
  So that ensures reliability expectations are measurable and enforced, preventing unbounded risk to service availability

  Background:
    Given the service catalog, SLO documentation, and monitoring data sources are available

  @@smoke @@regression @@happy-path
  Scenario: Happy path: 100% of critical services have explicit error budgets aligned to SLOs
    # Validates policy coverage for critical services with documented error budgets
    Given the critical services list and SLO documents are loaded
    When the system measures error budget policy coverage
    Then the coverage result equals 100%
    And each critical service has an explicit error budget aligned to its SLO

  @@regression @@boundary
  Scenario Outline: Boundary: Error budget calculation accuracy within ±1% variance
    # Validates recalculated error budgets match reported values at the accuracy boundary
    Given monitoring data and reported error budget values exist for each service
    When the system recalculates error budgets from SLOs and actual uptime
    Then the variance between recalculated and reported values is within the allowed threshold
    And the variance equals the expected boundary value

    Examples:
      | service | reported_budget | recalculated_budget | allowed_variance |
      | payments-api | 4.00% | 4.04% | ±1% |
      | orders-api | 2.50% | 2.48% | ±1% |

  @@regression @@edge
  Scenario Outline: Edge case: Burn rate breach triggers alert at threshold
    # Validates enforcement when burn rate is exactly at threshold for the defined window
    Given a burn rate threshold and alerting rule are defined
    When monitoring simulates a burn rate at the threshold for the specified duration
    Then an alert is triggered
    And the alert contains the service name and breach window

    Examples:
      | service | burn_rate | duration |
      | checkout-api | 2.0x | 1h |

  @@regression @@negative
  Scenario Outline: Error scenario: Missing error budget definition for a critical service
    # Validates detection of missing error budget definitions
    Given a critical service exists without an error budget definition
    When the system measures error budget policy coverage
    Then the coverage result is less than 100%
    And the missing service is reported in the coverage gap list

    Examples:
      | service |
      | inventory-api |

  @@regression @@negative
  Scenario Outline: Error scenario: Burn rate below threshold does not trigger alert
    # Validates no alert is fired when burn rate is below the defined threshold
    Given a burn rate threshold and alerting rule are defined
    When monitoring simulates a burn rate below the threshold for the specified duration
    Then no alert is triggered
    And the burn rate is recorded without enforcement actions

    Examples:
      | service | burn_rate | duration |
      | catalog-api | 1.9x | 1h |
