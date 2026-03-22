@@smoke @@regression
Feature: US-141 Verify Media Upload Throughput
  As a Performance QA Engineer
  I want to Validate media upload throughput and completion times under expected and peak load
  So that Ensures users experience reliable and predictable upload performance

  Background:
    Given a controlled performance test environment with network instrumentation enabled

  @@smoke @@regression @@happy-path
  Scenario Outline: Meet throughput targets under expected and peak load
    # Validates average per-client upload throughput for voice and media files meets targets
    Given representative voice and media files are prepared for upload
    When run load tests at <load_level> and measure average throughput per client
    Then the average upload throughput is at least <min_mbps> Mbps
    And network instrumentation confirms stable client-side transfer rates

    Examples:
      | load_level | min_mbps |
      | expected | 2.5 |
      | peak | 1.5 |

  @@regression @@happy-path
  Scenario: 95th percentile completion time meets expected load target
    # Validates 95th percentile completion time for 10 MB file under expected load
    Given timed uploads are executed at expected load
    When measure the 95th percentile completion time for a 10 MB file
    Then the 95th percentile completion time is at most 20 seconds
    And all timing data is captured consistently across clients

  @@regression @@edge @@boundary
  Scenario Outline: 99th percentile completion time boundary at peak load
    # Validates 99th percentile completion time boundary for 10 MB file under peak load
    Given stress tests run with concurrent uploads at peak load
    When measure the 99th percentile completion time for a 10 MB file
    Then the 99th percentile completion time is at most <max_seconds> seconds
    And completion time distribution shows no outliers above the boundary

    Examples:
      | max_seconds |
      | 35 |

  @@regression @@negative @@error
  Scenario: Upload success rate failure under sustained load
    # Negative scenario validating failure when success rate drops below target
    Given a 1-hour sustained concurrency test is executed
    When calculate the upload success rate from total attempts and failures
    Then the success rate is below 99.5%
    And the test is marked as failed due to reliability threshold breach
