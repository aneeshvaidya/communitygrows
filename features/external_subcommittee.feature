Feature: successfully working on external subcommittee
  
  As a user
  I want to perform announcement actions and document actions on the external subcommittee page
  So that I can see those on the external subcommittee page

Background: user is on the external page
  
  Given a logged in user
  And I am on the external affairs committee page

# happy path
Scenario: should be able to add an announcement
  Then I should see "Add new announcement"
  When I follow "Add new announcement"
  And I fill in "Title" with "new title"
  And I fill in "Content" with "new content"
  And I press "Submit"
  Then I should see "new title"
  And I should see "new content"

# happy path
Scenario: should be able to edit a created announcement
  Then I should see "Add new announcement"
  When I follow "Add new announcement"
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
  Then I should see "Add new announcement"
  When I follow "Add new announcement"
  And I fill in "Title" with "new title"
  And I fill in "Content" with "new content"
  And I press "Submit"
  Then I should see "new title"
  And I should see "new content"
  Then I should see "Delete Announcement"
  When I follow first "Delete Announcement"
  And I confirm popup
  Then I should not see "new content"
  
# happy path
Scenario: should be able to add a document
  Then I should see "Add new document"
  When I follow "Add new document"
  And I fill in "Title" with "new title"
  And I fill in "URL" with "new url"
  And I press "Submit"
  Then I should see "new title"
  And I should see "new url"

# happy path
Scenario: should be able to edit a created document
  Then I should see "Add new document"
  When I follow "Add new document"
  And I fill in "Title" with "new title"
  And I fill in "URL" with "new url"
  And I press "Submit"
  Then I should see "Edit Document"
  When I follow first "Edit Document"
  And I fill in "Title" with "edited title"
  And I fill in "URL" with "edited url"
  And I press "Submit"
  Then I should see "edited title"
  And I should see "edited url"

# happy path
@javascript
Scenario: should be able to delete a created document
  Then I should see "Add new document"
  When I follow "Add new document"
  And I fill in "Title" with "new title"
  And I fill in "URL" with "new url"
  And I press "Submit"
  Then I should see "new title"
  And I should see "new url"
  Then I should see "Delete Document"
  When I follow first "Delete Document"
  And I confirm popup
  Then I should not see "new url"
  
# no sad path