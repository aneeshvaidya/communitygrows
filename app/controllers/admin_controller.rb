class AdminController < ActionController::Base
    layout "admin"
    before_filter :authenticate_user!
    
    def announcement_params
        params.require(:announcement).permit(:title, :content)
    end
  
    def index
        @announcement_list = Announcement.order(created_at: :DESC)
    end
    
    def new_announcement
    end
    
    def create_announcement
        begin
            Announcement.create!(announcement_params)
        rescue Exception
            flash[:notice] = 'Announcement creation unsuccessful.'
            redirect_to('/admin')
        else
            flash[:notice] = 'Announcement creation successful.'
            redirect_to('/admin')
        end
    end
    
    def edit_announcement
        @id = params[:id]
    end
    
    def update_announcement
        @target_announcement = Announcement.find params[:id]
        @target_announcement.update_attributes!(announcement_params)
        flash[:notice] = "Announcement with title [#{@target_announcement.title}] updated successfully"
        redirect_to(admin_index_path)
    end
    
    def delete_announcement
        @target_announcement = Announcement.find params[:id]
        @target_announcement.destroy!
        flash[:notice] = "Announcement with title [#{@target_announcement.title}] updated successfully"
        redirect_to(admin_index_path)
    end
    
end