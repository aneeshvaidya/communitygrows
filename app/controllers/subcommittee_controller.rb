class SubcommitteeController < ActionController::Base
    layout "base"
    before_filter :authenticate_user!
    
    def executive_committee_index
        @executive_announcements = ExecutiveAnnouncement.order(created_at: :DESC)
        @executive_document_lists = ExecutiveDocumentList.order(updated_at: :DESC)
        if !current_user.admin
            redirect_to("/users/sign_in")
        end
        render('executive_committee')
    end
    
    def external_committee_index
        @external_announcements = ExternalAnnouncement.order(created_at: :DESC)
        @external_document_lists = ExternalDocumentList.order(updated_at: :DESC)
        if !current_user.admin
            redirect_to("/users/sign_in")
        end
        render('external_committee')
    end
    
    def internal_committee_index
        @internal_announcements = InternalAnnouncement.order(created_at: :DESC)
        @internal_document_lists = InternalDocumentList.order(updated_at: :DESC)
        if !current_user.admin
            redirect_to("/users/sign_in")
        end
        render('internal_committee')
    end
end
