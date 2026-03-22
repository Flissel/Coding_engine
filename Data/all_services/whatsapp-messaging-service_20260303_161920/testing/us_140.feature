@@smoke @@regression
Feature: Verify Message Send Latency
  As a QA Performance Engineer
  I want to validate message send and delivery acknowledgement latency under normal load
  So that ensures user messaging experience meets strict latency targets and SLA commitments

  Background:
    Given the performance test environment is configured with normal load profile and synchronized clocks

  @@smoke @@regression @@happy-path
  Scenario: P95 latency meets targets under normal load (happy path)
    # Validates P95 send and delivery acknowledgement latency within SLA at normal load
    Given the system is running a normal load test with steady state traffic
    When P95 send latency and P95 delivery acknowledgement latency are computed from end-to-end traces
    Then P95 send latency is less than or equal to 200 ms
    And P95 delivery acknowledgement latency is less than or equal to 500 ms

  @@regression @@boundary
  Scenario: P99 latency meets targets under normal load (boundary conditions)
    # Validates P99 send and delivery acknowledgement latency at boundary thresholds
    Given the system is collecting latency distribution during a normal load test
    When P99 send latency and P99 delivery acknowledgement latency are computed
    Then P99 send latency is less than or equal to 400 ms
    And P99 delivery acknowledgement latency is less than or equal to 800 ms

  @@regression @@edge
  Scenario Outline: Latency measurements at threshold values (edge case outline)
    # Ensures pass/fail behavior exactly at SLA thresholds
    Given the system is running a normal load test with controlled latency injection
    When the computed percentile latency for <metric> equals <value_ms> ms
    Then the <metric> result is accepted as within SLA

    Examples:
      | metric | value_ms |
      | P95 send latency | 200 |
      | P95 delivery acknowledgement latency | 500 |
      | P99 send latency | 400 |
      | P99 delivery acknowledgement latency | 800 |

  @@regression @@negative
  Scenario Outline: Latency targets violated under normal load (error scenario outline)
    # Detects SLA breach when percentiles exceed targets
    Given the system is running a normal load test with performance degradation
    When the computed percentile latency for <metric> is <value_ms> ms
    Then the <metric> result is flagged as SLA breach

    Examples:
      | metric | value_ms |
      | P95 send latency | 201 |
      | P95 delivery acknowledgement latency | 501 |
      | P99 send latency | 401 |
      | P99 delivery acknowledgement latency | 801 |
