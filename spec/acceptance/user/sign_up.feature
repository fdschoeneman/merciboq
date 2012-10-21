Feature: User sign up
  
  Background:
    Given there are no emails
    And I am not logged in

  Scenario: Successful signup via website
    Given I am on the home page
    And I follow the "Sign up" link
    And I fill in "sarah.silverman@test.com" for user_email 
    And I press "Sign up to get a confirmation email"
    Then I should see a notice with "Please check your email — you should have a confirmation sitting in your inbox."
    And I should have a confirmation email addressed to "sarah.silverman@test.com"
    When I open the email to "sarah.silverman@test.com"
    Then show me the email
    And I follow the confirmation link in the email
    And I fill in "password" for user_password 
    And I fill in "password" for user_password_confirmation 
    And I press "Choose my password"
    And I fill in "sarah-silverman" for user_subdomain
    And I press "Choose my subdomain"
    Then I should see a notice with "You updated your account successfully."

  Scenario: unregistered sender and 1 unregistered recipient
    Given an email to Merciboq from an unregistered user to an unregistered user
    Then an account should be created for the unregistered sender
    And an account should be created for the unregistered recipient

  # @wip
  # Scenario: Registered sender and 1 unregistered recipient
  #   Given an email to Merciboq from an unregistered user to an unregistered user
  #   Then two new users should be created
  #   And one new Merciboq should be created
    
  # @wip
  # Scenario: Registered sender and 1 unregistered recipient
