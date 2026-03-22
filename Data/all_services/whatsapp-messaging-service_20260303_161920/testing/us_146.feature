@smoke @regression
Feature: Verify transport and at-rest encryption across production systems
  As a Security Team
  I want to Verify that all data in transit and at rest is encrypted using modern standards across production systems
  So that Ensures confidentiality and compliance by preventing data exposure during transmission or storage

  Background:
    Given production inventory and configuration baselines are available for endpoints, services, and storage

  @happy-path @smoke @regression
  Scenario: Validate transport encryption meets TLS 1.2+ with strong ciphers
    # Happy path verification for transport encryption across external and internal endpoints
    Given automated TLS scanners are configured for all external and internal endpoints
    When the system measures transport protocol and cipher suites for each endpoint
    Then all endpoints report TLS 1.2 or higher
    And all endpoints negotiate strong ciphers such as AES-256-GCM or ChaCha20-Poly1305

  @happy-path @regression
  Scenario: At-rest encryption coverage reaches 100% across storage types
    # Happy path verification for full at-rest encryption coverage
    Given audit reports are available for databases, object storage, and block storage volumes
    When the system measures at-rest encryption coverage
    Then all databases, object storage, and block storage volumes are encrypted with AES-256 or equivalent
    And no unencrypted production storage resources are detected

  @happy-path @regression
  Scenario: Centralized key management with rotation within 12 months
    # Happy path verification for key management, rotation, and access controls
    Given KMS/HSM policies, rotation schedules, and access logs are available
    When the system measures key management, rotation cadence, and access controls
    Then keys are managed centrally by KMS or HSM
    And key rotation is scheduled at least every 12 months with enforced access controls

  @negative @regression
  Scenario: Detect endpoints using deprecated TLS protocols or weak ciphers
    # Error scenario for transport encryption non-compliance
    Given an endpoint inventory includes services with legacy configurations
    When the system measures transport protocol and cipher suites for each endpoint
    Then endpoints using TLS 1.1 or lower are flagged as non-compliant
    And endpoints negotiating weak ciphers are reported with remediation guidance

  @negative @regression
  Scenario: Identify unencrypted at-rest resources during audits
    # Error scenario for at-rest encryption gaps
    Given audit reports include newly provisioned storage resources
    When the system measures at-rest encryption coverage
    Then any unencrypted database, object storage, or block storage volume is flagged
    And the report indicates failure to meet 100% coverage target

  @negative @regression
  Scenario: Key rotation overdue beyond 12 months
    # Boundary condition for key rotation schedule
    Given KMS/HSM rotation schedule records include last-rotation timestamps
    When the system evaluates key rotation intervals
    Then keys last rotated more than 12 months ago are marked non-compliant
    And rotation exceptions are reported with owners and required actions

  @regression
  Scenario: Transport encryption compliance by endpoint category
    # Edge case validation by endpoint type with mixed configurations
    Given endpoint categories include external, internal, and service-mesh endpoints
    When the system measures protocol and cipher compliance per category
    Then each category meets TLS 1.2+ and strong cipher requirements
    And any category-level deviation is reported separately

  @regression
  Scenario: At-rest encryption algorithm boundary acceptance
    # Boundary condition for accepted algorithms at rest
    Given audit reports list storage encryption algorithms
    When the system validates algorithms against the policy baseline
    Then AES-256 is accepted as compliant and AES-128 is rejected
    And equivalent-strength algorithms are marked compliant

  @regression
  Scenario Outline: Transport encryption compliance by protocol and cipher
    # Data-driven validation of protocol and cipher combinations
    Given a set of endpoints with varying protocol and cipher configurations
    When the system measures transport protocol and cipher suites
    Then the endpoint compliance result matches the expected outcome

    Examples:
      | protocol | cipher | expected_result |
      | TLS 1.2 | AES-256-GCM | compliant |
      | TLS 1.3 | ChaCha20-Poly1305 | compliant |
      | TLS 1.1 | AES-256-GCM | non-compliant |
      | TLS 1.2 | RC4 | non-compliant |

  @regression
  Scenario Outline: At-rest encryption compliance by storage type
    # Data-driven validation of encryption coverage by storage type
    Given storage audit entries include encryption status and algorithm
    When the system evaluates at-rest encryption for each storage item
    Then each storage item is marked compliant based on encryption status and algorithm

    Examples:
      | storage_type | encrypted | algorithm | expected_result |
      | database | true | AES-256 | compliant |
      | object_storage | true | AES-256 | compliant |
      | block_storage | false | none | non-compliant |

  @regression
  Scenario Outline: Key management compliance by rotation interval
    # Data-driven validation of key rotation intervals and control enforcement
    Given KMS/HSM key records include last rotation date and access control status
    When the system checks rotation interval and access control enforcement
    Then the key record compliance result matches the expected outcome

    Examples:
      | rotation_months | access_controls | expected_result |
      | 12 | enforced | compliant |
      | 13 | enforced | non-compliant |
      | 6 | not_enforced | non-compliant |
