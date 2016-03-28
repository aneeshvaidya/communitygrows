# by Tony
Feature: Calendar is supported by this website
  
  As an admin
  I want to make sure that calendar can be updated on the admin dashboard
  So that users can see it on the dashboard
  
Background: admin is on the admin dashboard
  
  Given a logged in admin
  And I am on the CommunityGrows admin_dashboard page

Scenario: update the calendar
  Then I should see "Register/Update Google Calendar"
  


