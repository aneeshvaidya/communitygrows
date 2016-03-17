class AdminController < ActionController::Base
    layout "admin"
    before_filter :authenticate_user!
  
    def index
    end
    
end
