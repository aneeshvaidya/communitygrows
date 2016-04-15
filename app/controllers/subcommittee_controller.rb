class SubcommitteeController < ActionController::Base
    layout "base"
    before_filter :authenticate_user!
    
    def index
        @announcements = Announcement.where(committee_type: params[:committee_type]).order(created_at: :DESC)
        @document_list = Document.where(committee_type: params[:committee_type]).order(created_at: :DESC)
    end
    
end
