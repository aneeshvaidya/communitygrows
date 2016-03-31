require 'spec_helper'
require "rails_helper"

describe AdminController do
    before(:each) do
        @request.env["devise.mapping"] = Devise.mappings[:admin]
        sign_in :user, FactoryGirl.create(:admin) 
    end
    describe 'create_user' do
        it 'should call the model method' do
            fake_user = double('user1')
            user_params = {:email => "admin@rspec.com", :password => "communitygrowsrocks", :password_confirmation => "communitygrowsrocks", :admin => true}
            User.should_receive(:create)
            post :create_user, user_params
        end
    end
    
    describe 'delete_user' do
        
    end
    
    describe 'index' do
    
    end
    
    describe 'edit_user' do
        
    end

end