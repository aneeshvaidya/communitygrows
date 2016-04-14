class DocumentsController < ActionController::Base
    layout "base"
    before_filter :authenticate_user!
  
    def index
    end
    
    def create_file
        #try and catch
        # begin
        #     @user = User.create!(user_params)
        # rescue Exception => e
        #     flash[:notice] = "Populate all fields before submission."
        #     redirect_to new_user_path
        # else
        #     flash[:notice] = "#{@user.email} was successfully created."
        #     redirect_to admin_index_path 
        # end
    end
    
    def new_file
        #default: render 'new' template
    end
end