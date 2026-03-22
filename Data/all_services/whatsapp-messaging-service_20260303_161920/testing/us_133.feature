@@smoke @@regression
Feature: Account Recovery and Number Change
  As a registered user
  I want to recover my account and change my registered phone number after device loss
  So that so that I can securely regain access and continue using the service without losing message delivery

  Background:
    Given the user has an existing registered account with a phone number

  @@smoke @@regression @@happy-path
  Scenario: Successful account recovery via recovery channel
    # Valid recovery verification restores access
    Given the user has lost their device but can access the recovery channel
    When the user completes the recovery verification steps with valid data
    Then the account is restored and access is granted
    And the user can access their account without the lost device

  @@regression @@happy-path
  Scenario: Change registered number after authentication
    # Ownership verification updates the number and routes future messages
    Given the user is authenticated and requests a number change
    When the user verifies ownership of the new number
    Then the account is updated to the new number
    And future messages are routed to the new number

  @@regression @@negative
  Scenario: Reject recovery with invalid or expired verification data
    # Invalid or expired recovery data is rejected with prompt to retry
    Given the user has lost their device and is attempting recovery
    When the user submits invalid or expired recovery verification data
    Then the recovery is rejected
    And the user is prompted to retry with valid verification

  @@regression @@negative
  Scenario Outline: Recovery verification boundary attempts
    # Boundary condition for maximum verification attempts
    Given the user is on the recovery verification step
    When the user submits recovery verification data for the <attempt> time
    Then the system responds with <outcome>
    And the user sees <message>

    Examples:
      | attempt | outcome | message |
      | 1st | an error indicating invalid verification data | a prompt to retry |
      | 3rd | a lockout or cooldown response | a message indicating too many attempts |

  @@regression @@negative
  Scenario Outline: Number change with boundary length and format
    # Valid boundary formats are accepted and invalid formats are rejected
    Given the user is authenticated and requests a number change
    When the user submits a new number in <format> format
    Then the system responds with <result>
    And the user sees <message>

    Examples:
      | format | result | message |
      | valid E.164 minimum length | a verification challenge is sent to the new number | a confirmation that verification is required |
      | invalid too-short | a validation error | a message indicating the number format is invalid |
