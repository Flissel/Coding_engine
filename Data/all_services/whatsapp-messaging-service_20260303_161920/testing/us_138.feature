@smoke @regression
Feature: Enterprise/Admin Analytics and Audit Logs
  As a system administrator
  I want to view system-level analytics and audit logs for message throughput and compliance events
  So that ensure reliable performance, detect issues early, and meet compliance requirements

  Background:
    Given the analytics and audit logging services are available

  @@smoke @@regression @@happy-path
  Scenario: View analytics dashboard for a valid time range
    # Valid admin views throughput, delivery rates, and system health for a selected period
    Given the administrator has valid admin permissions
    When they open the analytics dashboard and select a time range
    Then the system displays throughput metrics, delivery rates, and system health indicators for that period
    And no stale data is displayed from outside the selected time range

  @@regression @@happy-path
  Scenario: Filter audit logs by user, event type, and date range
    # Valid admin filters audit logs and receives matching entries with required fields
    Given audit logging is enabled and events exist
    When the administrator filters audit logs by user, event type, and date range
    Then the system returns matching log entries with timestamps, actor, action, and outcome
    And the returned entries match the selected filters

  @@regression @@edge
  Scenario: Analytics empty state for no data in selected range
    # Empty state is shown when no analytics data exists for the range
    Given the administrator has valid admin permissions
    And no analytics data exists for the selected time range
    When they request analytics for that time range
    Then the system shows an empty state message
    And the system does not display incorrect or stale data

  @@regression @@edge
  Scenario: Audit logs empty state for no matching events
    # Empty state is shown when no logs match the selected filters
    Given audit logging is enabled
    And no audit events match the selected filters
    When the administrator requests audit logs with those filters
    Then the system shows an empty state message
    And the system does not display incorrect or stale data

  @@negative @@regression
  Scenario: Access denied for insufficient permissions
    # User without admin permissions is blocked from analytics and audit logs
    Given the user does not have sufficient permissions
    When they request the analytics dashboard or audit logs
    Then the system denies access
    And an authorization error is displayed

  @@regression @@boundary
  Scenario Outline: Analytics time range boundary conditions
    # Validate analytics behavior at boundary time ranges
    Given the administrator has valid admin permissions
    When they select a time range from <start> to <end>
    Then the system displays metrics for that exact period only

    Examples:
      | start | end |
      | 2024-01-01T00:00:00Z | 2024-01-01T00:00:00Z |
      | 2024-01-01T00:00:00Z | 2024-01-31T23:59:59Z |

  @@regression @@boundary
  Scenario Outline: Audit log filter boundary conditions
    # Validate audit log filtering at boundary timestamps and multiple filter values
    Given audit logging is enabled and events exist at boundary timestamps
    When the administrator filters logs for user <user>, event type <event_type>, from <start> to <end>
    Then the system returns entries within the inclusive boundary range
    And each entry includes timestamp, actor, action, and outcome

    Examples:
      | user | event_type | start | end |
      | alice.admin | LOGIN | 2024-02-01T00:00:00Z | 2024-02-01T00:00:00Z |
      | bob.admin | CONFIG_CHANGE | 2024-02-01T00:00:00Z | 2024-02-29T23:59:59Z |
