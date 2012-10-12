Feature: Confirm Interest
  As a Seller
  In order to complete a transaction
  I want to confirm purchase

  Scenario: Confirm Purchase
    Given I posted an item
    And A Buyer submit interest to the item
    When I press confirm
    Then the buyer should get notified
    And the item status updated to "Confirmed"