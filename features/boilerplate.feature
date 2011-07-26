Feature: View boilerplate pages
  In order to learn more about the site
  As an unregistered use
  I want to view boilerplate pages

  Background:
    Given I am not logged in
    And I am on the home page

  @wip
  Scenario:
    Given I follow the "About" link
    Then I should see "Merciboq | About"

