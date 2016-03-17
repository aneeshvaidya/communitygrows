class CommitteeController < ActionController::Base
    layout "committee"
    before_filter :authenticate_user!
  
    def index
    end
end
