class AdminController < ActionController::Base
    layout "base"
    before_filter :authenticate_user!
    
    def calendar_params
        params.require(:calendar).permit(:html)
    end
    
    def announcement_params
        params.require(:announcement).permit(:title, :content)
    end
  
    def index
        @announcement_list = Announcement.order(created_at: :DESC)
        if !current_user.admin
            flash[:message] = "Access not granted. Please sign in again."
            redirect_to("/users/sign_in")
        end
    end
    
    def new_announcement
    end
    
    def create_announcement
        Announcement.create!(announcement_params)
        flash[:notice] = 'Announcement creation successful.'
        redirect_to('/admin')
    end
    
    def edit_announcement
        @id = params[:id]
        @target_announcement = Announcement.find @id
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
    
    def update_calendar
        Calendar.destroy_all
        @new_calendar = Calendar.create!(calendar_params)
        flash[:notice] = 'New Calendar Creation successful'
        redirect_to('/admin')
    end
end

