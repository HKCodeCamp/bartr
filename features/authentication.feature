Feature: Authentication
  As a Buyer or Seller
  In order to interact with others
  I want to login to Bartr

  Scenario: Sign Up
    Given I have no Bartr account
    And I enter username, email, password and password confirmation
    When I click Sign Up
    Then Bartr create my account

  Scenario: Sign In
    Given I have an Bartr account
    And I enter email and password
    When I click Sign In
    Then Bartr login my account