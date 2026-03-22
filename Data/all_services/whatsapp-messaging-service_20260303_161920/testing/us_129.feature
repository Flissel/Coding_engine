@@smoke @@regression
Feature: Push Notifications and Notification Controls
  As a end user
  I want to configure and receive push notifications for new messages with per-chat and per-type controls
  So that so that I stay informed without being overwhelmed and can protect my privacy

  Background:
    Given the user is logged in on a device capable of receiving push notifications

  @@smoke @@regression @@happy-path
  Scenario Outline: Receive push notification with configured content preview
    # Validates prompt delivery and content preview level for enabled chat notifications
    Given device-level push notifications are enabled and permission is granted
    And chat notifications are enabled for chat "General"
    And content preview level is set to "<preview_level>"
    When a new message arrives in chat "General"
    Then a push notification is delivered promptly
    And the notification content matches the "<preview_level>" setting

    Examples:
      | preview_level |
      | full |
      | sender-only |
      | none |

  @@regression @@happy-path
  Scenario: Disable notifications for a specific chat
    # Ensures per-chat disable prevents notifications without impacting other chats
    Given device-level push notifications are enabled and permission is granted
    And chat notifications are enabled for chat "Project A" and chat "Project B"
    When the user disables notifications for chat "Project A"
    Then no push notification is sent for new messages in chat "Project A"
    And push notifications are still sent for new messages in chat "Project B"

  @@regression @@edge-case
  Scenario Outline: Block push notifications for globally disabled message types
    # Verifies global type controls suppress notifications for disabled types
    Given device-level push notifications are enabled and permission is granted
    And global notification type "<message_type>" is set to off
    And chat notifications are enabled for chat "Support"
    When a "<message_type>" message is received in chat "Support"
    Then no push notification is sent for the "<message_type>" message

    Examples:
      | message_type |
      | mentions |
      | direct-messages |

  @@regression @@negative @@error
  Scenario: Attempt to enable notifications when permission is denied
    # Validates error handling and guidance when device permissions block notifications
    Given device-level push notifications are blocked or permission is denied
    When the user attempts to enable notifications in the app
    Then the app shows an error or guidance to enable permissions
    And the app does not mark notifications as enabled

  @@regression @@boundary
  Scenario: Boundary: rapid toggle of per-chat notifications
    # Ensures final toggle state controls delivery after quick changes
    Given device-level push notifications are enabled and permission is granted
    And chat notifications are enabled for chat "Ops"
    When the user toggles chat "Ops" notifications off and then on within 2 seconds
    Then the final state for chat "Ops" notifications is enabled
    And a new message in chat "Ops" triggers a push notification

  @@regression @@negative @@boundary
  Scenario: Boundary: message arrives while app attempts to enable notifications without permission
    # Ensures no notification is delivered before permissions are granted
    Given device-level push notifications are blocked or permission is denied
    And the user is viewing notification settings for chat "Security"
    When a new message arrives in chat "Security"
    Then no push notification is delivered
    And the app continues to show notifications as disabled
