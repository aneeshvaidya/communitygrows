require 'spec_helper'
require "rails_helper"

describe AdminController do

    
    describe 'create_user' do
        it 'should call the model method to create a new user' do
            curr = User.create!(:email => "admin@communitygrows.org", :password => "communitygrowsrocks", :password_confirmation => "communitygrowsrocks", :admin => true)
            visit "/users/sign_in"
            fill_in "Email",    :with => curr.email
            fill_in "Password", :with => curr.password
            click_button "Log in"
            visit "/admin/new_user"
            fill_in "Email", :with => "zachary@gmail.net"
            fill_in "Password", :with => "12345678"
            fill_in "Password Confirmation", :with => "12345678"
            click_button "Submit"
            page.should have_content("Admin Dashboard")
            page.should have_content("zachary@gmail.net")
        end
    end
    
    describe 'delete_user' do
        
    end
    
    describe 'index' do
    
    end
    
    describe 'edit_user' do
        
    end

end