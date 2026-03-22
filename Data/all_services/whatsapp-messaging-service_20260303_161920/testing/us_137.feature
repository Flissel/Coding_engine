@smoke @regression
Feature: Voice and Video Calling
  As a primary user
  I want to start a one-to-one or group voice/video call and control mute, camera, and speaker during the call
  So that to communicate reliably and intuitively across platforms with good call quality and privacy

  Background:
    Given the user is authenticated and on the call screen

  @@smoke @@regression @@happy-path
  Scenario Outline: Start a call and control mute, camera, and speaker
    # Validates successful call connection and availability of controls for one-to-one and group calls
    Given the user has granted microphone and camera permissions
    And the user is connected to the internet
    When the user initiates a <call_type> call with <participant_count> available participants
    Then the call connects successfully
    And the user can see and use mute, camera on/off, and speaker controls

    Examples:
      | call_type | participant_count |
      | voice | 1 |
      | video | 1 |
      | voice | 3 |
      | video | 4 |

  @@regression @@edge-case
  Scenario Outline: Adapt quality under degraded network conditions
    # Ensures quality adaptation and indicator display when bandwidth drops during an active call
    Given an active <call_type> call is in progress
    And the user is connected to the internet with <initial_bandwidth> bandwidth
    When network bandwidth degrades to <degraded_bandwidth>
    Then the system adapts audio or video quality to maintain continuity
    And a call quality indicator is shown to the user

    Examples:
      | call_type | initial_bandwidth | degraded_bandwidth |
      | voice | 1 Mbps | 256 Kbps |
      | video | 2 Mbps | 512 Kbps |

  @@regression @@negative @@error
  Scenario Outline: Prevent call start when participant is unavailable
    # Validates clear error handling when participants are unavailable
    Given the user has granted microphone and camera permissions
    And the user is connected to the internet
    When the user initiates a <call_type> call with <participant_count> participants and at least one is unavailable
    Then the system displays a clear error message
    And the call does not start

    Examples:
      | call_type | participant_count |
      | voice | 1 |
      | video | 3 |

  @@regression @@negative @@boundary
  Scenario Outline: Block call when permissions are denied
    # Ensures call cannot start without required permissions and shows error
    Given microphone permission is <mic_permission> and camera permission is <cam_permission>
    And the user is connected to the internet
    When the user initiates a <call_type> call with available participants
    Then the system displays a clear error message about permissions
    And the call does not start

    Examples:
      | call_type | mic_permission | cam_permission |
      | voice | denied | granted |
      | video | granted | denied |
      | video | denied | denied |
