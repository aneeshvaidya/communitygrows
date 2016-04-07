# by Tony
Feature: successfully working on subcommittee
  
  As a user
  I want to naviagte through three subcommittee pages
  So that I can perform announcements actions on the subcommittee pages and keep currently working document list

Background: user is on the document repo page
  
  Given a logged in user
  And I am on the document repository page

# happy path
Scenario: User can naviagte through executive committee page
  When I follow "executive committee"
  Then I should be on the executive committee page
  And I should see "Executive committee"

# happy path
Scenario: User can naviagte through external affairs committee page
  When I follow "external affairs committee"
  Then I should be on the external affairs committee page
  And I should see "External affairs committee"

# happy path
Scenario: User can naviagte through internal affairs committee page
  When I follow "internal affairs committee"
  Then I should be on the internal affairs committee page
  And I should see "Internal affairs committee"

# sad path does not exist

  
