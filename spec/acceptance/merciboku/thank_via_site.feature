Feature: Write a merciboq from the site
  As a registered user who doesn not want to use email
  In order to thank someone publicly
  I want to write a merciboq from the site
  
  Background: 
    Given I am on the home page
  
  Scenario: logged in user sends a Merciboq: 
    Given I am registered and logged in as a user
    And I fill in "welcomer@test.com" for "Welcomer"
    And I fill in "5 stars" for merciboku_headline
    And I fill in "get some" for merciboku_content
    And I press "Publish your MerciboQ!"
    Then I should see a notice with "Well played, sir"

  Scenario: unregistered user sends a Merciboq: 
    And I fill in "thanker@test.com" for "Thanker"
    And I fill in "welcomer@test.com" for "Welcomer"
    And I fill in "5 stars" for merciboku_headline
    And I fill in "get some" for merciboku_content
    And I press "Publish your MerciboQ!"
    Then I should see a notice with "check your email"
