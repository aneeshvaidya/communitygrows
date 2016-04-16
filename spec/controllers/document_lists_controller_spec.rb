require 'rails_helper'

describe DocumentListController do 
    fixtures :users
    before(:each) do
        sign_in users(:tester)
        post :create_document, :title => "before hook", :url => "rspec.com", :committee_type => :internal
        @doc = Document.where(title: "before hook").take
    end
    describe "create document" do
        it 'creates a document' do
            post :create_document, :title => "Rspec", :url => "rspec.com", :committee_type => :internal
            flash[:notice].should eq("Document List creation successful.")
        end
    end
    describe "editing document" do
        it 'renders edit page' do
            get :edit_document, :committee_type => @doc.committee_type, :id => @doc.id
            response.should render_template(:edit_document)
        end
        it 'updates the document' do
            put :update_document, :document => {:id => @doc.id}, :title => @doc.title, :url => "new_url", :committee_type => @doc.committee_type 
            response.should redirect_to(subcommittee_index_path(:committee_type => @doc.committee_type))
        end
    end
    describe 'deleting document' do
        it 'deletes' do
            delete :delete_document, :committee_type => @doc.committee_type, :document_id => @doc.id
            response.should redirect_to(subcommittee_index_path(:committee_type => @doc.committee_type))
        end
    end
end