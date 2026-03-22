@smoke @regression
Feature: Typing Indicators and Presence
  As a registered customer
  I want to view online status and typing indicators for chat participants and control my visibility settings
  So that communicate more efficiently while protecting my privacy

  Background:
    Given a one-to-one chat exists between User A and User B
    And both users are authenticated and have chat open

  @@smoke @@regression @@happy-path
  Scenario: Display typing indicator in real time when both users enable indicators
    # Validates real-time typing indicator appears and clears on send or stop
    Given User A and User B have presence and typing indicators enabled
    When User B starts typing a message
    Then User A sees a typing indicator for User B in real time
    And the typing indicator disappears when User B sends the message or stops typing

  @@regression @@negative @@edge
  Scenario Outline: Privacy settings hide presence and typing indicators
    # Validates invisible status or typing disabled hides presence and typing indicators
    Given User B sets their visibility to <visibility_setting>
    And User B sets typing indicators to <typing_setting>
    When User A views the chat with User B
    Then User B appears offline to User A
    And no typing indicator is shown for User B

    Examples:
      | visibility_setting | typing_setting |
      | invisible | enabled |
      | online | disabled |
      | invisible | disabled |

  @@regression @@negative @@error
  Scenario Outline: Chat remains usable when presence updates fail
    # Validates resilience when presence or typing updates cannot be retrieved
    Given presence or typing indicator updates cannot be retrieved due to a <error_type>
    When the system attempts to fetch presence and typing updates
    Then the chat remains usable for sending and receiving messages
    And no stale or incorrect indicators are displayed

    Examples:
      | error_type |
      | network timeout |
      | service unavailable |

  @@regression @@boundary
  Scenario Outline: Typing indicator clears when typing stops within boundary timeout
    # Validates boundary condition for typing stop timeout
    Given User A and User B have presence and typing indicators enabled
    When User B stops typing for <idle_seconds> seconds without sending a message
    Then User A no longer sees the typing indicator

    Examples:
      | idle_seconds |
      | 3 |
      | 5 |
