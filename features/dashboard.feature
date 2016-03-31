Feature: dashboard contains all necessary information
  
  As a user
  I want to make sure everything I want is on the dashboard
  So I can view panels and go to other tabs
  
Background: user is on the login page
  
  Given a logged in user
  And I am on the CommunityGrows dashboard page

Scenario: see all the tabs
  Then I should see "Documents"
  And I should see "Comittee"
  And I should see "Admin Dashboard"

Scenario: see all the panels
  Then I should see "Announcements"
  And I should see "Calendar"
  And I should see "Salesforce"
  And I should see "Date"
  And I should see "Title"
  And I should see "Content"

Scenario: document tab works successfully
  When I follow "Documents"
  Then I should see "Document Repository"
  
Scenario: subcomittee tab works successfully
  When I follow "Comittee"
  Then I should see "Go to meeting"
  
Scenario: admin tab should not work successfully because you are a use
  When I follow "Admin Dashboard"
  Then I should not see "User Management"
  Then I should not see "Announcement Management"
