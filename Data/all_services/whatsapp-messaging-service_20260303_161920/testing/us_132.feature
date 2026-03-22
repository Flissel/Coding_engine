@@smoke @@regression
Feature: Backup, Restore, and Cross-Device Sync
  As a registered user
  I want to backup and restore my chats to the cloud and keep them synced across my devices
  So that so that I can recover data quickly and have a consistent messaging experience on any platform

  Background:
    Given I am logged in with a registered account

  @@smoke @@happy-path
  Scenario: Scheduled backup saves latest messages and settings
    # Validates successful scheduled backup stores latest data for restore
    Given cloud backup is enabled
    And I have new messages and updated settings since the last backup
    When the scheduled backup runs successfully
    Then the latest messages and settings are saved to the cloud
    And the backup is available for restore on any of my devices

  @@regression @@happy-path
  Scenario: Restore on new device from most recent backup
    # Validates cross-device restore synchronizes state
    Given a most recent backup exists in the cloud
    And I install the app on a new device
    When I sign in with the same account and choose to restore from the most recent backup
    Then my chat history, media, and settings are restored
    And the device state matches my other devices

  @@negative @@regression
  Scenario Outline: Backup fails while offline or storage unavailable
    # Ensures clear error messaging and retry behavior on failure
    Given cloud backup is enabled
    And a backup attempt is initiated
    When the backup fails due to <failure_reason>
    Then I receive a clear error message indicating <failure_reason>
    And the system retries or allows me to retry without data loss

    Examples:
      | failure_reason |
      | offline network |
      | cloud storage unavailable |

  @@negative @@regression
  Scenario: Restore when no backup exists
    # Validates graceful handling of restore with no available backups
    Given no backups exist for my account
    When I choose to restore from the most recent backup
    Then I am informed that no backup is available
    And no local data is overwritten

  @@regression @@boundary
  Scenario Outline: Boundary: Large backup with many messages and media
    # Ensures backup and restore complete for large datasets within limits
    Given cloud backup is enabled
    And my chat history contains <message_count> messages and <media_count> media items
    When a backup and restore cycle completes successfully
    Then all messages and media are preserved without loss
    And restored settings match the source device

    Examples:
      | message_count | media_count |
      | 5000 | 2000 |
      | 10000 | 5000 |
