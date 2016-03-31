require 'spec_helper'
require "rails_helper"

describe AdminController do
    fixtures :users
    before(:each) do

    end
    describe 'new_user' do
        it 'creates a new user' do
            sign_in users(:tester)
            fake_user = double('user1')
            user_params = {:email => "admin@rspec.com", :password => "communitygrowsrocks", :password_confirmation => "communitygrowsrocks", :admin => true}
            controller.should_receive(:new_user)
            post :new_user, user_params
        end
    end    
    describe 'delete_user' do
        
    end
    
    describe 'index' do
        it 'redirects non-admin users' do
            sign_in users(:user)
            get :index
            response.should redirect_to('/users/sign_in')
        end
    end
    
    describe 'edit_user' do
        
    end

end