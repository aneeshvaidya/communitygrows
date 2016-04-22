# by Tony
Feature: successfully CRUD on the document repository
  
  As a user
  I want to perform CRUD actions on the document repository
  So that I can not only access the information but contribute to them

Background: user is on the document repository page
  
  Given a logged in user
  And I am on the document repository page

# happy path
Scenario: User can add a new document
  When I follow "Add new file"
  Then I fill in "file_title" with "schedule"
  Then I fill in "file_url" with "mock.com/schedule"
  And I press "Submit"
  Then I should be on the document repository page
  And I should see "schedule"
  And I should see "mock.com/schedule"

# sad path
Scenario: User can't add a new document without proper file name
  When I follow "Add new file"
  Then I fill in "file_url" with "mock.com/schedule"
  And I press "Submit"
  And I should see "Populate all fields before submission."

# happy path
Scenario: User can edit an existing file
  When I follow "Add new file"
  Then I fill in "file_title" with "schedule"
  Then I fill in "file_url" with "mock.com/schedule"
  And I press "Submit"
  
  When I follow "Edit document"
  Then I fill in "file_title" with "new schedule"
  Then I fill in "file_url" with "mock.com/schedule"
  And I press "Submit"
  Then I should be on the document repository page
  And I should see "new schedule"
  And I should see "mock.com/schedule"

# sad path
Scenario: User cannot edit an existing file without proper file name
  When I follow "Add new file"
  Then I fill in "file_title" with "schedule"
  Then I fill in "file_url" with "mock.com/schedule"
  And I press "Submit"
  When I follow "Edit document"
  Then I fill in "file_title" with ""
  Then I fill in "file_url" with "mock.com/schedule"
  And I press "Submit"
  And I should see "Populate all fields before submission."

# happy path
@javascript
Scenario: User can delete an announcement
  When I follow "Add new file"
  Then I fill in "file_title" with "delete schedule"
  Then I fill in "file_url" with "mock.com/schedule"
  And I press "Submit"
  When I follow "Delete document"
  And I confirm popup
  Then I should be on the document repository page
  And I should see "deleted successfully"
  
Scenario: see five categories
  When I check out five categories of document repository
  Then I should see "First category"
  Then I should see "Second category"
  Then I should see "Third category"
  Then I should see "Fourth category"
  Then I should see "Fifth category"
  
