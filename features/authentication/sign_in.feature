Feature: Sign in
  In order to get access to protected sections of the site
  As a user
  I want to sign in

    Background:
      Given I am not logged in

    Scenario: Unregistered user attempts to sign up
      And no user exists with an email of "user@test.com"
      When I go to the sign in page
      And I sign in as "user@test.com/please"
      Then I should see "Invalid email or password."
      And I go to the home page
      And I should be signed out

    Scenario: Registered user enters wrong password
      And I am a user named "foo" with an email "user@test.com" and password "please"
      And I am confirmed
      When I go to the sign in page
      And I sign in as "user@test.com/wrongpassword"
      Then I should see "Invalid email or password."
      And I go to the home page
      And I should be signed out

    Scenario: Registered user signs in
      And I am a user named "foo" with an email "user@test.com" and password "please"
      And I am confirmed
      When I go to the sign in page
      And I sign in as "user@test.com/please"
      Then I should see "Signed in successfully."
      And I should be signed in
      When I return next time
      Then I should be already signed in

