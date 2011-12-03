Feature: Sign up
  In order to get access to protected sections of the site
  As an unregistered user
  I want to sign up

  Background:
    Given no emails have been sent
    And no user exists with an email of "sarahsilverman@test.com"
    And I am not logged in
    And I am on the home page
    And I follow the "Sign up" link
    Then I should see "Merciboq | Sign up" in the title

    Scenario: Unregistered user signs up with valid email
      And I fill in the following:
        | Email                 | sarah.silverman@test.com     |
      And I press "Sign up"
      Then I should see "Thanks for signing up"
      And I should see a link to "Login"
      And I should see a link to "Sign up"
      And "sarah.silverman@test.com" should have 1 email
      When I open the email
      Then I should see confirmation instructions in the subject
      And I should see "Sarah Silverman" in the email body
      And I should see "confirm" in the email body
      When I follow "Confirm my account" in the email
      Then I should see "Merciboq | Confirm your account" in the title
      Then I should see "Confirm your account"
      And I should see a link to "Login"
      And I should see a link to "Sign up"
      And I fill in the following:
        | Password              | password |
        | Password confirmation | password |
      And I press "Accept terms of use and confirm"
      Then I should see "Your account was successfully confirmed."
      And I should see "Merciboq | Edit Settings"

#    @javascript
#    Scenario: Unregistered user signs up with invalid email
#      And I fill in the following:
#        | Email                 | invalidemail    |
#      Then I should see "Doesn't look quite right"

