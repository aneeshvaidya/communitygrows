require 'rails_helper'

describe CommentController do
    fixtures :users
    fixtures :announcements
    before(:each) do
        sign_in users(:tester)
        @ann = Announcement.create!(title: "test1", content: "titleA", committee_type: "executive")
    end
    describe 'create comment' do
        it 'creates a comment' do
            @commentVal = Comment.create!(:content => "this is a comment", :announcement_id => @ann.id)
            post :create_comment, :comment => @commentVal
            flash[:notice].should eq("Internal  Announcement creation successful.")            
        end
    end
    describe 'deleting comment' do
        it 'deletes' do
            @commentVal = Comment.create!(:content => "this is a comment", :announcement_id => @ann.id)
            post :create_comment, :comment => @commentVal
            delete :delete_comment, :comment_id => @commentVal.id, :announcement_id => @ann.id
            response.should redirect_to(comment_path(:announcement_id => @ann.id))
        end
    end
end
