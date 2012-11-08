Feature: Edit settings
  In order to reflect my current situation
  As a registered user
  I want to edit my settings

  Scenario: Logged in user edits her settings
    Given I am registered and logged in as a user
    And I am on the home page
    And I follow the "Settings" link
    And the name field should contain "user1"
    And the subdomain field should contain "user1"
    And the email field should contain "user1@test.com"
    And I fill in "Name" with "Newbie new Name"
    And I press "Update your settings"
    And I should see a notice with "You updated your account successfully."

