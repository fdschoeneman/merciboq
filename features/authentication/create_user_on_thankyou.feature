Feature: Create new user on thankyou
  As an unregistered user who thanks or is thanked by another
  In order to use Merciboq
  I want an account to be created

  Background: Clear out the email queue
    Given no emails have been sent

  Scenario: Unregistered THANKER signs up after sending a thankyou
    Given no user exists with an email of "custardy.customer@test.com"
    And no user exists with an email of "hardy.heron@test.com"
    And a thankyou from "custardy.customer@test.com" to "hardy.heron@test.com"
    Then "hardy.heron@test.com" should have a confirmation email
    And "custardy.customer@test.com" should have a confirmation email
    Then I should see confirmation instructions in the subject
    And she should see "confirm" in the email body
    When she follows the confirmation in the email body
    Then she should see "Confirm your account" in the title
    And when she fills in her password and confirmation
    And she presses "Confirm that you own"
    Then she should see "confirmed"

  Scenario: Unregistered WELCOMER signs up after receiving a thankyou
    Given a thankyou email is sent from one unregistered user to another
    Then the welcomer should have a confirmation email
    When the welcomer opens her email
    Then she should see confirmation instructions in the subject
    And she should see "confirm" in the email body
    When she follows the confirmation in the email body
    Then she should see "Confirm your account" in the title
    And when she fills in her password and confirmation
    And she presses "Confirm"
    Then she should see "confirmed"

  Scenario: Unregistered WELCOMER signs up after a thankyou
    Given a thankyou email is sent from one unregistered user to another
    Then the welcomer should have a confirmation email
    When the welcomer opens her email
    Then she should see confirmation instructions in the subject

  Scenario: Registered THANKER does not receive confirmation after thankyou
    Given a confirmed user "Custardy Customer" with an email "customer@test.com" and password "password"
    And no emails have been sent
    And a thankyou email from "customer@test.com" to an unregistered user
    Then "customer@test.com" should not receive an email with subject "Welcome to Merciboq! -- Please confirm your account for us."

  Scenario: Registered WELCOMER does not receive confirmation after thankyou
    Given a confirmed user "Harry Hairstylist" with an email "hairstylist@test.com" and password "password"
    And no emails have been sent
    And a thankyou email from "customer@test.com" to "hairstylist@test.com"
    Then "hairstylist@test.com" should not receive an email with subject "Welcome to Merciboq! -- Please confirm your account for us."

  Scenario: Registered THANKER thanks registered WELCOMER
    Given a confirmed user "Harry Hairstylist" with an email "hairstylist@test.com" and password "password"
    And a confirmed user "Custardy Customer" with an email "customer@test.com" and password "password"
    And no emails have been sent
    And a thankyou email from "customer@test.com" to "hairstylist@test.com"
    Then "hairstylist@test.com" should not receive an email with subject "Welcome to Merciboq! -- Please confirm your account for us."

