@@smoke @@regression
Feature: Verify RPO/RTO targets documentation, approval, and DR validation
  As a DevOps Engineer
  I want to Verify that defined RPO and RTO targets for catastrophic failure are documented, approved, and validated through disaster recovery testing.
  So that Ensures the organization can meet business continuity objectives and minimize data loss and downtime after catastrophic events.

  Background:
    Given the disaster recovery policy repository and approval records are accessible

  @@smoke @@regression @@happy-path
  Scenario: RPO and RTO targets are documented and approved by primary and secondary stakeholders
    # Validates policy documentation and approvals for both RPO and RTO
    Given the system is under review of disaster recovery policy and approval records
    When measuring RPO target definition
    Then the RPO is documented and approved by primary and secondary stakeholders
    And the RTO is documented and approved by primary and secondary stakeholders

  @@regression @@happy-path
  Scenario Outline: DR simulation meets documented RPO and RTO targets
    # Validates achieved RPO and RTO do not exceed documented targets during full DR simulation
    Given a full disaster recovery simulation is completed with measured data loss and restore time
    When comparing achieved RPO and RTO to the documented targets
    Then achieved values are less than or equal to documented targets

    Examples:
      | documented_rpo_minutes | achieved_rpo_minutes | documented_rto_minutes | achieved_rto_minutes |
      | 60 | 45 | 120 | 90 |

  @@regression @@edge @@boundary
  Scenario Outline: Boundary condition where achieved RPO and RTO equal documented targets
    # Ensures equality is accepted for RPO and RTO achievement
    Given a full disaster recovery simulation is completed with measured data loss and restore time
    When comparing achieved RPO and RTO to the documented targets
    Then achieved RPO equals documented RPO
    And achieved RTO equals documented RTO

    Examples:
      | documented_rpo_minutes | achieved_rpo_minutes | documented_rto_minutes | achieved_rto_minutes |
      | 30 | 30 | 60 | 60 |

  @@regression @@negative @@error
  Scenario Outline: Error when RPO is documented but missing secondary stakeholder approval
    # Fails when approval records are incomplete
    Given the system is under review of disaster recovery policy and approval records
    When measuring RPO target definition with missing secondary approval
    Then the RPO target definition does not meet approval requirements

    Examples:
      | primary_approval | secondary_approval |
      | present | missing |

  @@regression @@negative @@error
  Scenario Outline: Error when achieved RPO or RTO exceeds documented targets in DR test
    # Fails when DR test outcomes exceed documented RPO or RTO
    Given a full disaster recovery simulation is completed with measured data loss and restore time
    When comparing achieved RPO and RTO to the documented targets
    Then the DR test does not meet the RPO or RTO targets

    Examples:
      | documented_rpo_minutes | achieved_rpo_minutes | documented_rto_minutes | achieved_rto_minutes |
      | 30 | 45 | 60 | 70 |
