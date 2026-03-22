@smoke @regression
Feature: Media and File Attachments
  As a end user
  I want to send and receive media and file attachments with previews within the chat
  So that to share information quickly and reliably while ensuring a smooth and secure communication experience

  Background:
    Given the sender and recipient are in an active chat
    And the network connection is stable

  @smoke @regression @happy-path
  Scenario Outline: Send supported attachment within size limit with preview
    # Valid supported file types are delivered successfully with previews for both users
    Given the sender selects a supported file type within the size limit
    When the sender uploads and sends the attachment
    Then the attachment is delivered to the recipient
    And a preview is shown to both sender and recipient

    Examples:
      | file_type | file_size_mb |
      | jpg | 2 |
      | pdf | 5 |

  @regression @boundary
  Scenario Outline: Boundary size limit accepted
    # A file exactly at the size limit is accepted and previewed
    Given the sender selects a supported file type at the size limit
    When the sender uploads and sends the attachment
    Then the attachment is delivered successfully
    And a preview is shown to both sender and recipient

    Examples:
      | file_type | file_size_mb |
      | png | 10 |

  @regression @negative @error
  Scenario Outline: Reject file that exceeds size limit
    # Files above the maximum size are blocked with a clear error message
    Given the sender selects a supported file type exceeding the size limit
    When the sender attempts to upload the attachment
    Then the system blocks the upload
    And a size limit error message is displayed

    Examples:
      | file_type | file_size_mb |
      | mp4 | 11 |

  @regression @negative @error
  Scenario Outline: Reject unsupported file type
    # Unsupported formats are rejected with a supported formats message
    Given the sender selects an unsupported file type
    When the sender attempts to upload the attachment
    Then the system rejects the file
    And the supported formats are displayed to the sender

    Examples:
      | file_type |
      | exe |
      | bat |
