class SubcommitteeAnnouncementController < ActionController::Base
    layout "base"
    before_filter :authenticate_user!

    def params
        params.require(:executive_announcement).permit(:title, :content, :committee_type)
    end


    def new_announcement
    end
    
        
    def create_announcement
        #FIX FIX FIX FIX FIX FIX
        #FIX FIX FIX FIX FIX FIX
        #FIX FIX FIX FIX FIX FIX
        ExecutiveAnnouncement.create!(executive_params)
        flash[:notice] = 'Executive Announcement creation successful.'
        redirect_to executive_committee_index_path
    end
        
    def edit_announcement
        #FIX FIX FIX FIX FIX FIX
        #FIX FIX FIX FIX FIX FIX
        #FIX FIX FIX FIX FIX FIX
        @executive_announcement_id = params[:id]
        @executive_announcement = ExecutiveAnnouncement.find @executive_announcement_id
    end
    
    def update_announcement
        #FIX FIX FIX FIX FIX FIX
        #FIX FIX FIX FIX FIX FIX
        #FIX FIX FIX FIX FIX FIX
        @target_announcement = ExecutiveAnnouncement.find params[:id]
        @target_announcement.update_attributes!(executive_params)
        flash[:notice] = "Executive Announcement with title [#{@target_announcement.title}] updated successfully"
        redirect_to executive_committee_index_path
    end
    
    def delete_announcement
        #FIX FIX FIX FIX FIX FIX
        #FIX FIX FIX FIX FIX FIX
        #FIX FIX FIX FIX FIX FIX
        @target_announcement = ExecutiveAnnouncement.find params[:id]
        @target_announcement.destroy!
        flash[:notice] = "Executive Announcement with title [#{@target_announcement.title}] deleted successfully"
        redirect_to executive_committee_index_path
    end

end

