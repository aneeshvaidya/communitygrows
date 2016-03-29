class AdminController < ActionController::Base
    layout "base"
    before_filter :authenticate_user!
    
    def user_params
      params.require(:user).permit(:email, :admin, :password, :password_confirmation)

    def calendar_params
        params.require(:calendar).permit(:html)
    end
  
    def index
        @users = User.all
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
        begin
            @user = User.create!(user_params)
        rescue Exception => e
            flash[:notice] = "Populate all fields before submission."
            redirect_to new_user_path
        else
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
    
    def update_calendar
        Calendar.destroy_all
        @new_calendar = Calendar.create!(calendar_params)
        flash[:notice] = 'New Calendar Creation successful'
        redirect_to('/admin')
    end
end
