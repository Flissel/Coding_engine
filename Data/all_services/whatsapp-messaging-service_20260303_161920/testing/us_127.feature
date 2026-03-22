@@smoke @@regression
Feature: End-to-End Encryption and Key Management
  As a registered user
  I want to send and receive messages and media with end-to-end encryption enabled
  So that ensure privacy and secure communication across platforms

  Background:
    Given a registered user with an active device is authenticated
    And the user has a valid encryption key pair stored securely

  @@smoke @@regression @@happy-path
  Scenario: Send encrypted message to another registered user
    # Verifies end-to-end encryption for text messages in the happy path
    Given another registered recipient is available and has a valid key pair
    When the sender sends a text message to the recipient
    Then the message content is encrypted end-to-end in transit
    And only the recipient can decrypt and read the message

  @@regression @@happy-path
  Scenario: Send encrypted media across platforms
    # Verifies end-to-end encryption for media on different platforms
    Given the sender uses platform A and the recipient uses platform B
    When the sender sends a media file to the recipient
    Then the media is encrypted end-to-end during delivery
    And only the recipient can decrypt and view the media

  @@regression @@edge
  Scenario: Key rotation occurs without interrupting delivery
    # Ensures message delivery continues while keys are rotated
    Given the user's encryption keys are due for rotation
    When the system initiates key rotation
    Then new keys are generated and stored securely
    And message delivery continues without interruption

  @@negative @@regression @@error
  Scenario: Block decryption for unverified or mismatched sender key
    # Prevents decryption and displays a warning when sender key is unverified or mismatched
    Given a message is received from a sender with an unverified or mismatched key
    When the recipient attempts to open the message
    Then the system blocks decryption
    And a verification warning is displayed to the recipient

  @@regression @@edge
  Scenario Outline: Scenario Outline: Encrypt and decrypt multiple content types
    # Validates encryption and decryption for different content types
    Given a sender and recipient are registered with valid key pairs
    When the sender sends <content_type> content to the recipient
    Then the <content_type> content is encrypted end-to-end
    And only the recipient can decrypt the <content_type> content

    Examples:
      | content_type |
      | text |
      | image |
      | video |

  @@regression @@boundary
  Scenario Outline: Scenario Outline: Key rotation at boundary times
    # Verifies key rotation behavior at boundary conditions
    Given the user's key rotation is scheduled at <rotation_time>
    When the system processes rotation at <rotation_time>
    Then new keys are generated and stored securely
    And messages sent before and after <rotation_time> are delivered and decryptable

    Examples:
      | rotation_time |
      | exact expiration time |
      | one second after expiration |

  @@negative @@regression @@error
  Scenario Outline: Scenario Outline: Reject decryption with corrupted key material
    # Ensures decryption fails when key material is corrupted
    Given the recipient's key material is <corruption_state>
    When the recipient attempts to decrypt an incoming message
    Then the system blocks decryption
    And an error is logged and a warning is displayed

    Examples:
      | corruption_state |
      | missing |
      | tampered |
