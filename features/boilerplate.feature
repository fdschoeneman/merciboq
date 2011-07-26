Feature: View boilerplate pages
  In order to learn more about the site
  As an unregistered use
  I want to view boilerplate pages

  Background:
    Given I am not logged in
    And I am on the home page
    And I should see "Merciboq | Home"

  Scenario:
    Given I follow the "About" link
    Then I should see "Merciboq | About"

  Scenario:
    Given I follow the "Terms" link
    Then I should see "Merciboq | Terms of Use"

  Scenario:
    Given I follow the "Privacy" link
    Then I should see "Merciboq | Privacy Policy"

  Scenario:
    Given I follow the "Contact" link
    Then I should see "Merciboq | Contact"

  Scenario:
    Given I follow the "Help" link
    Then I should see "Merciboq | Help"
    Then I follow the "Home" link
    And I should see "Merciboq | Home"

