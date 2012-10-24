Feature: Request password reset
  In order log into my account
  As a registered user who has lost my password
  I want to reset my password

    Background:
      And I am not logged in
      And I am on the home page
      And I follow the "Login" link
      And I follow the "Forgot your password?" link

    Scenario: User attempts to reset password with the wrong email
      Given no user exists with an email of "sarahsilverman@wrongdomain.com"
      And I fill in "sarasilverman@WRONGDOMAIN.com" for "Email"
      And I press "Send me reset password instructions"
      Then I should see an error notice with "Email not found"

    Scenario: User resets her password with the correct email
      Given I am registered and confirmed as a user
      And I fill in my email address
      And I press "Send me reset password instructions"
      Then I should see a notice with "You will receive an email with instructions"
      And I should have a password reset email
      When I open the password reset email
      And I follow the "Change my password" link in the email
      And I fill in "please" for "user_password"
      And I fill in "please" for "user_password_confirmation"
      And I press "Change my password"
      Then I should see a notice with "Your password was changed successfully. You are now signed in."

