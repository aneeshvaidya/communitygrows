# by Tony
Feature: successfully change of password
  
 As a user
 I want to be able to edit my password
 So that I can choose my own password without admin knowing

Background: user is on the login page
  Given a valid user
  And I am on the CommunityGrows home page

# happy path
Scenario: successfully change of user password
  When I edit password
  And I fill in "password" with "dummypass"
  And I press "submit"
  Then I should see "Board Member Dashboard"

# sad path  
Scenario: unsuccessfully change of user password
  When I edit password
  And I fill in "password" with "0000"
  And I press "submit"
  And I should see "error message"

  

  
