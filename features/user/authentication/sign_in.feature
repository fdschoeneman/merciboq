Feature: Sign in
  In order to get access to protected sections of the site
  As a user
  I want to sign in

  Background:
    Given no emails have been sent
    And no user exists with an email of "sarahsilverman@test.com"
    And I am not logged in
    And I am on the home page
    And I follow the "Login" link

    Scenario: Unregistered user attempts to log in
      And no user exists with an email of "user@test.com"
      And I fill in "Email" with "user@test.com"
      And I fill in "Password" with "notregisteredpassword"
      And I press "Login"
      Then I should see "Invalid email or password."
      And I am on the the home page
      
    Scenario: Registered user enters wrong password
      And a confirmed user named "Babs" with an email "user@test.com" and password "rightpassword"
      And I am confirmed
      When I go to the login page
      And I fill in "Email" with "user@test.com"
      And I fill in "Password" with "wrongpassword"
      And I press "Login"
      Then I should see "Invalid email or password."
    
    Scenario: Registered user signs in
      And a confirmed user named "Foo Fighter" with an email "user@test.com" and password "please"
      And I am confirmed
      When I go to the login page
      And I fill in "Email" with "user@test.com"
      And I fill in "Password" with "please"
      And I press "Login"
      Then I should see "logged in"
