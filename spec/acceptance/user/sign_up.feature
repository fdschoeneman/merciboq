Feature: User sign up
  
  Background:
    Given there are no emails
    And I am not logged in
    And no user exists with an email "unregistered@sender.com"
    And no user exists with an email "unregistered@recipient.com"
    And a user does exist with an email "registered@sender.com"
    And a user does exist with an email "registered@recipient.com"

  Scenario: Successful signup via website
    Given I am on the home page
    And I follow the "Sign up" link
    And I fill in "sarah.silverman@test.com" for user_email 
    And I press "Sign up to get a confirmation email"
    Then I should see a notice with "Please check your email — you should have a confirmation sitting in your inbox."
    And "sarah.silverman@test.com" should have 1 email with subject "Welcome"
    When I open the email to "sarah.silverman@test.com"
    And I follow the confirmation link in the email
    And I fill in "password" for user_password 
    And I fill in "password" for user_password_confirmation 
    And I press "Choose my password"
    And I fill in "sarah-silverman" for user_subdomain
    And I press "Choose my subdomain"
    Then I should see a notice with "You updated your account successfully."

  Scenario: Unregistered sender and 1 unregistered recipient
    And a Merciboq from "unregistered@sender.com" to "unregistered@recipient.com"
    And an account should be created for whoever "unregistered@sender.com" belongs to
    And a confirmation should be sent to "unregistered@sender.com"
    And an account should be created for whoever "unregistered@recipient.com" belongs to
    And a confirmation should be sent to "unregistered@recipient.com"

  Scenario: Unregistered sender and 1 unregistered recipient and 1 registered recipient 
  creates two new users
    Given a Merciboq from "unregistered@sender.com" to "unregistered@recipient.com"
    And an account should be created for whoever "unregistered@sender.com" belongs to
    And a confirmation should be sent to "unregistered@sender.com"
    And an account should be created for whoever "unregistered@recipient.com" belongs to
    And a confirmation should be sent to "unregistered@recipient.com"

  Scenario: Unregistered sender and 1 unregistered recipient creates two new users
    Given a Merciboq from "unregistered@sender.com" to "unregistered@recipient.com"
    And an account should be created for whoever "unregistered@sender.com" belongs to
    And a confirmation should be sent to "unregistered@sender.com"
    And an account should be created for whoever "unregistered@recipient.com" belongs to
    And a confirmation should be sent to "unregistered@recipient.com"

  Scenario: Registered sender and 1 unregistered recipient creates one new user
    Given a Merciboq from "registered@sender.com" to "unregistered@recipient.com"
    Then an account should be created for whoever "unregistered@recipient.com" belongs to
    And a confirmation should be sent to "unregistered@recipient.com"

  Scenario: Registered sender and 1 registered recipient does not send another confirmation
    Given a Merciboq from "registered@sender.com" to "registered@recipient.com"
    Then no confirmation should be sent to "registered@recipient.com" or "registered@sender.com"
