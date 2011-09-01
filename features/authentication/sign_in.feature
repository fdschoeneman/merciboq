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
    Then I should see "Merciboq | Login" in the title
    And I should see a link to "About"
    And I should see a link to "Help"
    And I should see a link to "Contact"
    And I should see a link to "Terms of Use"
    And I should see a link to "Privacy Policy"
    And I should see a link to "Sign up"
    And I should see a link to "Home"
    And I should see a link to "Sign up"
    And I should see a link to "Forgot your password?"
    And I should see a link to "Didn't receive confirmation instructions?"
    And I should not see a link to "Login"

    Scenario: Unregistered user attempts to log in
      And no user exists with an email of "user@test.com"
      And I fill in "Email" with "user@test.com"
      And I fill in "Password" with "please"
      And I press "Login"
      Then I should see "Invalid email or password."
      And I am on the the home page
      And I am not signed in

    Scenario: Registered user enters wrong password
      And I am a user named "foo" with an email "user@test.com" and password "please"
      And I am confirmed
      When I go to the login page
      And I fill in "Email" with "user@test.com"
      And I fill in "Password" with "wrongpassword"
      And I press "Login"
      Then I should see "Invalid email or password."
      And I go to the home page
      And I am not signed in

    Scenario: Registered user signs in
      And I am a user named "Foo Fighter" with an email "user@test.com" and password "please"
      And I am confirmed
      When I go to the login page
      And I fill in "Email" with "user@test.com"
      And I fill in "Password" with "please"
      And I press "Login"
      Then I should see "Signed in successfully."
      And I should be signed in
      When I return next time
      Then I should be signed in as "Foo Fighter"

