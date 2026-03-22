@@smoke @@regression
Feature: US-142 Verify Concurrent User Scaling
  As a QA Engineer
  I want to verify horizontal scaling maintains low latency under high concurrent user loads
  So that ensures the system can handle peak demand without degrading user experience or violating performance expectations

  Background:
    Given the load test environment is provisioned with monitoring for latency, throughput, and error rates

  @@smoke @@regression @@happy-path
  Scenario: Sustained load at 10,000 users meets latency, throughput, and error targets
    # Happy path validating all acceptance criteria under peak concurrency
    Given the system is running with N instances and a ramp-up to 10,000 concurrent users
    When the test harness measures p95 latency, throughput, and error rate at steady state
    Then p95 response time is less than or equal to 500 ms
    And throughput is greater than or equal to 5,000 requests per second
    And error rate is less than or equal to 0.5 percent

  @@regression @@boundary
  Scenario Outline: Boundary conditions at exact threshold values
    # Boundary validation when metrics are exactly at target thresholds
    Given the system is running at 10,000 concurrent users with stable load
    When the test harness records the boundary values for p95 latency, throughput, and error rate
    Then p95 response time is less than or equal to <p95_ms> ms
    And throughput is greater than or equal to <rps> requests per second
    And error rate is less than or equal to <error_rate_percent> percent

    Examples:
      | p95_ms | rps | error_rate_percent |
      | 500 | 5000 | 0.5 |

  @@regression @@edge
  Scenario Outline: Scaling from N to 2N instances keeps latency increase within 10 percent
    # Edge case verifying latency impact when doubling instances under identical load
    Given the system is running with N instances at 10,000 concurrent users
    When the system is scaled to 2N instances under the same load and p95 latency is re-measured
    Then the p95 latency increase is less than or equal to <max_increase_percent> percent

    Examples:
      | max_increase_percent |
      | 10 |

  @@regression @@negative
  Scenario Outline: Failure when performance targets are exceeded
    # Error scenario where latency, throughput, or error rate violates targets
    Given the system is under peak load at 10,000 concurrent users
    When the test harness records metrics that exceed acceptable targets
    Then the run is marked as failed due to p95 latency greater than <p95_ms> ms
    And or throughput less than <rps> requests per second
    And or error rate greater than <error_rate_percent> percent

    Examples:
      | p95_ms | rps | error_rate_percent |
      | 501 | 4999 | 0.6 |
