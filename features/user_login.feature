Feature: successfully login 
  
  As a user
  I want to log in with my credentials
  So that I can access the dashboard
  
Background: user is on the login page
  
  Given the following users exist:
  | username  | password | access_level |
  | admin     | password | admin        |
  | user      | password | user         |
  
  And I am on the CommunityGrows home page

Scenario: successfully login with a user credential
  When I fill in "username" with "user"
  And I fill in "password" with "password"
  And I press "login"
  Then I should see "Welcome back, username."
  Then I should see "CommunityGrows"
  
Scenario: unsuccessfully login with a wrong username
  When I fill in "username" with "dummy_user"
  And I fill in "password" with "password"
  And I press "login"
  Then I should see "Login unsuccessful. Check your login credential."

Scenario: unsuccessfully login with a wrong password
  When I fill in "username" with "user"
  And I fill in "password" with "wrong_password"
  And I press "login"
  Then I should see "Login unsuccessful. Check your login credential."

  
