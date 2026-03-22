@@smoke @@regression
Feature: Authentication hardening verification
  As a Security Team
  I want to verify authentication controls and audit logging meet hardening standards
  So that ensures strong protection against unauthorized access and provides traceable audit evidence

  Background:
    Given the authentication policy and audit logging configuration are accessible for review

  @@happy-path @@regression @@smoke
  Scenario: MFA enforcement meets targets for privileged and standard accounts
    # Validates MFA enforcement rates meet required thresholds
    Given privileged and standard user accounts are configured with MFA
    When I measure the MFA enforcement rate across recent login events
    Then privileged account logins show 100% MFA enforcement
    And standard account logins show at least 95% MFA enforcement

  @@boundary @@regression
  Scenario: Account lockout triggers after 5 failures within 10 minutes
    # Validates lockout behavior at the required boundary
    Given a standard user account is active and not locked
    When I submit 5 consecutive failed login attempts within 10 minutes
    Then the account is locked immediately after the 5th failed attempt
    And subsequent login attempts are rejected due to lockout

  @@edge @@regression
  Scenario: Account does not lock for 4 failures within 10 minutes
    # Validates edge case below the lockout threshold
    Given a standard user account is active and not locked
    When I submit 4 consecutive failed login attempts within 10 minutes
    Then the account remains unlocked
    And a subsequent valid login is allowed

  @@happy-path @@regression
  Scenario: Authentication audit logs include required fields for all event types
    # Verifies audit log completeness for login, logout, failure, and password change events
    Given test events for login, logout, failure, and password change are executed
    When I inspect the corresponding audit log entries
    Then each event is logged with user, timestamp, source IP, and outcome
    And no event type is missing from the audit logs

  @@boundary @@regression
  Scenario: Audit log retention meets minimum duration and tamper-evident storage
    # Validates retention period and tamper-evident storage configuration
    Given audit log storage configuration and retention settings are available
    When I verify the configured retention period and storage mode
    Then retention is configured for at least 365 days
    And storage is tamper-evident

  @@negative @@regression
  Scenario: MFA enforcement below threshold is flagged
    # Validates error handling when enforcement rates do not meet targets
    Given MFA enforcement metrics are collected for privileged and standard users
    When the privileged MFA rate is 99% or the standard MFA rate is below 95%
    Then the control is reported as non-compliant
    And a remediation action is required

  @@edge @@regression
  Scenario: Lockout does not trigger when failures are outside 10-minute window
    # Validates boundary condition for time window enforcement
    Given a standard user account is active and not locked
    When I submit 5 failed login attempts spread over more than 10 minutes
    Then the account remains unlocked
    And a valid login succeeds

  @@negative @@regression
  Scenario: Missing audit log fields are flagged as non-compliant
    # Validates error scenario when audit log entries are incomplete
    Given authentication events have been executed
    When I find an audit log entry missing user, timestamp, source IP, or outcome
    Then the audit logging control is reported as non-compliant
    And the missing field is recorded for remediation

  @@regression @@data-driven
  Scenario Outline: Data-driven MFA enforcement rate validation
    # Validates enforcement rate thresholds using multiple data sets
    Given MFA enforcement metrics are available for the evaluated period
    When I evaluate privileged MFA rate <privileged_rate> and standard MFA rate <standard_rate>
    Then the compliance result is <expected_result>
    And the evaluation is recorded with the measured rates

    Examples:
      | privileged_rate | standard_rate | expected_result |
      | 100% | 97% | compliant |
      | 99% | 97% | non-compliant |
      | 100% | 94% | non-compliant |

  @@regression @@boundary @@data-driven
  Scenario Outline: Data-driven lockout boundary validation
    # Validates lockout behavior using multiple failure counts and windows
    Given a standard user account is active and not locked
    When I submit <failure_count> failed login attempts within <window_minutes> minutes
    Then the lockout status is <expected_status>
    And the outcome is recorded in audit logs

    Examples:
      | failure_count | window_minutes | expected_status |
      | 5 | 10 | locked |
      | 4 | 10 | not locked |
      | 5 | 11 | not locked |
