@@smoke @@regression
Feature: Third-Party Integrations and Bots - Webhook Registration
  As a technical integration engineer
  I want to register and configure webhook endpoints for third-party bot integrations via the API
  So that enable automated and reliable message processing while maintaining secure external connectivity

  Background:
    Given the API endpoint for webhook registration is available
    And the integration engineer has a valid API key with integration permissions

  @@smoke @@happy-path
  Scenario: Register webhook successfully and receive test delivery
    # Valid registration creates a webhook and triggers a test delivery
    Given a valid webhook URL and supported event types are prepared
    When the engineer submits a webhook registration request
    Then the API creates the webhook
    And a test event delivery is sent to the webhook endpoint successfully

  @@regression @@happy-path
  Scenario Outline: Register webhook with multiple event types using scenario outline
    # Data-driven validation for supported event type combinations
    Given a valid webhook URL "<webhook_url>"
    And event types "<event_types>" are supported by the API
    When the engineer registers the webhook
    Then the webhook is created with event types "<event_types>"
    And the test event delivery succeeds

    Examples:
      | webhook_url | event_types |
      | https://bot.example.com/webhooks/messages | message.created,message.updated |
      | https://bot.example.com/webhooks/alerts | alert.raised |

  @@negative @@regression
  Scenario Outline: Reject invalid webhook URL format
    # Invalid URL formats are rejected with validation errors
    Given an invalid webhook URL "<webhook_url>"
    And supported event types "<event_types>"
    When the engineer attempts to register the webhook
    Then the API responds with a validation error
    And no webhook is created

    Examples:
      | webhook_url | event_types |
      | htp:/invalid-url | message.created |
      | www.example.com/no-scheme | alert.raised |

  @@negative @@regression
  Scenario: Rate limit exceeded on webhook registration
    # Excess requests return rate limit error with retry-after
    Given the integration has reached the allowed rate limit
    When the engineer submits another webhook registration request
    Then the API responds with a rate limit error
    And the response includes retry-after information

  @@regression @@edge
  Scenario Outline: Boundary condition for maximum allowed event types
    # Registration with the maximum number of event types is accepted
    Given a valid webhook URL "<webhook_url>"
    And the request includes the maximum allowed number of event types "<event_types>"
    When the engineer registers the webhook
    Then the API creates the webhook
    And a test event delivery is sent successfully

    Examples:
      | webhook_url | event_types |
      | https://bot.example.com/webhooks/max-events | event1,event2,event3,event4,event5 |
