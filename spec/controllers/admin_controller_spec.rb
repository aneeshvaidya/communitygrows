require 'spec_helper'
require "rails_helper"

describe AdminController do
    fixtures :users
    before(:each) do

    end
    describe 'new_user' do
        it 'renders new user page' do
            sign_in users(:tester)
            get :new_user
            response.should render_template(:new_user)
        end
        it 'wrong post content renders new user page' do
            sign_in users(:tester)
            post :create_user
            response.should redirect_to(:new_user)
        end
        it 'redirects to index page on success' do
            sign_in users(:tester)
            user_params = {:email => "admin@rspec.com", :password => "communitygrowsrocks", :password_confirmation => "communitygrowsrocks", :admin => true}
            post :create_user, :user => user_params
            response.should redirect_to(:admin_index)
        end
        
    end    
    describe 'delete_user' do
        it 'deletes a user' do
            sign_in users(:tester)
            delete :delete_user, id: users(:user).id
            response.should redirect_to(:admin_index)
        end
    end
    
    describe 'index' do
        it 'redirects non-admin users' do
            sign_in users(:user)
            get :index
            response.should redirect_to('/users/sign_in')
            sign_out users(:user)
        end
        it 'allows admin users' do
            sign_in users(:tester)
            get :index
            response.should render_template(:index)
        end
    end
    
    describe 'edit_user' do
        it 'renders edit user page' do
            sign_in users(:tester)
            get :edit_user, id: users(:tester).id
            response.should render_template(:edit_user)
        end
        it 'should redirect to edit user page' do
            sign_in users(:tester)
            put :update_user, id: users(:tester).id
            response.should redirect_to(:edit_user)
        end
        it 'redirects to index page on success' do
            sign_in users(:tester)
            user_params = {:email => "admin@rspec.com", :password => "communitygrowsrocks", :password_confirmation => "communitygrowsrocks", :admin => true}
            put :update_user, id: users(:tester).id, :user => user_params
            response.should redirect_to(:admin_index)
        end
    end

end