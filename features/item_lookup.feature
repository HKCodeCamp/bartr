Feature: Look for Interesting Item
  As a potential Buyer
  In order to buy item
  I want to look for interesting items

  Scenario: Look up item nearby via List
    Given I have an location
    When I open the app
    Then it shows any items nearby as a list

  Scenario: Look up item nearby via Map
    Given I have an location
    When I open the app
    And Select Map View
    Then it shows a map centered on my current location with items nearby