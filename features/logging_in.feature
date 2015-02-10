Feature: Logging in with Workshare credentials
  As a Workshare user
  When I use File Weight Watchers
  I should be able to see the the weight and gravity of my files

  Scenario: Logging in
    Given I am on the homepage
    When I login
    Then I should be on the data page
    And I should see "You are logged in"

  Scenario: Seeing the data of my files
    Given I am on the data page
    Then I should see the weight of my files

