class DocumentListController < ActionController::Base
    layout "base"
    before_filter :authenticate_user!
    
    def document_params
        #params.require(:executive_document_list).permit(:title, :url, :committee_type)
    end
    
    def new_document
    end
        
    def create_document
        @title = params[:title]
        @url = params[:url]
        @committee_type = params[:committee_type]
        Document.create!(:title => @title, :url => @url, :committee_type => @committee_type)
        flash[:notice] = 'Document List creation successful.'
        redirect_to subcommittee_index_path(@committee_type)
    end
    
    def edit_document
        @document_list_id = params[:id]
        @document = Document.find @document_list_id
    end
    
    def update_document
        @title = params[:title]
        @url = params[:url]
        @committee_type = params[:committee_type]
        @target_document = Document.find params[:document][:id]
        @target_document.update_attributes!(:title => @title, :url => @url, :committee_type => @committee_type)
        flash[:notice] = "Executive Document List with title [#{@target_document.title}] updated successfully"
        redirect_to subcommittee_index_path(@committee_type)
    end
    
    def delete_document
        @committee_type = params[:committee_type]
        @target_document = Document.find params[:document_id]
        @target_document.destroy!
        flash[:notice] = "Executive Document List with title [#{@target_document.title}] deleted successfully"
        redirect_to subcommittee_index_path(@committee_type)
    end
end

