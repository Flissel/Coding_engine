@smoke @regression
Feature: Siri/Google Assistant Messaging and Queries
  As a Endnutzer
  I want to Nachrichten und Abfragen per Siri oder Google Assistant ausführen
  So that die Plattform schnell, intuitiv und plattformuebergreifend nutzen, ohne die App zu oeffnen

  Background:
    Given the user is authenticated in the platform account

  @@smoke @@regression @@happy-path
  Scenario: Send message via voice assistant successfully
    # Valid voice command sends a message and receives confirmation
    Given the voice assistant integration is enabled and permissions are granted
    When the user issues a valid voice command to send a message to a recipient
    Then the message is sent successfully
    And the assistant confirms the delivery to the user

  @@regression @@happy-path
  Scenario: Query message delivery status via voice assistant
    # User asks for delivery status and receives timely current status
    Given the voice assistant integration is enabled
    When the user asks for the delivery status of a previously sent message
    Then the assistant returns the current delivery status within an acceptable response time

  @@regression @@edge @@boundary
  Scenario Outline: Send message with boundary length via voice assistant
    # Boundary test for minimum and maximum message length
    Given the voice assistant integration is enabled and permissions are granted
    When the user issues a valid voice command with a message length of <message_length> characters
    Then the system handles the message according to length validation rules
    And the assistant provides a clear confirmation or rejection reason

    Examples:
      | message_length |
      | 1 |
      | 500 |

  @@negative @@regression @@error
  Scenario: Handle invalid or unrecognized voice command
    # System returns clear error and offers retry guidance
    Given the voice assistant integration is enabled
    When the user issues an invalid or unrecognized voice command
    Then the system responds with a clear error message
    And the assistant offers to repeat the command

  @@negative @@regression @@error
  Scenario: Attempt action when integration is disabled
    # System prompts to enable integration when disabled
    Given the voice assistant integration is disabled
    When the user attempts to send a message via voice assistant
    Then the system responds with a clear error message
    And the assistant offers to activate the integration

  @@negative @@edge @@regression
  Scenario: Query delivery status for unknown message ID
    # Edge case where the message cannot be found
    Given the voice assistant integration is enabled
    When the user asks for the delivery status of a non-existent message identifier
    Then the assistant informs the user that the message cannot be found
    And the assistant suggests checking the message details or trying again

  @@regression @@boundary
  Scenario Outline: Response time boundary for status query
    # Boundary condition for acceptable response time
    Given the voice assistant integration is enabled
    When the user asks for the delivery status of a message
    Then the assistant responds within <max_response_time_seconds> seconds

    Examples:
      | max_response_time_seconds |
      | 2 |
      | 5 |
