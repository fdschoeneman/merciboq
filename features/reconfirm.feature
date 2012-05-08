Feature: Reconfirmation
  As a registered but unconfirmed user
  In order to confirm my account
  I want to request a new confirmation email be sent to my email address

  Scenario: Request new confirmation
    Given no emails have been sent
    And no user exists with an email of "sarahsilverman@test.com"
    And I am not logged in
    And I am on the home page
    And I follow the "Sign up" link
    Then I should see "| Sign up" in the title
    And I fill in the following:
      | Email                 | sarah.silverman@test.com     |
    And I press "Sign up"
    Then I should see "Step 1: Sign up"
    And I am on the sign in page
    And I follow the "Didn't receive confirmation instructions?" link
    