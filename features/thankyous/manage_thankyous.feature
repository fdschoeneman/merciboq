Feature: Edit a merciboq
  As a registered user who is unhappy with a merciboq 
  In order to control my online reputation
  I want to edit the merciboq
 
  Background:
    Given a confirmed user "Chucky Bottles" with an email "chucky.bottles@test.com" and password "password"
    And "Annette Tracy" is confirmed and logged in with an email "annette.tracy@test.com" and a password "password"
    And a thankyou email from "annette.tracy@test.com" to "chuckybottles@test.com"
    And she is on the home page
    And she follows "Thankyous"

  Scenario: Show thankyou

  Scenario: Edit thankyou
    When she follows "edit"
    Then she should see "| Edit thankyou"
    When she fills in "Content" with "blah blah"
    And she presses "Update"
    Then she should see "| Thankyous"
    And she should see "blah blah"

  Scenario: Delete thankyou
    When she follows "delete"
    Then she should see "| Thankyous"
    And she should not see "cucumber test"

