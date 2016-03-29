# by Tony
Feature: User CRUD actions supported on admin dashboard
  
  As an admin
  I want to make sure every user that I update should be reflected
  So that users can be used properly by board members
  
Background: admin is on the admin dashboard
  
  Given a logged in user
  And I am on the CommunityGrows admin_dashboard page

Scenario: should see user new
  Then I should see "Add new user"

Scenario: should see user edit
  Then I should see "Edit"
  
Scenario: should see user delete
  Then I should see "delete movie"

Scenario: should see last login data availabe for every user
  Then I should see "Created_at"


