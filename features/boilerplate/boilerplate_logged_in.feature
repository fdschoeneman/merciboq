Feature: View boilerplate pages
  In order to learn more about the site
  As a logged in user
  I want to view boilerplate pages

  Background:
    Given I am registered and logged in as "Chimpy Mchitlerburton" with an email "chimpy@mchitlerburton.com" and password "compassionateconservative"
    And I am on the home page
    And I should see "Merciboq | Chimpy Mchitlerburton" in the title
    And I should not see a link to "Home"
    And I should see a link to "About"
    And I should see a link to "Help"
    And I should see a link to "Contact"
    And I should see a link to "Terms of Use"
    And I should see a link to "Privacy Policy"
    And I should see a link to "Settings"
    And I should see a link to "Logout"

  Scenario:
    Given I follow the "About" link
    Then I should see "Merciboq | About" in the title
    And I should not see a link to "About"

  Scenario:
    Given I follow the "Terms" link
    Then I should see "Merciboq | Terms of Use" in the title
    And I should not see a link to "Terms of Use"

  Scenario:
    Given I follow the "Privacy" link
    Then I should see "Merciboq | Privacy Policy" in the title
    And I should not see a link to "Privacy Policy"

  Scenario:
    Given I follow the "Contact" link
    Then I should see "Merciboq | Contact" in the title
    And I should not see a link to "Contact"

  Scenario:
    Given I follow the "Help" link
    Then I should see "Merciboq | Help" in the title
    And I should not see a link to "Help"

Scenario:
    Given I follow the "Settings" link
    Then I should see "Merciboq | Settings" in the title
    And I should see a link to "Logout"
    And I should not see a link to "Settings"

Scenario:
    Given I follow the "Logout" link
    Then I should see "Merciboq | Home"
    And I should see a link to "Sign up"
    And I should see a link to "Login"

