class DashboardController < ActionController::Base
    layout "dashboard"
    before_filter :authenticate_user!
    
    def index
        @announcement_list = Announcement.order(created_at: :DESC)
    end
end
