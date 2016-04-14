class SubcommitteeAnnouncementController < ActionController::Base
    layout "base"
    before_filter :authenticate_user!

    def executive_params
        params.require(:executive_announcement).permit(:title, :content)
    end
    
    def external_params
        params.require(:external_announcement).permit(:title, :content)
    end
    
    def internal_params
        params.require(:internal_announcement).permit(:title, :content)
    end

    def new_executive_announcement
    end
    
    def new_external_announcement
    end
    
    def new_internal_announcement
    end
        
    def create_executive_announcement
        ExecutiveAnnouncement.create!(executive_params)
        flash[:notice] = 'Executive Announcement creation successful.'
        redirect_to executive_committee_index_path
    end
    
    def create_external_announcement
        ExternalAnnouncement.create!(external_params)
        flash[:notice] = 'External Announcement creation successful.'
        redirect_to external_committee_index_path
    end
    
    def create_internal_announcement
        InternalAnnouncement.create!(internal_params)
        flash[:notice] = 'Internal Announcement creation successful.'
        redirect_to internal_committee_index_path
    end
        
    def edit_executive_announcement
        @executive_announcement_id = params[:id]
        @executive_announcement = ExecutiveAnnouncement.find @executive_announcement_id
    end
    
    def edit_external_announcement
        @external_announcement_id = params[:id]
        @external_announcement = ExternalAnnouncement.find @external_announcement_id
    end
    
    def edit_internal_announcement
        @internal_announcement_id = params[:id]
        @internal_announcement = InternalAnnouncement.find @internal_announcement_id
    end
    
    def update_executive_announcement
        @target_announcement = ExecutiveAnnouncement.find params[:id]
        @target_announcement.update_attributes!(executive_params)
        flash[:notice] = "Executive Announcement with title [#{@target_announcement.title}] updated successfully"
        redirect_to executive_committee_index_path
    end
    
    def update_external_announcement
        @target_announcement = ExternalAnnouncement.find params[:id]
        @target_announcement.update_attributes!(external_params)
        flash[:notice] = "External Announcement with title [#{@target_announcement.title}] updated successfully"
        redirect_to external_committee_index_path
    end
    
    def update_internal_announcement
        @target_announcement = InternalAnnouncement.find params[:id]
        @target_announcement.update_attributes!(internal_params)
        flash[:notice] = "Internal Announcement with title [#{@target_announcement.title}] updated successfully"
        redirect_to internal_committee_index_path
    end
    
    def delete_executive_announcement
        @target_announcement = ExecutiveAnnouncement.find params[:id]
        @target_announcement.destroy!
        flash[:notice] = "Executive Announcement with title [#{@target_announcement.title}] deleted successfully"
        redirect_to executive_committee_index_path
    end
    
    def delete_external_announcement
        @target_announcement = ExternalAnnouncement.find params[:id]
        @target_announcement.destroy!
        flash[:notice] = "External Announcement with title [#{@target_announcement.title}] deleted successfully"
        redirect_to external_committee_index_path
    end
    
    def delete_internal_announcement
        @target_announcement = InternalAnnouncement.find params[:id]
        @target_announcement.destroy!
        flash[:notice] = "Internal Announcement with title [#{@target_announcement.title}] deleted successfully"
        redirect_to internal_committee_index_path
    end
end

