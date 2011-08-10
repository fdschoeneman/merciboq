Feature: Edit settings
  In order to reflect my current situation
  As a registered user
  I want to edit my settings


  Background:
    Given I am registered and logged in as "Sandra Bullock" with an email "sandra.bullock@gmail.com" and password "westcoastchoppers"

    Scenario: I view my settings
    Given I am on the home page
    Then I should see a link to "Settings"
    And I follow the "Settings" link
    Then I should see "Merciboq | Edit Settings" in the title
    And the "Name" field should contain "Sandra Bullock"
    And the "Email" field should contain "sandra.bullock@gmail.com"
    And the "New password" field should be blank
    And the "New password confirmation" field should be blank

