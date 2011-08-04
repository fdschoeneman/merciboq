Feature: Show Users
  In order to see if the site has users
  As a visitor to the website
  I want to see registered users listed on the homepage

    Scenario: logged in user views other users
      Given I am registered and logged in as "Fred Schoeneman" with an email "freddildo@test.com" and password "prettyplease"
      When I go to the homepage
      Then I should see "Merciboq | Fred Schoeneman" in the title

