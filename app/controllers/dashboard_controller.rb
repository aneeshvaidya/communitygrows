class DashboardController < ActionController::Base
    layout "dashboard"
    before_filter :authenticate_user!
    
    def index
        # updating calendar
        @curr_calendar_id = Calendar.all[0].user_id
    end
end
