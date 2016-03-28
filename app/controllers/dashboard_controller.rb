class DashboardController < ActionController::Base
    layout "base"
    before_filter :authenticate_user!
    
    def index
        # updating calendar
        @curr_calendar = Calendar.all[0]
        if @curr_calendar
            @curr_calendar_id = @curr_calendar.user_id
        end
    end
end
