@smoke @regression
Feature: Message delivery reliability under intermittent network conditions
  As a QA Engineer
  I want to verify reliable message delivery under intermittent network conditions
  So that ensures users receive messages consistently despite network instability

  Background:
    Given a controlled test environment with network drop and recovery simulation is available
    And message sender and receiver logs are enabled with synchronized timestamps

  @happy-path @smoke @regression
  Scenario: Successful delivery rate meets target after network restoration
    # Validates that the delivery success rate is at or above the target during intermittent connectivity
    Given the network is configured to drop for 30 seconds and recover
    And 10,000 messages are queued during the drop window
    When delivery outcomes are measured within 5 minutes after network restoration
    Then the delivery success rate is at least 99.5%
    And all delivery timestamps are within the 5 minute window

  @edge @regression
  Scenario: Edge case: minimal intermittent drop with small batch still meets delivery target
    # Validates delivery success rate for a small batch during brief drops
    Given the network is configured to drop for 5 seconds and recover
    And 100 messages are queued during the drop window
    When delivery outcomes are measured within 5 minutes after network restoration
    Then the delivery success rate is at least 99.5%
    And no message delivery exceeds the 5 minute recovery window

  @boundary @regression
  Scenario: Boundary condition: delivery rate at exactly 99.5%
    # Confirms acceptance when delivery success rate is exactly at the threshold
    Given the network is configured to drop for 30 seconds and recover
    And 10,000 messages are queued during the drop window
    When delivery outcomes show 9,950 delivered within 5 minutes after restoration
    Then the delivery success rate meets the 99.5% target

  @happy-path @regression
  Scenario: Message loss rate within acceptable threshold
    # Validates that message loss rate is at or below the target across 10,000 messages
    Given intermittent network drops occur during message transmission
    And a fixed set of 10,000 messages is sent
    When sender and receiver logs are reconciled
    Then the message loss rate is at most 0.1%

  @boundary @regression
  Scenario: Boundary condition: loss rate at exactly 0.1%
    # Confirms acceptance when loss rate is exactly at the threshold
    Given a fixed set of 10,000 messages is sent during intermittent connectivity
    When log reconciliation shows 10 messages missing
    Then the message loss rate meets the 0.1% target

  @happy-path @regression
  Scenario: Duplicate message rate within acceptable threshold
    # Validates that duplicate messages are within the allowed rate
    Given intermittent network disruptions occur during message delivery
    When receiver logs are analyzed for duplicate message IDs
    Then the duplicate message rate is at most 0.05%

  @boundary @regression
  Scenario: Boundary condition: duplicate rate at exactly 0.05%
    # Confirms acceptance when duplicate rate is exactly at the threshold
    Given 10,000 messages are delivered after a network disruption
    When receiver logs show 5 duplicate message IDs
    Then the duplicate message rate meets the 0.05% target

  @negative @regression
  Scenario: Error scenario: delivery success rate below target
    # Validates failure behavior when delivery success rate is below 99.5%
    Given the network is configured to drop for 30 seconds and recover
    And 10,000 messages are queued during the drop window
    When delivery outcomes show 9,900 delivered within 5 minutes after restoration
    Then the delivery success rate fails the 99.5% target

  @negative @regression
  Scenario: Error scenario: loss rate above target
    # Validates failure behavior when message loss exceeds 0.1%
    Given a fixed set of 10,000 messages is sent during intermittent connectivity
    When log reconciliation shows 25 messages missing
    Then the message loss rate fails the 0.1% target

  @negative @regression
  Scenario: Error scenario: duplicate rate above target
    # Validates failure behavior when duplicate messages exceed 0.05%
    Given 10,000 messages are delivered after a network disruption
    When receiver logs show 12 duplicate message IDs
    Then the duplicate message rate fails the 0.05% target

  @regression
  Scenario Outline: Scenario Outline: Delivery success rate under varying drop durations
    # Data-driven validation of delivery success rate across multiple drop durations
    Given the network is configured to drop for <drop_duration_seconds> seconds and recover
    And 10,000 messages are queued during the drop window
    When delivery outcomes are measured within 5 minutes after network restoration
    Then the delivery success rate is at least <expected_success_rate>%

    Examples:
      | drop_duration_seconds | expected_success_rate |
      | 10 | 99.5 |
      | 60 | 99.5 |
      | 120 | 99.5 |

  @regression
  Scenario Outline: Scenario Outline: Loss and duplicate rates across batch sizes
    # Data-driven validation of loss and duplicate rates across different batch sizes
    Given intermittent network drops occur during message transmission
    And <batch_size> messages are sent
    When sender and receiver logs are reconciled and duplicate IDs are counted
    Then the loss rate is at most <max_loss_rate>%
    And the duplicate rate is at most <max_duplicate_rate>%

    Examples:
      | batch_size | max_loss_rate | max_duplicate_rate |
      | 1000 | 0.1 | 0.05 |
      | 10000 | 0.1 | 0.05 |
