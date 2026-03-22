@@smoke @@regression
Feature: Verify Centralized Logging
  As a DevOps Engineer
  I want to verify that all services emit structured logs to the centralized logging pipeline
  So that ensures consistent troubleshooting and efficient root cause analysis across services

  Background:
    Given the centralized logging pipeline is available and all services are deployed

  @@smoke @@regression @@happy-path
  Scenario Outline: All services emit structured logs with required fields
    # Validates 100% of services emit JSON logs with required fields
    Given audit log samples are collected from each service
    When the samples are validated for required fields: timestamp, level, service, correlation_id, message in JSON format
    Then the percentage of services emitting structured logs is 100%
    And all samples conform to valid JSON syntax

    Examples:
      | total_services | services_with_valid_logs |
      | 15 | 15 |

  @@regression @@happy-path
  Scenario Outline: Log ingestion success rate meets target over 24 hours
    # Compares emitted vs ingested log count across services to meet the target threshold
    Given each service has emitted logs over the last 24 hours
    When the emitted log count per service is compared with ingested log count
    Then the log ingestion success rate is greater than or equal to 99.9%
    And all services are included in the comparison

    Examples:
      | emitted_logs | ingested_logs |
      | 1000000 | 999500 |

  @@smoke @@regression @@happy-path
  Scenario Outline: Correlation ID search retrieves log within SLA
    # Verifies search retrieval time meets the <= 30 seconds target
    Given a known correlation_id exists in the centralized logging platform
    When a search query is executed using the correlation_id
    Then the log entry is retrieved within 30 seconds
    And the retrieved entry matches the requested correlation_id

    Examples:
      | correlation_id | retrieval_time_seconds |
      | abc-123 | 25 |

  @@regression @@boundary
  Scenario Outline: Boundary: ingestion success rate at exact threshold
    # Validates acceptance when ingestion success rate equals 99.9%
    Given emitted and ingested log counts are collected for the last 24 hours
    When the ingestion success rate is calculated
    Then the result equals 99.9% and passes the target
    And the calculation uses the same service set for emitted and ingested logs

    Examples:
      | emitted_logs | ingested_logs |
      | 1000000 | 999000 |

  @@regression @@edge
  Scenario Outline: Edge case: single service emits logs with all required fields
    # Ensures validation logic works with minimal service count
    Given audit log samples are collected from a single service
    When the sample is validated for required fields in JSON format
    Then the percentage of services emitting structured logs is 100%
    And the sample includes timestamp, level, service, correlation_id, and message

    Examples:
      | total_services | services_with_valid_logs |
      | 1 | 1 |

  @@regression @@negative
  Scenario Outline: Error: service emits log missing required field
    # Detects non-compliant log structure
    Given audit log samples include a service emitting JSON logs missing the correlation_id field
    When the samples are validated for required fields
    Then the percentage of services emitting structured logs is less than 100%
    And the validation report flags the missing field

    Examples:
      | total_services | services_with_valid_logs |
      | 10 | 9 |

  @@regression @@negative
  Scenario Outline: Error: correlation ID search exceeds SLA
    # Fails when retrieval time is greater than 30 seconds
    Given a known correlation_id exists in the centralized logging platform
    When a search query is executed using the correlation_id
    Then the retrieval time is greater than 30 seconds and the SLA is not met
    And the monitoring alert is raised for slow retrieval

    Examples:
      | correlation_id | retrieval_time_seconds |
      | slow-456 | 45 |
