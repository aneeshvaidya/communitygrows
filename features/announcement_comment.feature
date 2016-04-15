# by Tony
Feature: successfully comment on an announcement
  
  As a user
  I want to comment on announcements
  So that the conversation between different users can be established

Background: user is on the main dashboard page and announcement is made
  
  Given a logged in user
  And I am on the CommunityGrows dashboard page
  And an announcement is made with "test" as title and "test-url" as url

# happy path
Scenario: User can add a comment on an announcement
  When I follow "test"
  Then I follow "comment"
  Then I fill in "comment" with "test comment"
  And I press "Submit"
  Then I should be on the announcement page
  And I should see "test comment"

# sad path
Scenario: User can't add a new document without proper text
  When I follow "announcement title"
  Then I follow "comment"
  Then I fill in "comment" with ""
  And I press "Submit"
  Then I should be on the announcement page
  And I should not see "test comment"

  
