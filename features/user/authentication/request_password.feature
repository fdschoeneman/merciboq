Feature: Request password reset
  In order log into my account
  As a registered user who has lost my password
  I want to reset my password

    Background:
      And I am not logged in
      And I am on the home page
      And I follow the "Login" link
      And I am on the sign in page
      And I follow the "Forgot your password?" link

    Scenario: User attempts to reset password with the wrong email
      Given no user exists with an email of "sarahsilverman@wrongdomain.com"
      And no emails have been sent
      And I fill in "sarasilverman@WRONGDOMAIN.com" for "Email"
      And I press "Send me reset password instructions"
      Then I should see "Email not found"

    Scenario: User resets her password with the correct email
      Given I am a user named "Dave Attell" with an email "daveattell@test.com" and password "password"
      And no emails have been sent
      And I fill in "daveattell@test.com" for "Email"
      And I press "Send me reset password instructions"
      Then I should see "You will receive an email with instructions"
      And "daveattell@test.com" should have 1 email
      When I open the email
      Then I should see "Reset password instructions" in the email subject
      And I should see "daveattell" in the email body
      And I should see "Change my password" in the email body
      When I follow "Change my password" in the email
      Then I should see "Change your password"
      Then show me the page
      And I fill in the following:
        | New password          | please                 |
        | Once more             | please                 |
      And I press "Change my password"
      Then I should see "Your password was changed successfully. You are now signed in."

