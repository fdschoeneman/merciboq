Feature: Edit User
  In order do change my user information
  As a registered user of the website
  I want to edit my user profile

  Background:
    Given I am a user named "foo" with an email "user@test.com" and password "please"
    And I am confirmed
    And I sign in as "user@test.com/please"

  Scenario: I sign in and edit my account
    When I follow "Edit account"
    And I fill in the following:
      | Name              | baz     |
      | Current password  | please  |
    And I press "Update"
    Then I go to the homepage
    And I should see "User: baz"

