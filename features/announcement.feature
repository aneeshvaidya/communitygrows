# by Tony
Feature: Announcement CRUD actions supported on admin dashboard
  
  As an admin
  I want to make sure every announcements that I update should be reflected
  So that users can see them on their dashboard
  
Background: admin is on the admin dashboard
  
  Given a logged in user
  And I am on the CommunityGrows admin_dashboard page

Scenario: should see announcement new
  Then I should see "Add Announcement"

Scenario: should see announcement edit
  Then I should see "Show more"
  
Scenario: should see announcement delete
  Then I should see "Delete Announcement"

