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
        it 'renders index page' do
            sign_in users(:tester)
            post :create_user
            response.should redirect_to(:admin_index)
        end
        
    end    
    describe 'delete_user' do
        
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
        
    end

end