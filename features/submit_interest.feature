Feature: Submit Interest
  As a Buyer or Seller
  In order to complete a transaction
  I want to submit interest to buyer

  Scenario: Submit Interest
    Given I found an item
    And I logged in via Facebook
    When I enter my location
    And I enter my available time for transaction
    And I press Submit
    Then the seller should get notified of my interest