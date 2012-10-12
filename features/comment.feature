Feature: Interaction Between Buyer and Seller
  As a Buyer and Seller
  In order to complete a transaction
  I want to interact with each other

  Scenario: Post comment on item
    Given I found an item
    And I enter a comment
    And I logged in via Facebook
    When I press submit
    Then the comment should be added to system