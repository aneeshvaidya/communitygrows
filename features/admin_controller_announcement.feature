Feature: Announcement CRUD actions supported on admin dashboard
  
  As an admin
  I want to make sure every announcements that I update should be reflected
  So that users can see them on their dashboard
  
Background: admin is on the admin dashboard
  
  Given a logged in admin
  And I am on the CommunityGrows admin_dashboard page

Scenario: should be able to CRUD announcements
  Then I should see "New Announcement"
  When I follow "New Announcement"
  And I fill in "Title" with "a"
  And I fill in "Content" with "b"
  And I press "Submit"
  Then I should see "a"
  And I should see "b"

  Then I should see "Edit Announcement"
  When I follow first "Edit Announcement"
  And I fill in "Title" with "c"
  And I fill in "Content" with "d"
  And I press "Submit"
  Then I should see "c"
  And I should see "d"

  Then I should see "Delete Announcement"
  When I follow "Delete Announcement"
  Then I should see "New Announcement"