@@smoke @@regression
Feature: Service uptime SLA verification
  As a DevOps Engineer
  I want to verify service uptime meets SLA targets for messaging, authentication, and group services
  So that ensure high availability and compliance with business continuity expectations

  Background:
    Given monitoring data and incident logs are available for the selected calendar month

  @@smoke @@regression @@happy-path
  Scenario Outline: Monthly uptime meets SLA for all services
    # Validates monthly uptime is at or above 99.9% for each service
    Given the system is analyzing monitoring data for the calendar month
    When monthly uptime is calculated for the <service>
    Then the uptime result is >= 99.9%
    And the calculated uptime is stored in the SLA report

    Examples:
      | service |
      | messaging service |
      | authentication service |
      | group service |

  @@regression @@boundary
  Scenario Outline: Uptime at SLA boundary
    # Ensures 99.9% uptime exactly is accepted as compliant
    Given the system is analyzing monitoring data for the calendar month
    When monthly uptime is calculated for the <service> with value 99.9%
    Then the uptime result is marked as compliant

    Examples:
      | service |
      | messaging service |
      | authentication service |
      | group service |

  @@regression @@negative @@edge
  Scenario Outline: Uptime slightly below SLA target
    # Validates a failure when uptime is below 99.9%
    Given the system is analyzing monitoring data for the calendar month
    When monthly uptime is calculated for the <service> with value 99.89%
    Then the uptime result is marked as non-compliant
    And an SLA breach is recorded for the service

    Examples:
      | service |
      | messaging service |
      | authentication service |
      | group service |

  @@regression @@happy-path
  Scenario: MTTR meets SLA target
    # Validates mean time to recover for critical incidents is <= 60 minutes
    Given incident response records are available for the period
    When MTTR is calculated for critical incidents
    Then the MTTR result is <= 60 minutes

  @@regression @@negative @@edge
  Scenario: MTTR exceeds SLA target
    # Validates a failure when MTTR is above 60 minutes
    Given incident response records are available for the period
    When MTTR is calculated for critical incidents with value 60.1 minutes
    Then the MTTR result is marked as non-compliant
    And an MTTR breach is recorded in the SLA report

  @@regression @@negative @@error
  Scenario: Missing monitoring data for month
    # Handles error when monitoring data is incomplete or unavailable
    Given monitoring data for the calendar month is missing or incomplete
    When monthly uptime is requested for the messaging service
    Then the system returns a data availability error
    And no SLA compliance status is generated
