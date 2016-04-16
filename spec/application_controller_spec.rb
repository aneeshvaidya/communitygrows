require 'spec_helper'
require "rails_helper"

RSpec.describe "User security", :type => :request do
  describe "CommunityGrows website" do
    it 'should redirect to the login unless the user is logged in' do
      get '/'
      response.should redirect_to('/users/sign_in')
    end
    it 'should redirect to the login when unsigned user is trying to access the dashboard' do
      get '/dashboard'
      response.should redirect_to('/users/sign_in')
    end
    it 'should redirect to the login when unsigned user is trying to access the executive subcommittee' do
      get '/subcommittee_index/executive'
      response.should redirect_to('/users/sign_in')
    end
    it 'should redirect to the login when unsigned user is trying to access the external subcommittee' do
      get '/subcommittee_index/external'
      response.should redirect_to('/users/sign_in')
    end
    it 'should redirect to the login when unsigned user is trying to access the internal subcommittee' do
      get '/subcommittee_index/internal'
      response.should redirect_to('/users/sign_in')
    end
    it 'should redirect to the login when unsigned user is trying to access the documents' do
      get '/documents'
      response.should redirect_to('/users/sign_in')
    end
    it 'should redirect to the login when unsigned user is trying to access the admin' do
      get '/admin'
      response.should redirect_to('/users/sign_in')
    end
    it 'should redirect to the dashboard when user is signed in' do
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
    
  end
end
