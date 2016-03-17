Feature: dashboard contains all necessary information
  
  As a user
  I want to make sure everything I want is on the dashboard
  So I can view panels and go to other tabs
  
Background: user is on the login page
  
  Given a logged in user
  And I am on the CommunityGrows dashboard page

Scenario: see all the tabs
  Then I should see "Documents"
  And I should see "Subcomittee"
  And I should see "Admin"

Scenario: see all the panels
  Then I should see "Announcements"
  And I should see "Calendar"
  And I should see "Salesforce"

Scenario: document tab works successfully
  When I follow "Documents"
  Then I should see "Document Repository"
  
Scenario: subcomittee tab works successfully
  When I follow "Subcomittee"
  Then I should see "Go to meeting"
  
Scenario: admin tab works successfully
  When I follow "Admin"
  Then I should see "Administrator"
