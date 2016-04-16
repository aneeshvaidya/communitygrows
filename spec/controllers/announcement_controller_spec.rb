require 'rails_helper'

describe AnnouncementController do 
    fixtures :users
    before(:each) do
        sign_in users(:tester)
    end
    describe 'show the announcements' do
        it 'shows main announcements' do
            get :show_announcements, :categories => [:dashboard]
            response.should render_template(:show_announcements)
        end
        it 'shows subcommittee announcments' do
            get :show_announcements, :categories => [:external, :internal, :executive]
            response.should render_template(:show_announcements)
        end
    end
    describe 'new announcement' do
        it 'renders the new announcment template' do
            get :new_announcement, :committee_type => :internal
            response.should render_template(:new_announcement)
        end
        it 'creates a new announcement' do
            post :create_announcement, :title => "Rspec", :content => "Is for testing", :committee_type => :internal
            response.should redirect_to(subcommittee_index_path(:committee_type => :internal))
        end
    end
    describe 'edit announcement' do
        it 'renders edit announcment page' do
            get :edit_announcement, :id => 1
            response.should render_template(:edit_announcement)
        end
    end
end