class UserController < ActionController::Base
    layout "base"
    before_filter :authenticate_user!
    
    def user_params
        params.require(:user).permit(:email, :password, :password_confirmation)
    end
    
    def index
        @user = User.find params[:user_id]
        if flash[:notice] == "Signed in successfully."
            flash[:notice] = nil
        end
    end
    
    def update
        @user = User.find params[:user_id]
        begin
            @user.update_attributes!(user_params)
        rescue Exception => e
            flash[:notice] = flash[:notice].to_a.concat @user.errors.full_messages
            redirect_to user_credentials_path(@user.id)
        else
            flash[:notice] = "#{@user.email}'s credentials were successfully updated."
            redirect_to dashboard_index_path
        end
    end

end