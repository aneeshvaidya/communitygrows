class DashboardController < ActionController::Base
    layout "dashboard"
    before_filter :authenticate_user!
    
    def index
    end
end
