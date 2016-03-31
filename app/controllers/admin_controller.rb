class AdminController < ActionController::Base
    layout "base"
    before_filter :authenticate_user!
    
    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation, :admin)
    end

    def calendar_params
        params.require(:calendar).permit(:html)
    end
    
    def announcement_params
        params.require(:announcement).permit(:title, :content)
    end
  
    def index
        @users = User.all
        @announcement_list = Announcement.order(created_at: :DESC)
        if !current_user.admin
            flash[:message] = "Access not granted. Please sign in again."
            redirect_to("/users/sign_in")
        end
    end
    
    def edit_user
        @user = User.find params[:id]
    end
    
    def update_user
        @user = User.find params[:id]
        begin
            @user.update_attributes!(user_params)
        rescue Exception
            flash[:notice] = "Populate all fields before submission."
            redirect_to edit_user_path(@user.id)
        else
            flash[:notice] = "#{@user.email} was successfully updated."
            redirect_to admin_index_path
        end
        #check params for null password fields
        #if either is null, flash notification saying must fill in fields
    end
    
    def create_user
        #try and catch
        p params
        begin
            p 'here'
            @user = User.create!(user_params)
        rescue Exception => e
            p e
            flash[:notice] = "Populate all fields before submission."
            redirect_to new_user_path
        else
            p 'created'
            flash[:notice] = "#{@user.email} was successfully created."
            redirect_to admin_index_path 
        end
    end
    
    def new_user
        #default: render 'new' template
    end
    
    def delete_user
        @user = User.find params[:id]
        @user.destroy
        redirect_to admin_index_path
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
        flash[:notice] = "Announcement with title [#{@target_announcement.title}] deleted successfully"
        redirect_to(admin_index_path)
    end
    
    def update_calendar
        Calendar.destroy_all
        @new_calendar = Calendar.create!(calendar_params)
        flash[:notice] = 'New Calendar Creation successful'
        redirect_to('/admin')
    end
end

