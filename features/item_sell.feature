Feature: Sell An Item
  As a Seller
  In order to sell an item today, nearby
  I want to post the item on site

  Scenario: Post an item with current location
    Given I have entered item name, categories, 
    And I add my current location
    And I logged in via Facebook
    When I press submit
    Then the item should be posted and available for lookup