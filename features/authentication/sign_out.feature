Feature: Sign out
  In order to keep others from accessing the site through my account
  As a user
  I want to sign out

    @wip
    Scenario: Logged in user signs out
      Given I am registered and logged in as "foo fighter" with an email "user@test.com" and password "please"
      And I am on the home page
      And I press "Logout"
      Then I should see "Signed out"
      When I return next time
      Then I should be signed out

