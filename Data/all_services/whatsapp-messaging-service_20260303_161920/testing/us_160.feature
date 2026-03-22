@smoke @regression
Feature: Verify user storage limits
  As a QA Engineer
  I want to Verify per-user storage limits are enforced and exceedance is prevented across all storage operations
  So that Ensures fair resource allocation, protects system stability, and meets contractual storage policies

  Background:
    Given a test user exists with a configured per-user storage quota

  @@smoke @@regression @@happy-path
  Scenario Outline: Upload within quota succeeds via each client
    # Happy path to ensure uploads within limit are accepted across all supported APIs/clients
    Given the user has <used_bytes> bytes already stored out of a <quota_bytes> byte quota
    When the user uploads <upload_bytes> bytes using the <client_api> client
    Then the upload is accepted with a success response
    And the total stored bytes equals <expected_total_bytes> and is within the quota

    Examples:
      | used_bytes | quota_bytes | upload_bytes | client_api | expected_total_bytes |
      | 0 | 1048576 | 262144 | REST | 262144 |
      | 524288 | 1048576 | 262144 | SDK | 786432 |
      | 900000 | 1048576 | 100000 | CLI | 1000000 |

  @@regression @@boundary
  Scenario Outline: Upload reaching exact quota boundary succeeds
    # Boundary condition where upload brings total to exactly the quota limit
    Given the user has <used_bytes> bytes already stored out of a <quota_bytes> byte quota
    When the user uploads <upload_bytes> bytes using the <client_api> client
    Then the upload is accepted with a success response
    And the total stored bytes equals the quota and does not exceed it

    Examples:
      | used_bytes | quota_bytes | upload_bytes | client_api |
      | 1048575 | 1048576 | 1 | REST |
      | 999 | 1000 | 1 | SDK |

  @@regression @@negative @@error
  Scenario Outline: Upload beyond quota is rejected with quota exceeded
    # Error scenario ensuring system rejects uploads once limit is exceeded
    Given the user has <used_bytes> bytes already stored out of a <quota_bytes> byte quota
    When the user attempts to upload <upload_bytes> bytes using the <client_api> client
    Then the upload is rejected with error code <error_code> and message <error_message>
    And the total stored bytes remains <used_bytes> and does not increase

    Examples:
      | used_bytes | quota_bytes | upload_bytes | client_api | error_code | error_message |
      | 1048576 | 1048576 | 1 | REST | QUOTA_EXCEEDED | User storage quota exceeded |
      | 900000 | 1000000 | 200000 | SDK | QUOTA_EXCEEDED | User storage quota exceeded |

  @@regression @@edge @@negative
  Scenario Outline: Consistent quota enforcement across all clients at limit
    # Edge case to verify enforcement is consistent across all supported clients
    Given the user has reached the quota limit of <quota_bytes> bytes
    When the user attempts to create or upload data using the <client_api> client
    Then the operation is rejected with error code <error_code> and message <error_message>
    And quota enforcement is identical for the <client_api> client

    Examples:
      | quota_bytes | client_api | error_code | error_message |
      | 1048576 | REST | QUOTA_EXCEEDED | User storage quota exceeded |
      | 1048576 | SDK | QUOTA_EXCEEDED | User storage quota exceeded |
      | 1048576 | CLI | QUOTA_EXCEEDED | User storage quota exceeded |
