@smoke @regression
Feature: User Blocking, Reporting, and Moderation Tools
  As a support moderator
  I want to review reported users and apply moderation actions such as blocking or dismissing the report
  So that to prevent abuse and maintain a safe, compliant communication platform

  Background:
    Given the moderator is authenticated and on the moderation queue page

  @happy-path @smoke @regression
  Scenario: Block reported user with sufficient evidence
    # Valid report is blocked and resolved
    Given a report exists in the moderation queue with required evidence for user "u123"
    When the moderator selects "Block user" and confirms the action
    Then the reported user "u123" is blocked and cannot send messages
    And the report status is updated to "Resolved - Blocked"

  @happy-path @regression
  Scenario: Dismiss report with insufficient evidence
    # Report is dismissed and reporter is notified with reason
    Given a report exists in the moderation queue with insufficient evidence for user "u456"
    When the moderator selects "Dismiss report" and provides reason "Insufficient evidence"
    Then the report status is updated to "Resolved - Dismissed"
    And the reporter is notified with reason "Insufficient evidence"

  @negative @regression
  Scenario: Attempt to block a non-existent user
    # System shows error and report remains pending
    Given a report exists in the moderation queue for user "u999" whose account no longer exists
    When the moderator selects "Block user" and submits the action
    Then an error message is shown indicating the user is unavailable
    And the report status remains "Pending"

  @edge @negative @regression
  Scenario Outline: Scenario Outline: Dismiss report requires a non-empty reason
    # Validate boundary conditions for dismissal reason
    Given a report exists in the moderation queue with insufficient evidence for user "u777"
    When the moderator selects "Dismiss report" and provides reason "<reason>"
    Then the system response is "<response>"
    And the report status is "<status>"

    Examples:
      | reason | response | status |
      | Insufficient evidence | dismissal accepted | Resolved - Dismissed |
      |  | validation error shown for missing reason | Pending |
      |   | validation error shown for missing reason | Pending |
      | A | dismissal accepted | Resolved - Dismissed |

  @edge @regression
  Scenario Outline: Scenario Outline: Blocking a user updates messaging permission
    # Ensure blocked user cannot send messages after action
    Given a report exists in the moderation queue with required evidence for user "<user_id>"
    When the moderator selects "Block user" and confirms the action
    Then the user "<user_id>" is blocked
    And message send attempt result is "<message_result>"

    Examples:
      | user_id | message_result |
      | u201 | rejected due to block |
      | u202 | rejected due to block |
