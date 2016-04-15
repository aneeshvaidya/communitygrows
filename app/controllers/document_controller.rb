class SubcommitteeDocumentListController < ActionController::Base
    layout "base"
    before_filter :authenticate_user!
    
    def executive_params
        params.require(:executive_document_list).permit(:title, :url, :committee_type)
    end
    
    def new_document_list
    end
        
    def create_document_list
        #FIX FIX FIX FIX FIX FIX
        #FIX FIX FIX FIX FIX FIX
        #FIX FIX FIX FIX FIX FIX
        ExecutiveDocumentList.create!(executive_params)
        flash[:notice] = 'Executive Document List creation successful.'
        redirect_to executive_committee_index_path
    end
    
    def edit_document_list
        #FIX FIX FIX FIX FIX FIX
        #FIX FIX FIX FIX FIX FIX
        #FIX FIX FIX FIX FIX FIX
        @executive_document_list_id = params[:id]
        @executive_document_list = ExecutiveDocumentList.find @executive_document_list_id
    end
    
    def update_document_list
        #FIX FIX FIX FIX FIX FIX
        #FIX FIX FIX FIX FIX FIX
        #FIX FIX FIX FIX FIX FIX
        @target_document_list = ExecutiveDocumentList.find params[:id]
        @target_document_list.update_attributes!(executive_params)
        flash[:notice] = "Executive Document List with title [#{@target_document_list.title}] updated successfully"
        redirect_to executive_committee_index_path
    end
    
    def delete_document_list
        #FIX FIX FIX FIX FIX FIX
        #FIX FIX FIX FIX FIX FIX
        #FIX FIX FIX FIX FIX FIX
        @target_document_list = ExecutiveDocumentList.find params[:id]
        @target_document_list.destroy!
        flash[:notice] = "Executive Document List with title [#{@target_document_list.title}] deleted successfully"
        redirect_to executive_committee_index_path
    end
    
end

