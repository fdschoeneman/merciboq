Feature: Write a merciboq from the site
  As a registered user who doesn't want to use email
  In order to thank someone publicly
  I want to write a merciboq from the site
  
  Background: 
    Given a logged in user named "George Clooney" with an email "george.clooney@test.com" and password "password" 
    And I am on the home page
    And I fill in the following:
      | Headline  | 5 stars                 |
      | Content   | Loved working with you  |
