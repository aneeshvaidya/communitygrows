class AnnouncementController < ActionController::Base
    layout "base"
    before_filter :authenticate_user!

    def announcement_params
        params.require(:announcement).permit(:title, :content)
    end
    
    def show_announcements
       @announcements = Announcement.where(committee_type: params[:categories])
    end


    def new_announcement
    end
    
        
    def create_announcement
        @title = params[:title]
        @content = params[:content]
        @committee_type = params[:committee_type]
        Announcement.create!(:title => @title, :content => @content, :committee_type => @committee_type)
        flash[:notice] = 'Executive Announcement creation successful.'
        redirect_to subcommittee_index_path(:committee_type => @committee_type)
    end
        
    def edit_announcement
        @announcement_id = params[:id]
        @announcement = Announcement.find @announcement_id
    end
    
    def update_announcement
        @target_announcement = Announcement.find params[:announcement][:id]
        @title = params[:title]
        @content = params[:content]
        @committee_type = params[:committee_type]
        @target_announcement.update_attributes!(:title => @title, :content => @content, :committee_type => @committee_type)
        flash[:notice] = "Announcement with title [#{@target_announcement.title}] updated successfully"
        redirect_to subcommittee_index_path(@committee_type)
    end
    
    def delete_announcement
        @target_announcement = Announcement.find params[:announcement_id]
        @committee_type = params[:committee_type]
        @target_announcement.destroy!
        flash[:notice] = "Executive Announcement with title [#{@target_announcement.title}] deleted successfully"
        redirect_to subcommittee_index_path(@committee_type)
    end
    
    def search_announcements
        @search = params[:search]
        @announcements = Announcement.where("title LIKE ?", @search)
        render :show_announcements
    end

end

