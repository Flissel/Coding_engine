@smoke @regression
Feature: Device interoperability verification across major OS versions
  As a QA Engineer
  I want to verify multi-device functionality across major OS versions
  So that ensure consistent user experience and prevent device-specific failures in supported environments

  Background:
    Given the device lab is configured with iOS, Android, Windows, and macOS major versions from the published compatibility matrix

  @happy-path @@smoke @@regression
  Scenario Outline: Achieve required functional pass rate across all major OS versions
    # Validates that critical and high-priority test cases meet or exceed the target pass rate per OS
    Given automated and manual test suites are executed for each major OS version
    When the functional test pass rate is calculated for critical and high-priority test cases
    Then the pass rate is at least 95% for each major OS version
    And the results are recorded per OS version for audit

    Examples:
      | os_version | pass_rate |
      | iOS 17 | 97% |
      | Android 14 | 96% |
      | Windows 11 | 98% |
      | macOS 14 | 95% |

  @edge-case @@regression
  Scenario Outline: Boundary: Pass rate equals minimum threshold
    # Ensures the system accepts the exact minimum pass rate of 95% per OS version
    Given test execution is complete for each major OS version
    When the pass rate for critical and high-priority test cases is computed
    Then a pass rate of exactly 95% is treated as meeting the target
    And no compliance alerts are raised for the OS version

    Examples:
      | os_version | pass_rate |
      | iOS 16 | 95% |
      | Android 13 | 95% |

  @error @@negative @@regression
  Scenario Outline: Fail when pass rate is below target
    # Validates error handling when a major OS version does not meet the 95% threshold
    Given automated and manual test suites are executed for a major OS version
    When the functional test pass rate is below 95%
    Then the verification result is marked as failed for that OS version
    And a remediation action is required before release

    Examples:
      | os_version | pass_rate |
      | Windows 10 | 94% |

  @happy-path @@regression
  Scenario Outline: Complete device coverage against compatibility matrix
    # Ensures 100% coverage of major OS versions and top 5 devices per OS by usage
    Given the test plan is mapped to the published compatibility matrix
    When executed devices and OS versions are recorded
    Then coverage includes all major OS versions
    And coverage includes the top 5 devices per OS by usage

    Examples:
      | os_family | devices_covered | major_versions_covered |
      | iOS | 5 | all |
      | Android | 5 | all |

  @error @@negative @@regression
  Scenario Outline: Error when device coverage is incomplete
    # Validates failure when any major OS version or top 5 devices are missing from execution
    Given the compatibility matrix is published for the release
    When executed device coverage is less than required
    Then the coverage result is marked as non-compliant
    And the missing OS versions or devices are reported

    Examples:
      | os_family | devices_covered | major_versions_covered |
      | Android | 4 | all |
      | macOS | 5 | missing one |

  @boundary @@regression
  Scenario Outline: Boundary: Cross-device defect rate at maximum allowed
    # Ensures that up to 2 critical device-specific defects per release is acceptable
    Given device/OS-specific defects are tracked in the issue tracker during the verification cycle
    When the count of critical device-specific defects is measured
    Then a count of 2 or fewer is considered within target
    And the release is not blocked by defect rate

    Examples:
      | critical_defects |
      | 2 |

  @error @@negative @@regression
  Scenario Outline: Fail when cross-device defect rate exceeds target
    # Validates error handling when critical device-specific defects exceed 2 per release
    Given device/OS-specific defects are tracked in the issue tracker during the verification cycle
    When the count of critical device-specific defects exceeds 2
    Then the verification result is marked as failed
    And release approval is blocked until defects are addressed

    Examples:
      | critical_defects |
      | 3 |
