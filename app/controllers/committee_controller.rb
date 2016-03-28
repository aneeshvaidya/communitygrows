class CommitteeController < ActionController::Base
    layout "base"
    before_filter :authenticate_user!
  
    def index
    end
end
