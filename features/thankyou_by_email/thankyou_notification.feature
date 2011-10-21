Feature: User is notified when she has been thanked
  As a person who has been thanked on Mercibioq
  In order to know I have been thanked
  I want to be notified of the thankyou

  Background: Clear out the email queue
    Given no user exists with an email of "hairstylist@test.com"
    And no user exists with an email of "customer@test.com"
    And a confirmed user "Sarah Silverman" with an email "sarah.silverman@test.com" and password "password"
    And a confirmed user "Dave Attell" with an email "dave.attell@test.com" and password "password"
    And no emails have been sent

  Scenario: Unregistered THANKER thanks unregistered WELCOMER
    Given a thankyou email from "customer@test.com" to "hairstylist@test.com"
    Then "customer@test.com" should not receive an email with subject "thanked you."
    And "hairstylist@test.com" should receive an email with subject "Customer thanked you"

  Scenario: Registered THANKER thanks unregistered WELCOMER
    Given a thankyou email from "sarah.silverman@test.com" to "hairstylist@test.com"
    Then "sarah.silverman@test.com" should not receive an email with subject "thanked you."
    And "hairstylist@test.com" should receive an email with subject "Sarah Silverman thanked you"

  Scenario: Unregistered THANKER thanks registered WELCOMER
    Given a thankyou email from "customer@test.com" to "dave.attell@test.com"
    Then "customer@test.com" should not receive an email with subject "thanked you."
    And "dave.attell@test.com" should receive an email with subject "Customer thanked you"

  Scenario: Registered THANKER thanks registered WELCOMER
    Given a thankyou email from "sarah.silverman@test.com" to "dave.attell@test.com"
    Then "sarah.silverman@test.com" should not receive an email with subject "thanked you."
    And "dave.attell@test.com" should receive an email with subject "Sarah Silverman thanked you"

