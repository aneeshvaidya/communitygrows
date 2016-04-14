# by Tony
Feature: successfully working on subcommittee
  
  As a user
  I want to naviagte through three subcommittee pages
  So that I can perform announcements actions on the subcommittee pages and keep currently working document list

Background: user is on the document repo page
  
  Given a logged in user
  And I am on the dashboard page

# happy path
@javascript
Scenario: User can naviagte through executive committee page
  When I hover "Subcommittee"
  And I follow "Executive"
  Then I should be on the executive committee page
  And I should see "Executive Subcommittee"

# happy path
@javascript
Scenario: User can naviagte through external affairs committee page
  When I hover "Subcommittee"
  And I follow "External"
  Then I should be on the external affairs committee page
  And I should see "External Subcommittee"

# happy path
@javascript
Scenario: User can naviagte through internal affairs committee page
  When I hover "Subcommittee"
  And I follow "Internal"
  Then I should be on the internal affairs committee page
  And I should see "Internal Subcommittee"

# sad path does not exist

  
