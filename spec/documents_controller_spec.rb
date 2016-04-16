require 'spec_helper'
require "rails_helper"

describe "documents controller" do
    fixtures :users
    before 'should redirect to the dashboard when user is signed in' do
      curr = User.create!(:email => "admin@communitygrows.org", :password => "communitygrowsrocks", :password_confirmation => "communitygrowsrocks", :admin => true)
      visit "/users/sign_in"
      fill_in :user_email,    :with => curr.email
      fill_in :user_password, :with => curr.password
      click_button "Log in"
      page.should have_content("Dashboard")
      
      # then go back to the root again
      visit "/"
      page.should have_content("Dashboard")
    end
    
    it 'should make a new document and edit it' do
        visit '/documents'

        click_link "Add new file"
        page.should have_content("Title")
        page.should have_content("URL")
        fill_in "Title", :with => 'abcd'
        fill_in "URL", :with => 'bcd.com'
        click_button "Submit"
        page.should have_content("abcd")
        page.should have_content("bcd.com")
          
        click_link "Edit document", match: :first
        page.should have_content("Title")
        page.should have_content("URL")
        fill_in "Title", :with => 'ccc'
        fill_in "URL", :with => 'ddddd'
        click_button "Submit"
        page.should have_content("ccc")
        page.should have_content("ddddd")
        click_link "Delete document", match: :first
        page.should have_content("deleted successfully")
    end
    
    it 'should not be able able to create document with wrong inputs' do
        visit '/documents'

        click_link "Add new file"
        page.should have_content("Title")
        page.should have_content("URL")
        fill_in "Title", :with => 'abcd'
        click_button "Submit"
        page.should have_content("Populate all fields before submission.")
    end
    
end