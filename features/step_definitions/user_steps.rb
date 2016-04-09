# By Tony. Steps needed for user testing

Given /the following users exist/ do |users_table|
    User.delete_all
    users_table.hashes.each do |user|
        User.create!(user)
    end
end

Given /^a valid user$/ do
  @user = User.create!({
             :email => "dummy@dummy.com",
             :password => "dummypass",
             :password_confirmation => "dummypass",
             :admin => false
           })
end

Given /^a logged in user$/ do
  @user = User.create!({
             :email => "dummy@dummy.com",
             :password => "dummypass",
             :password_confirmation => "dummypass",
             :admin => false
           })
  visit "/users/sign_in"
  fill_in "user_email", :with => "dummy@dummy.com"
  fill_in "password", :with => "dummypass"
  click_button "Log in"
end