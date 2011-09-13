Feature: Thankyou by email
  In order to thank another person
  As a person with an email address
  I want to send a thankyou and have it published

  Background: Registered user thanks another registered
    Given no emails have been sent
    When a thankyou email is sent from one unregistered user to another
    Then the thanker should have a confirmation email
    And the welcomer should have a confirmation email


@wip
  Scenario: Unregistered thanker signs up after a thankyou
    When the thanker opens her email
    Then she should see "Confirmation instructions" in the subject
    And she should see "confirm" in the email body
    When she follows the confirmation in the email body
    Then she should see "Merciboq | Confirm your account" in the title
    And when she fills in her password and confirmation
    And she presses "Accept terms of use and confirm"
    Then she should see "Your account was successfully confirmed"



  Scenario: Registered user thanks unregistered

  Scenario: Unregistered user thanks registered user

  Scenario: Unregistered user thanks Unregistered user

