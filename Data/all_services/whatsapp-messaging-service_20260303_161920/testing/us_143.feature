@smoke @regression
Feature: US-143 Data Growth Scalability
  As a QA Engineer
  I want to Validate storage and indexing scalability under increasing message and media volumes without performance degradation
  So that Ensures the system can handle data growth while maintaining consistent performance and reliability

  Background:
    Given a baseline dataset and baseline performance metrics are available
    And the load test environment is provisioned with monitoring enabled

  @@smoke @@regression @@happy-path
  Scenario Outline: Happy path: P95 indexing latency and query response meet targets at 10x data volume
    # Validates indexing and query performance under 10x baseline data growth meets acceptance targets
    Given synthetic data growth to 10x baseline volume is loaded
    When indexing latency and query response times are measured for benchmark queries
    Then P95 indexing latency increase is <= 20% versus baseline
    And P95 query response time is <= 1.2x baseline

    Examples:
      | dataset_scale | indexing_latency_target | query_response_target |
      | 10x | <=20% | <=1.2x |

  @@regression @@boundary
  Scenario Outline: Boundary: storage growth remains linear within ±10% at incremental loads
    # Validates storage utilization grows linearly at boundary thresholds of expected growth
    Given incremental data loads are applied at <dataset_scale> of baseline
    When storage utilization is measured against the expected linear growth model
    Then storage utilization is within <tolerance> of expected growth

    Examples:
      | dataset_scale | tolerance |
      | 5x | ±10% |
      | 10x | ±10% |
      | 12x | ±10% |

  @@regression @@edge-case
  Scenario Outline: Edge case: sustained ingestion throughput at high volume remains >= 90% baseline
    # Validates ingestion throughput under continuous loading at scaled volumes stays within threshold
    Given continuous data loading runs at <dataset_scale> baseline volume
    When ingestion throughput is measured over a sustained window
    Then sustained ingestion throughput is >= <throughput_threshold> of baseline

    Examples:
      | dataset_scale | throughput_threshold |
      | 10x | 90% |
      | 15x | 90% |

  @@regression @@negative
  Scenario Outline: Error scenario: performance targets are violated due to indexing bottleneck
    # Validates system reports failure when indexing latency exceeds target thresholds
    Given synthetic data growth to 10x baseline volume is loaded with an induced indexing bottleneck
    When indexing latency is measured for the dataset
    Then P95 indexing latency increase is > 20% versus baseline
    And the performance test run is marked as failed with a bottleneck alert

    Examples:
      | dataset_scale | fault |
      | 10x | indexing_bottleneck |
