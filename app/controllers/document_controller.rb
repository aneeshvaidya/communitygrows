class SubcommitteeDocumentListController < ActionController::Base
    layout "base"
    before_filter :authenticate_user!
    
    def document_params
        params.require(:executive_document_list).permit(:title, :url, :committee_type)
    end
    
    def new_document_list
    end
        
    def create_document_list
        @title = params[:title]
        @url = params[:url]
        Document.create!(:title => @title, :url => @url, :committee_type => @comittee_type)
        flash[:notice] = 'Document List creation successful.'
        redirect_to subcommittee_index_path(@comittee_type)
    end
    
    def edit_document_list
        @document_list_id = params[:id]
        @executive_document_list = Document.find @executive_document_list_id
    end
    
    def update_document_list
        @title = params[:title]
        @url = params[:url]
        @target_document = Document.find params[:id]
        @target_document.update_attributes!(:title => @title, :url => @url, :committee_type => @comittee_type)
        flash[:notice] = "Executive Document List with title [#{@target_document.title}] updated successfully"
        redirect_to subcommittee_index_path(@comittee_type)
    end
    
    def delete_document_list
        @target_document = Document.find params[:id]
        @target_document.destroy!
        flash[:notice] = "Executive Document List with title [#{@target_document.title}] deleted successfully"
        redirect_to subcommittee_index_path(@comittee_type)
    end
    
end

