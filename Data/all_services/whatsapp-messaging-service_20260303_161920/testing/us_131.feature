@smoke @regression
Feature: Search and Chat History Management
  As a end user
  I want to search across chats and messages with filters for media and contacts
  So that to quickly find relevant information while maintaining fast performance and ease of use

  Background:
    Given the user is authenticated and has access to chat history

  @@smoke @@regression @@happy-path
  Scenario: Search returns matching chats and messages with highlights
    # Validates full-text search returns matching results and highlights keyword
    Given the user has multiple chats containing messages with the keyword "invoice"
    When the user performs a full-text search for "invoice"
    Then matching chats and messages are returned
    And each result highlights the keyword "invoice"

  @@regression @@happy-path
  Scenario: Search with media type and contact filters
    # Ensures filters restrict results to matching keyword and selected filters
    Given the user has messages with keyword "contract" across multiple contacts and media types
    When the user searches for "contract" with media type filter "image" and contact filter "Alex Kim"
    Then results include only messages that match "contract", media type "image", and contact "Alex Kim"
    And no messages outside the selected filters are shown

  @@regression @@edge
  Scenario: No matching results shows empty state
    # Verifies empty state behavior when no results match
    Given the user has no messages matching the keyword "unicorn"
    When the user performs a full-text search for "unicorn"
    Then an empty state is displayed with a clear message
    And no errors are shown

  @@regression @@boundary
  Scenario Outline: Search supports keyword length boundaries
    # Validates behavior for minimum and maximum keyword lengths
    Given the user has messages containing the keywords listed in the examples
    When the user searches using the keyword "<keyword>"
    Then search results are returned for valid keywords
    And keyword highlighting is applied to each match

    Examples:
      | keyword |
      | a |
      | supercalifragilisticexpialidocious |

  @@regression @@negative @@error
  Scenario: Search service unavailable shows error state
    # Ensures user-friendly error handling when the search backend fails
    Given the search service is unavailable
    When the user performs a search for "invoice"
    Then an error message is displayed indicating the search failed
    And the application remains responsive without crashing
