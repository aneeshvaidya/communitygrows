class AdminController < ActionController::Base
    layout "base"
    before_filter :authenticate_user!
  
    def index
    end
    
end
