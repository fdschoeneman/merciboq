Feature: Thankyou by email
  In order to thank another person
  As a person with an email address
  I want to send a thankyou and have it published

  Background: UNREGISTERED user thanks another UNREGISTERED user
    Given no emails have been sent
    When a thankyou email is sent from one unregistered user to another
    Then the welcomer should have a confirmation email

  Scenario: Unregistered THANKER signs up after sending a thankyou
    Then the thanker should have a confirmation email
    When the thanker opens her email
    Then she should see confirmation instructions in the subject
    And she should see "confirm" in the email body
    When she follows the confirmation in the email body
    Then she should see "Merciboq | Confirm your account" in the title
    And when she fills in her password and confirmation
    And she presses "Accept terms of use and confirm"
    Then she should see "Your account was successfully confirmed"

@wip
  Scenario: Unregistered WELCOMER signs up after receiving a thankyou
    Then the welcomer should have a confirmation email
    When the welcomer opens her email
    Then she should see confirmation instructions in the subject
    And she should see "confirm" in the email body
    When she follows the confirmation in the email body
    Then she should see "Merciboq | Confirm your account" in the title
    And when she fills in her password and confirmation
    And she presses "Accept terms of use and confirm"
    Then she should see "Your account was successfully confirmed"

  Scenario: Unregistered WELCOMER signs up after a thankyou
    Then the welcomer should have a confirmation email
    When the welcomer opens her email
    Then she should see confirmation instructions in the subject

  Scenario: Registered user thanks unregistered

  Scenario: Unregistered user thanks registered user

  Scenario: Unregistered user thanks Unregistered user

