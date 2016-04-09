# by Tony
Feature: successfully signout
  
  As a user
  I want to click sign out
  So I can safely log out of my current session

Background: user is on the dashboard
  
  Given a logged in user
  And I am on the CommunityGrows home page

# happy path
Scenario: successfully logged out from the dashboard
  When I follow "Sign out"
  Then I should be on the log_in page
  Then I should not see "announcements"
  
# There is no sad path because sign out will just instantly kill the current session and there is no way around it

