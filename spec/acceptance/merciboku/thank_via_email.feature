Feature: Create users and merciboqs from an email
  As a registered user  
  In order to thank someone publicly
  I want to write a merciboq from my email
  
  Background: 
    Given a user exists with an email of "registered@sender.com"
    And a user exists with an email of "registered@recipient.com"
  
   Scenario: as an unregistered user (UU) to another UU creates 2 new users and 1 merciboq: 
     Given an email from "unregistered@sender.com" to "unregistered@recipient.com" with subject "90 points" and content "great productreally loved it"
     Then the system should have 2 new users
     And "unregistered@sender.com" should have an account
     And "unregistered@recipient.com" should have an account

   Scenario: as an unregistered user (UU) to a RU creates 1 new user and 1 merciboq: 
     Given a email from "unregistered@sender.com" to "registered@recipient.com" with subject "90 points" and content "great productreally loved it"
     Then the system should have 1 new user
     And "unregistered@sender.com" should have an account
     And the system should have 1 new merciboq  

   Scenario: as a registered user (RU) to another RU creates no new users and 1 merciboq: 
     Given a email from "registered@sender.com" to "registered@recipient.com" with subject "90 points" and content "great productreally loved it"
     Then the system should have 0 new users
     And the system should have 1 new merciboq

   Scenario: as a registered user (RU) to an (UU) creates 1 new user and 1 merciboq: 
     Given a email from "registered@sender.com" to "unregistered@recipient.com" with subject "90 points" and content "great productreally loved it"
     Then the system should have 1 new user
     And the system should have 1 new merciboq

  Scenario: as an unregistered user (UU) to a RUs merciboq address creates 1 new user and 1 merciboq: 
    Given an email from "unregistered@sender.com" to the merciboq address of "registered@recipient.com" with subject "90 points" and content "great product really loved it"
    Then the system should have 1 new user
    And "unregistered@sender.com" should have an account
    And the system should have 1 new merciboq  

  Scenario: as an RU to a RUs merciboq address creates no new users and 1 merciboq: 
    Given an email from "registered@sender.com" to the merciboq address of "registered@recipient.com" with subject "90 points" and content "great product really loved it"
    Then the system should have 0 new users
    And the system should have 1 new merciboq  

