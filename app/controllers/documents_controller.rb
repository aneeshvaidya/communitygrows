class DocumentsController < ActionController::Base
    layout "documents"
    before_filter :authenticate_user!
  
    def index
    end
end
