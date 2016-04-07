# by Tony
Feature: successfully search for announcements
  
  As a user
  I want to search announcements by title
  So that I can quickly view relevant data

Background: user is on the document repository page and announcement is made
  
  Given a logged in user
  And I am on the CommunityGrows dashboard page
  And an announcement is made with "test" as title and "test-url" as url

# happy path
Scenario: User can search for an announcement
  When I follow "announcement list"
  Then I search for "test"
  And I press "Submit"
  And I should see "test"

# sad path
Scenario: User can't search for an announcement that doesn't exist
  When I follow "announcement title"
  Then I search for "test-non-existant"
  And I press "Submit"
  And I should not see "test-non-existant"

  
