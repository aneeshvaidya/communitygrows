Feature: dashboard contains all necessary information
  
  As a user
  I want to make sure everything I want is on the dashboard
  So I can view panels and go to other tabs
  
Background: user is on the login page
  
  Given a logged in user
  And I am on the CommunityGrows dashboard page

Scenario: see all the tabs
  Then I should see "Documents"
  And I should see "Executive"
  And I should see "External"
  And I should see "Internal"
  
Scenario: see all the panels
  Then I should see "Main Announcements"
  And I should see "Calendar"
  And I should see "Date"
  And I should see "Title"

Scenario: document tab works successfully
  When I follow "Documents"
  Then I should see "Document Repository"

Scenario: subcomittee tab works successfully
  When I follow "Executive"
  Then I should see "Executive"
  
Scenario: subcomittee tab works successfully
  When I follow "External"
  Then I should see "External"
  
Scenario: subcomittee tab works successfully
  When I follow "Internal"
  Then I should see "Internal"
  
Scenario: admin tab should not work successfully because you are a use
  Then I should not see "Admin Dashboard"
