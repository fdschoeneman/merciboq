Feature: View thankyous
  In order to see who has thankd me
  As a registered user
  I want to view my Thankyous


  Background:
    Given I am registered and logged in as "Sandra Bullock" with an email "sandra.bullock@gmail.com" and password "westcoastchoppers"

    Scenario: I view my thankyous
    Given I am on the home page
    Then I should see a link to "Thankyous"
    And I follow the "Thankyous" link
#    Then I should see "Merciboq | People who have thanked me" in the title
#    And I should see a list of people who have thanked me

