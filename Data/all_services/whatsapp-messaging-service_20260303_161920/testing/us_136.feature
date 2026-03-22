@@smoke @@regression
Feature: Payments and P2P Transfers
  As a registered user
  I want to send and receive secure in-app P2P payments and view transaction history
  So that to transfer money quickly with confidence and keep an auditable record of all transactions

  Background:
    Given the user is registered, verified, and logged into the app
    And the user has a valid payment method on file

  @@smoke @@regression @@happy-path
  Scenario: Successful P2P payment completes and appears in history
    # Valid payment between two registered users completes successfully
    Given the sender has an available balance of 100.00
    And the recipient is a registered user
    When the sender sends 25.00 to the recipient
    Then the payment is completed
    And both users receive a confirmation message
    And the transaction appears in both users' history with status Completed

  @@regression @@negative
  Scenario: Compliance verification required blocks payment
    # Payment is blocked when compliance flow requires extra verification
    Given the payment triggers compliance checks
    When the compliance flow requires additional verification
    Then the app prompts for the required information
    And the payment remains blocked until verification is completed
    And no transaction is recorded in history

  @@regression @@negative
  Scenario: Payment rejected when amount exceeds available balance
    # Insufficient balance causes rejection with no history record
    Given the sender has an available balance of 20.00
    When the sender attempts to send 25.00
    Then the payment is rejected with a clear error message
    And no transaction is recorded

  @@regression @@happy-path
  Scenario: Transaction history displays all required fields
    # History screen lists transactions with status, amount, counterparty, and timestamp
    Given the user has completed and failed transactions in history
    When the user opens the transaction history screen
    Then each transaction shows status, amount, counterparty, and timestamp
    And failed transactions are clearly marked

  @@regression @@boundary
  Scenario Outline: Boundary: Send amount equal to available balance
    # Exact balance transfer should succeed
    Given the sender has an available balance of <balance>
    And the recipient is a registered user
    When the sender sends <amount>
    Then the payment is completed
    And the transaction appears in both users' history with status Completed

    Examples:
      | balance | amount |
      | 50.00 | 50.00 |
      | 10.00 | 10.00 |

  @@regression @@edge @@negative
  Scenario Outline: Edge: Minimum transfer amount enforced
    # System validates the minimum allowed transfer amount
    Given the sender has an available balance of 100.00
    And the minimum transfer amount is <min_amount>
    When the sender attempts to send <amount>
    Then the payment is rejected with a clear error message
    And no transaction is recorded

    Examples:
      | min_amount | amount |
      | 1.00 | 0.99 |
      | 1.00 | 0.00 |
