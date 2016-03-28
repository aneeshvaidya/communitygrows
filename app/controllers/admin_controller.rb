class AdminController < ActionController::Base
    layout "admin"
    before_filter :authenticate_user!
    
    def calendar_params
        params.require(:calendar).permit(:html)
    end
  
    def index
    end
    
    def update_calendar
        Calendar.destroy_all
        @new_calendar = Calendar.create!(calendar_params)
        flash[:notice] = 'New Calendar Creation successful'
        redirect_to('/admin')
    end
end
