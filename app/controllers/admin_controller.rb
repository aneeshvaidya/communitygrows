class AdminController < ActionController::Base
    layout "admin"
    before_filter :authenticate_user!
    
    def user_params
      params.require(:user).permit(:email, :admin, :password, :password_confirmation)
    end
  
    def index
        @users = User.all
    end
    
    def edit_user
        @user = User.find params[:id]
    end
    
    def update_user
        @user = User.find params[:id]
        @user.update_attributes!(user_params)
        flash[:notice] = "#{@user.email} was successfully updated."
        redirect_to admin_index_path(@user)
    end
    
    def create_user
        @user = User.create!(user_params)
        flash[:notice] = "#{@user.email} was successfully created."
        redirect_to admin_index_path
    end
    
    def new_user
        #default: render 'new' template
    end
    
end
