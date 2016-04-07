# by Tony
Feature: successfully signout
  
  As a user
  I want to click sign out
  So I can safely log out of my current session

Background: user is on the dashboard
  
  Given a logged in valid user
  And I am on the CommunityGrows home page

# happy path
Scenario: successfully logged out from the dashboard
  When I sign out
  Then I should be on the log_in page
  Then I should not see "announcements"
  
# sad path
Scenario: unsuccessfully sign out because you already signed out
  When I sign out
  Then I should be on the log_in page
  Then I should not see "announcements"
  When I sign out
  Then I should be on the log_in page

  
