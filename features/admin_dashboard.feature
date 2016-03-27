Feature: Admin dashboard contains all necessary features
  
  As a user
  I want to make sure everything I want is on the Admin dashboard
  So I can view user management and announcement tools 
  
Background: users in database
  
  Given the following users exist:
    | email             | admin      | created_at           | password     | password_confirmation     |
    | zach@gmail.com    | true       | 2016-03-17 17:44:13  | 12341234     | 12341234                  |
    | tonylee@gmail.com | false      | 2016-03-14 15:32:00  | 43124312     | 43124312                  |
    | jae@berkeley.edu  | false      | 2016-03-18 22:12:11  | 54175417     | 54175417                  |

  Given a logged in user
  And I am on the CommunityGrows admin_dashboard page

Scenario: see users on admin dashboard
  Then I should see "zach@gmail.com"
  And I should see "tonylee@gmail.com"
  
Scenario: add new user to the database 
  When I follow "Add new user"
  Then I fill in "Email" with "mg@mgmt.com"
  Then I fill in "Password" with "12345678"
  And I fill in "Password Confirmation" with "12345678"
  And I press "Submit"
  Then I should be on the admin_dashboard page
  And I should see "mg@mgmt.com"
  
Scenario: edit an existing user's info
  When I follow "zach@gmail.com"
  Then I fill in "Email" with "zachary@gmail.com"
  Then I fill in "Password" with "password"
  And I fill in "Password Confirmation" with "password"
  And I press "Update user"
  Then I should be on the admin_dashboard page
  And I should see "zachary@gmail.com"
  And I should not see "zach@gmail.com"
  
  
  

