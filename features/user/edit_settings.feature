Feature: Edit settings
  In order to reflect my current situation
  As a registered user
  I want to edit my settings

  Scenario: Logged in user edits her settings
    Given I am registered and logged in as "Sandra Bullock" with an email "sandra.bullock@gmail.com" and password "westcoastchoppers"
    And I am on the home page
    Then show me the page
    Then I should see a link to "Settings"
    And I follow the "Settings" link
    And the "Name" field should contain "Sandra Bullock"
    And the "Email" field should contain "sandra.bullock@gmail.com"
    And the "New password" field should be blank
    And the "New password confirmation" field should be blank
    And I fill in "Name" with "Sandra Luckbull"
    And I fill in "Subdomain" with "sandra-luck"
    And I fill in "Current password" with "westcoastchoppers"
    And I click the "Update your settings" button
    Then I should be on the home page
    And I should see "You updated your account successfully."

  Scenario: Logged out user tries and fails to edit her settings
    Given I am not logged in
    And I attempt to visit the settings page
    Then I should be redirected to the login page

