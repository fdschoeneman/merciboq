Feature: Unconfirmed user confirms his account
  In order to access protected sections of the site
  As a user who has signed up, but not confirmed
  I want to confirm my account

  Background:
    Given no emails have been sent
    And no user exists with an email of "sarahsilverman@test.com"
    And I am not logged in
    And I am on the home page
    And I follow the "Sign up" link
    Then I should see "Merciboq | Sign up" in the title

    Scenario: Unregistered user fails to confirm
      Given I follow the "Didn't receive confirmation instructions?" link
      And I fill in "Email" with "sarahsilverman@test.com"
      And I press "Resend confirmation instructions"
      Then I should see "Email not found"

    Scenario: User confirms from manual confirmation link
      And I fill in the following:
        | Name                  | Sarah Silverman             |
        | Email                 | sarahsilverman@test.com     |
        | Password              | please                      |
        | Password confirmation | please                      |
      And I press "Sign up"
      Then I should see "You have signed up successfully."
      And I empty the email queue
      And I follow the "Login" link
      And I follow the "Didn't receive confirmation instructions?" link
      And I fill in "Email" with "sarahsilverman@test.com"
      And I press "Resend confirmation instructions"
      And "sarahsilverman@test.com" should have 1 email
      When I open the email
      Then I should see "Confirmation instructions" in the email subject
      And I should see "sarahsilverman" in the email body
      And I should see "confirm" in the email body
      When I follow "Confirm my account" in the email
      Then I should see "Your account was successfully confirmed."
      And I should see a link to "Logout"
      And I should see a link to "Settings"
      And I follow the "Logout" link
      And I follow the "Login" link
      And I follow the "Didn't receive confirmation instructions?" link
      And I fill in "Email" with "sarahsilverman@test.com"
      And I press "Resend confirmation instructions"
      Then I should see "Email was already confirmed, please try signing in"

