#    Scenario: Unregistered user signs up with valid data
#      And I fill in the following:
#        | Name                  | Testy McUserton |
#        | Email                 | user@test.com   |
#        | Password              | please          |
#        | Password confirmation | please          |
#      And I press "Sign up"
#      Then I should see "You have signed up successfully."

 #   Scenario: Unregistered user signs up with invalid email
#      And I fill in the following:
#        | Name                  | Testy McUserton |
#        | Email                 | invalidemail    |
#        | Password              | please          |
#        | Password confirmation | please          |
#      And I press "Sign up"
#      Then I should see "Email is invalid"

#    Scenario: User signs up without password
#      And I fill in the following:
#        | Name                  | Testy McUserton |
#        | Email                 | user@test.com   |
#        | Password              |                 |
#        | Password confirmation |                 |
#     And I press "Sign up"
#     Then I should see "You have signed up successfully"

#    Scenario: User signs up without password confirmation
#      And I fill in the following:
#        | Name                  | Testy McUserton |
#        | Email                 | user@test.com   |
#        | Password              | please          |
#        | Password confirmation |                 |
#      And I press "Sign up"
#      Then I should see "Password doesn't match confirmation"#

#      Scenario: User signs up with mismatched password and confirmation
#      And I fill in the following:
#        | Name                  | Testy McUserton |
#        | Email                 | user@test.com   |
#        | Password              | please          |
#        | Password confirmation | pleeeeeeese     |
#      And I press "Sign up"
#      Then I should see "Password doesn't match confirmation"

