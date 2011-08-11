Feature: Edit User
  In order do change my user information
  As a registered user of the website
  I want to edit my user profile

  Background:
    Given I am registered and logged in as "foo fighter" with an email "user@test.com" and password "please"

  Scenario: I change my name
    When I follow "Settings"
    And I fill in the following:
      | Name              | baz     |
      | Current password  | please  |
    And I press "Update"
    Then I go to the homepage
    And I should see "User: baz"

