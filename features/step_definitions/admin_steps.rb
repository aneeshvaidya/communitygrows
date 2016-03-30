Given /^a logged in admin$/ do
  @user = User.create!({
             :email => "admin@communitygrows.org",
             :password => "communitygrowsrocks",
             :password_confirmation => "communitygrowsrocks"
           })
  visit "/users/sign_in"
  fill_in "user_email", :with => "admin@communitygrows.org"
  fill_in "password", :with => "communitygrowsrocks"
  click_button "Log in"
end

When /^(?:|I )follow first "([^"]*)"$/ do |link|
  click_link(link, match: :first)
end