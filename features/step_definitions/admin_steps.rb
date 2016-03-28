# By Tony. Steps needed for user testing

Given /^a valid admin$/ do
  @user = User.create!({
             :email => "admindummy@dummy.com",
             :password => "dummypass",
             :password_confirmation => "dummypass",
             :admin => true
           })
end

Given /^a logged in admin$/ do
  @user = User.create!({
             :email => "admindummy@dummy.com",
             :password => "dummypass",
             :password_confirmation => "dummypass",
             :admin => false
           })
  visit "/users/sign_in"
  fill_in "user_email", :with => "admindummy@dummy.com"
  fill_in "password", :with => "dummypass"
  click_button "Log in"
end

