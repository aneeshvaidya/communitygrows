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
             :email => "admin@communitygrows.org",
             :password => "communitygrowsrocks",
             :password_confirmation => "communitygrowsrocks",
             :admin => true
           })
  visit "/users/sign_in"
  fill_in "user_email", :with => "admin@communitygrows.org"
  fill_in "password", :with => "communitygrowsrocks"
  click_button "Log in"
end

When /^(?:|I )confirm popup$/ do
  page.driver.browser.switch_to.alert.accept
end

When /^(?:|I )follow first "([^"]*)"$/ do |link|
  click_link(link, match: :first)
end