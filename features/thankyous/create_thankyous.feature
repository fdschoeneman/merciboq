Feature: Write a merciboq from the site
  As a registered user who doesn't want to use email
  In order to thank someone publicly
  I want to write a merciboq from the site
  
  Background: 
    Given "George Clooney" is confirmed and logged in with an email "george.clooney@test.com" and a password "password" 
    And I am on the home page
    And I fill in the following:
      | Headline  | 5 stars                 |
      | Content   | Loved working with you  |
    Then show me the page
    And I press "Publish your MerciboQ!"
    Then show me the page


