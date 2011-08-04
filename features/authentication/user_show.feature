Feature: Show Users
  In order to see if the site has users
  As a visitor to the website
  I want to see registered users listed on the homepage

    Scenario: Viewing users
      Given I am a user named "Fred Schoeneman" with an email "user@test.com" and password "please"
      When I go to the homepage
      Then I should see "Merciboq | Fred Schoeneman" in the title
      Then I should see "User: Fred Schoeneman" in the body

