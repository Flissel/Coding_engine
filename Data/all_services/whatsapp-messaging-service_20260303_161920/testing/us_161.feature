@smoke @regression
Feature: Verify message and media size limits
  As a QA Engineer
  I want to Verify that the system enforces message and media size limits under normal and boundary conditions
  So that Ensures performance and stability by preventing oversized payloads from degrading the system

  Background:
    Given message and media size limits are configured in the system
    And a valid authenticated client is available

  @happy-path @smoke @regression
  Scenario Outline: Accept message payloads at or below the configured limit
    # Validates successful message submission for payload sizes at and below the limit
    Given a message payload of size <payload_size>
    When the client sends the message
    Then the response status code is 2xx
    And the server logs indicate the payload was accepted

    Examples:
      | payload_size |
      | limit - 1 byte |
      | limit |

  @negative @regression
  Scenario Outline: Reject message payloads above the configured limit
    # Validates error handling for oversized message payloads
    Given a message payload of size <payload_size>
    When the client sends the message
    Then the response status code is <error_code>
    And the error message matches the documented oversized payload message

    Examples:
      | payload_size | error_code |
      | limit + 1 byte | 413 |
      | limit + 1 KB | 413 |

  @happy-path @regression
  Scenario Outline: Accept media uploads at or below the configured limit
    # Validates successful media upload for payload sizes at and below the limit
    Given a media file of size <media_size>
    When the client uploads the media file
    Then the response status code is 2xx
    And the media file is stored successfully

    Examples:
      | media_size |
      | limit - 1 byte |
      | limit |

  @negative @regression
  Scenario Outline: Reject media uploads above the configured limit gracefully
    # Validates error handling and storage behavior for oversized media uploads
    Given a media file of size <media_size>
    When the client uploads the media file
    Then the response status code is <error_code>
    And no media file is persisted in storage

    Examples:
      | media_size | error_code |
      | limit + 1 byte | 413 |
      | limit + 1 MB | 413 |

  @edge-case @regression
  Scenario Outline: Response time meets SLA at maximum allowed sizes
    # Validates response time under boundary payload sizes for messages and media
    Given a <payload_type> payload of size limit
    When the client submits the payload and measures response time
    Then the response time is within the agreed SLA
    And the response status code is 2xx

    Examples:
      | payload_type |
      | message |
      | media |

  @negative @regression
  Scenario Outline: System health remains stable after repeated oversized attempts
    # Validates consistent rejection and no service degradation under repeated oversized payloads
    Given a series of <attempts> oversized payload submissions
    When the client submits oversized payloads in sequence
    Then each response returns the documented error code and message
    And system health metrics remain within normal thresholds

    Examples:
      | attempts |
      | 5 |
      | 20 |
