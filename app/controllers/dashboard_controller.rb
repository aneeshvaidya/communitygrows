class DashboardController < ActionController::Base
    layout "base"
    before_filter :authenticate_user!
    
    def index
        # updating calendar
        @curr_calendar = Calendar.all[0] #Calendar.first rather than .all
        if @curr_calendar
            @curr_calendar_id = @curr_calendar.user_id
        end
        @announcement_list = Announcement.order(created_at: :DESC)
    end
end
