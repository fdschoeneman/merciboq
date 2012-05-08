Feature: Write a merciboq from the site
  As a registered user who doesn't want to use email
  In order to thank someone publicly
  I want to write a merciboq from the site
  
  Scenario: logged in user sends a Merciboq: 
    Given "George Clooney" is confirmed and logged in with an email "george.clooney@test.com" and a password "password" 
    And I am on the home page
    And I fill in the following:
      | Headline  | 5 stars                 |
      | Content   | Loved working with you  |
      | Welcomer  | welcomer@test.com       |
    And I press "Publish your MerciboQ!"

  Scenario: unregistered user sends a Merciboq: 
    Given I am on the home page
    And I fill in the following:
      | Headline  | 5 stars                 |
      | Content   | Loved working with you  |
      | Welcomer  | welcomer@test.com       |
      | Thanker   | thanker@test.com        |
    And I press "Publish your MerciboQ!"
    Then show me the page




