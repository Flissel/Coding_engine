@@smoke @@regression
Feature: Verify Metrics and Alerting
  As a DevOps Engineer
  I want to verify that key service metrics and alerting enable rapid incident detection
  So that ensures operational issues are detected quickly to minimize impact and downtime

  Background:
    Given the monitoring system and alerting rules are configured for all defined critical services

  @@smoke @@regression @@happy-path
  Scenario Outline: Alert is generated within target time for a critical incident
    # Validates alert creation time meets the 2-minute target under controlled fault
    Given a controlled fault is triggered on a critical service to breach a critical threshold
    When the time from threshold breach to alert creation is measured
    Then the alert is created within 2 minutes
    And the alert is classified as critical for the affected service

    Examples:
      | service | threshold | max_time_minutes |
      | checkout-api | error_rate > 5% | 2 |
      | payments-api | latency_p95 > 2s | 2 |

  @@regression @@happy-path
  Scenario Outline: All critical services emit required key metrics
    # Validates 100% metric coverage for critical services
    Given the list of defined critical services is available
    When metric ingestion is audited for each critical service
    Then CPU, memory, latency, error rate, and availability metrics are present for all critical services

    Examples:
      | service | metrics |
      | checkout-api | cpu,memory,latency,error_rate,availability |
      | inventory-api | cpu,memory,latency,error_rate,availability |

  @@regression @@happy-path
  Scenario Outline: False positive rate remains below threshold over 30 days
    # Validates alert accuracy against incident tickets and alert history
    Given alert history and incident tickets for the last 30 days are available
    When alerts are correlated with incident tickets
    Then the false positive rate is below 5%

    Examples:
      | period_days | false_positive_rate_percent |
      | 30 | 4.2 |

  @@regression @@boundary
  Scenario Outline: Alert creation time at boundary condition of 2 minutes
    # Validates boundary timing exactly at the target threshold
    Given a controlled fault is triggered at the exact critical threshold
    When the alert creation time is measured
    Then the alert is created exactly at 2 minutes and is considered compliant

    Examples:
      | service | threshold | alert_time_minutes |
      | user-auth | availability < 99.9% | 2 |

  @@regression @@edge
  Scenario Outline: Metric ingestion delay causes missing metric for one service
    # Validates edge case where ingestion lag causes temporary metric gaps
    Given metric ingestion latency spikes for a single critical service
    When metric coverage is measured during the ingestion delay
    Then the coverage check reports missing metrics for that service
    And the overall coverage result is marked as non-compliant

    Examples:
      | service | missing_metric |
      | search-api | latency |

  @@regression @@negative @@error
  Scenario Outline: Alert is not generated within target time
    # Validates error scenario when alert creation exceeds target
    Given a controlled fault breaches a critical threshold
    When the alert creation time is measured
    Then the alert creation time exceeds 2 minutes
    And the result is flagged as a failure

    Examples:
      | service | threshold | alert_time_minutes |
      | orders-api | cpu > 90% | 3 |

  @@regression @@negative @@error
  Scenario Outline: False positive rate exceeds 5 percent
    # Validates error scenario when alert accuracy target is not met
    Given alert history and incident tickets for the last 30 days are available
    When alerts are correlated with incident tickets
    Then the false positive rate is 5 percent or higher
    And the alert accuracy check fails

    Examples:
      | period_days | false_positive_rate_percent |
      | 30 | 5.0 |
