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

Scenario: successfully login with a user credentials
  When I fill in "username" with "user"
  And I fill in "password" with "password"
  And I press "login"
  Then I should see "Welcome back, username."
  Then I should see "CommunityGrows"
  
