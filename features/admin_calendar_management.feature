Feature: Admin dashboard contains calendar controls
  
  As an admin
  I want to be able to change the owner of the calendar displayed on the main dashboard
  So that other users can view upcoming events
  
Background:
  
  Given a logged in admin
  And I am on the CommunityGrows admin_dashboard page

# happy path
Scenario: Admin should be able to change the owner of the calendar
  Then I fill in "calendar[html]" with "zchrymcperson"
  And I press "Update Google Calendar"
  Then I should see "New Calendar Creation successful"
  Then I am on the CommunityGrows admin_dashboard page

# sad path
Scenario: Calendar should not be displayed if the owner doesn't exist
  Then I fill in "calendar[html]" with ""
  And I press "Update Google Calendar"
  Then I follow "Dashboard"
  Then I should not see "info"
 