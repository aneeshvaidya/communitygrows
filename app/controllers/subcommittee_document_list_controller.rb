class SubcommitteeDocumentListController < ActionController::Base
    layout "base"
    before_filter :authenticate_user!
    
    def executive_params
        params.require(:executive_document_list).permit(:title, :url)
    end
    
    def external_params
        params.require(:external_document_list).permit(:title, :url)
    end
    
    def internal_params
        params.require(:internal_document_list).permit(:title, :url)
    end

    def new_executive_document_list
    end
    
    def new_external_document_list
    end
    
    def new_internal_document_list
    end
        
    def create_executive_document_list
        ExecutiveDocumentList.create!(executive_params)
        flash[:notice] = 'Executive Document List creation successful.'
        redirect_to executive_committee_index_path
    end
    
    def create_external_document_list
        ExternalDocumentList.create!(external_params)
        flash[:notice] = 'External Document List creation successful.'
        redirect_to external_committee_index_path
    end
    
    def create_internal_document_list
        InternalDocumentList.create!(internal_params)
        flash[:notice] = 'Internal Document List creation successful.'
        redirect_to internal_committee_index_path
    end
        
    def edit_executive_document_list
        @executive_document_list_id = params[:id]
        @executive_document_list = ExecutiveDocumentList.find @executive_document_list_id
    end
    
    def edit_external_document_list
        @external_document_list_id = params[:id]
        @external_document_list = ExternalDocumentList.find @external_document_list_id
    end
    
    def edit_internal_document_list
        @internal_document_list_id = params[:id]
        @internal_document_list = InternalDocumentList.find @internal_document_list_id
    end
    
    def update_executive_document_list
        @target_document_list = ExecutiveDocumentList.find params[:id]
        @target_document_list.update_attributes!(executive_params)
        flash[:notice] = "Executive Document List with title [#{@target_document_list.title}] updated successfully"
        redirect_to executive_committee_index_path
    end
    
    def update_external_document_list
        @target_document_list = ExternalDocumentList.find params[:id]
        @target_document_list.update_attributes!(external_params)
        flash[:notice] = "External Document List with title [#{@target_document_list.title}] updated successfully"
        redirect_to external_committee_index_path
    end
    
    def update_internal_document_list
        @target_document_list = InternalDocumentList.find params[:id]
        @target_document_list.update_attributes!(internal_params)
        flash[:notice] = "Internal Document List with title [#{@target_document_list.title}] updated successfully"
        redirect_to internal_committee_index_path
    end
    
    def delete_executive_document_list
        @target_document_list = ExecutiveDocumentList.find params[:id]
        @target_document_list.destroy!
        flash[:notice] = "Executive Document List with title [#{@target_document_list.title}] deleted successfully"
        redirect_to executive_committee_index_path
    end
    
    def delete_external_document_list
        @target_document_list = ExternalDocumentList.find params[:id]
        @target_document_list.destroy!
        flash[:notice] = "External Document List with title [#{@target_document_list.title}] deleted successfully"
        redirect_to external_committee_index_path
    end
    
    def delete_internal_document_list
        @target_document_list = InternalDocumentList.find params[:id]
        @target_document_list.destroy!
        flash[:notice] = "Internal Document List with title [#{@target_document_list.title}] deleted successfully"
        redirect_to internal_committee_index_path
    end
end

