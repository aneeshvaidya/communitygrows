Feature: Admin dashboard contains all necessary features
  
  As a user
  I want to make sure everything I want is on the Admin dashboard
  So I can view user management and announcement tools 
  
Background: user is on the login page
  
  Given a logged in user
  And I am on the CommunityGrows admin_dashboard page

Scenario: see all the User Management tools
  Then I should see "User Management"
  And I should see "Jae"

Scenario: see all the Annoucement tools
  Then I should see "Announcement Management"
  And I should see "Hello"

