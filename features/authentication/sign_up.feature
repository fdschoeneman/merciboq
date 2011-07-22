Feature: Sign up
  In order to get access to protected sections of the site
  As an unregistered user
  I want to sign up

    Background:
      Given no emails have been sent
      And I am not logged in
      And I am on the home page
      And I follow the "Sign up" link
      And no user exists with an email of "sarahsilverman@test.com"

    Scenario: Unregistered user signs up with valid email
      And I fill in the following:
        | Name                  | Sarah Silverman             |
        | Email                 | sarahsilverman@test.com     |
        | Password              | please                      |
        | Password confirmation | please                      |
      And I press "Sign up"
      Then I should see "You have signed up successfully."
      And "sarahsilverman@test.com" should have 1 email
      When I open the email
      Then I should see "Confirmation instructions" in the email subject
      And I should see "sarahsilverman" in the email body
      And I should see "confirm" in the email body
      When I follow "Confirm my account" in the email
      Then I should see "Your account was successfully confirmed."

    Scenario: Unregistered user signs up with invalid email
      And I fill in the following:
        | Name                  | Testy Mcuserton |
        | Email                 | invalidemail    |
        | Password              | please          |
        | Password confirmation | please          |
      And I press "Sign up"
      Then I should see "Email is invalid"

