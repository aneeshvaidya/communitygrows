# by Tony
Feature: successfully CRUD on the document repository
  
  As a user
  I want to perform CRUD actions on the document repository
  So that I can not only access the information but contribute to them

Background: user is on the document repository page
  
  Given a logged in valid user
  And I am on the document repository page

# happy path
Scenario: User can add a new document
  When I follow "Add new document"
  Then I fill in "file name" with "schedule"
  Then I fill in "url" with "mock.com/schedule"
  And I press "Submit"
  Then I should be on the document repository page
  And I should see "schedule"

# sad path
Scenario: User can't add a new document without proper file name
  When I follow "Add new document"
  Then I fill in "file name" with ""
  Then I fill in "url" with "mock.com/schedule"
  And I press "Submit"
  Then I should be on the document repository page
  And I should not see "schedule"

# happy path
Scenario: User can edit an existing file
  When I follow "schedule"
  Then I fill in "file name" with "new schedule"
  Then I fill in "url" with "mock.com/schedule"
  And I press "Submit"
  Then I should be on the document repository page
  And I should see "new schedule"

# sad path
Scenario: User cannot edit an existing file without proper file name
  When I follow "new schedule"
  Then I fill in "file name" with ""
  Then I fill in "url" with "mock.com/schedule"
  And I press "Submit"
  Then I should be on the document repository page
  And I should see "new schedule"

# happy path
Scenario: User can delete an announcement
  When I follow "delete"
  Then I should be on the document repository page
  And I should not see "new schedule"

  
