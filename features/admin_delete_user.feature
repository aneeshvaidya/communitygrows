#Author: Zachary
Feature: Admin can delete an existing user from the admin dashboard
  
  As a user
  I want to make sure I can delete users from the dashboard
  So that terminated users no longer exist in database
  
Background: users in database

  Given a logged in user
  And I am on the CommunityGrows admin_dashboard page
 
Scenario: delete a user in the database 
  And I should see "dummy@dummy.com"
  Then I press "Delete User"
  Then I should be on the log_in page