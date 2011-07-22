Feature: Sign out
  In order to keep others from accessing the site through my account
  As a user
  I want to sign out

    Scenario: User signs out
      Given I am a user named "foo" with an email "user@test.com" and password "please"
      And I am confirmed
      When I sign in as "user@test.com/please"
      Then I should be signed in
      And I sign out
      Then I should see "Signed out"
      When I return next time
      Then I should be signed out

