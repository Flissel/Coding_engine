@smoke @regression
Feature: Message Delivery and Read Receipts
  As a messaging user
  I want to view sent, delivered, and read receipts for each recipient in a group chat
  So that so I can confirm reliable message delivery while preserving clear communication status

  Background:
    Given the messaging service is available

  @@smoke @@regression @@happy-path
  Scenario: One-to-one message updates from sent to delivered to read
    # Validates ordered status transitions in a direct chat
    Given I am in a one-to-one chat with recipient A
    When I send a message
    Then the message status shows sent
    And the status updates to delivered when the system processes it
    And the status updates to read when recipient A opens the message

  @@regression @@happy-path
  Scenario: Per-recipient status shown in group chat
    # Shows delivered and read states per recipient in a group chat
    Given I am in a group chat with recipients A, B, and C
    When I send a message and recipients have mixed delivery and read outcomes
    Then I can view per-recipient delivery and read status for the message
    And each recipient status reflects their actual delivery or read state

  @@regression @@negative @@error
  Scenario: Temporary delivery failure does not show read receipt
    # Prevents read receipts when delivery fails
    Given I am in a one-to-one chat with recipient A
    When delivery to recipient A fails due to a temporary error
    Then the message shows failed or pending status
    And no read receipt is displayed

  @@regression @@edge
  Scenario Outline: Group chat status matrix for mixed outcomes
    # Edge case validation for mixed states across multiple recipients
    Given I am in a group chat with recipients <recipients>
    When I send a message and outcomes are <outcomes>
    Then the message displays per-recipient statuses <expected_statuses>

    Examples:
      | recipients | outcomes | expected_statuses |
      | A, B, C | A delivered, B read, C pending | A delivered, B read, C pending |
      | A, B, C, D | A read, B delivered, C delivered, D failed | A read, B delivered, C delivered, D failed |

  @@regression @@boundary
  Scenario Outline: Boundary condition for maximum group size
    # Validates status rendering at maximum supported group size
    Given I am in a group chat with <group_size> recipients
    When I send a message
    Then per-recipient delivery and read statuses are displayed for all recipients

    Examples:
      | group_size |
      | 50 |
