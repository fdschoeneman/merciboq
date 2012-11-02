Feature: Reconfirmation
  As a registered but unconfirmed user
  In order to confirm my account
  I want to request a new confirmation email be sent to my email address

  Scenario: Request new confirmation
    Given I am not logged in
    And I have an account but have not chosen a password
    And I am on the login path
    And I follow the "Didn't receive confirmation instructions?" link
    And I fill in my email address
    And I press "Resend confirmation instructions"
    And I should have a reconfirmation email
    When I follow the confirmation link in the email
    And I fill in "password" for user_password 
    And I fill in "password" for user_password_confirmation 
    And I press "Choose my password"
    And I fill in "sarah-silverman" for user_subdomain
    And I press "Choose my subdomain"
    Then I should see a notice with "You updated your account successfully."
