Feature: Announcement CRUD actions supported on admin dashboard
  
  As an admin
  I want to make sure every announcements that I update should be reflected
  So that users can see them on their dashboard
  
Background: admin is on the admin dashboard
  
  Given a logged in admin
  And I am on the CommunityGrows admin_dashboard page

# happy path
Scenario: should be able to add an announcement
  Then I should see "New Announcement"
  When I follow "New Announcement"
  And I fill in "Title" with "new title"
  And I fill in "Content" with "new content"
  And I press "Submit"
  Then I should see "new title"
  And I should see "new content"

# happy path
Scenario: should be able to edit a created announcement
  Then I should see "New Announcement"
  When I follow "New Announcement"
  And I fill in "Title" with "new title"
  And I fill in "Content" with "new content"
  And I press "Submit"
  Then I should see "Edit Announcement"
  When I follow first "Edit Announcement"
  And I fill in "Title" with "edited title"
  And I fill in "Content" with "edited content"
  And I press "Submit"
  Then I should see "edited title"
  And I should see "edited content"

# happy path
@javascript
Scenario: should be able to delete a created announcement
  Then I should see "New Announcement"
  When I follow "New Announcement"
  And I fill in "Title" with "new title"
  And I fill in "Content" with "new content"
  And I press "Submit"
  Then I should see "new title"
  And I should see "new content"
  Then I should see "Delete Announcement"
  When I follow first "Delete Announcement"
  And I confirm popup
  Then I should not see "new content"

# no sad path because the design of CRUD is specifically open to the admin's discretion
