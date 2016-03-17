class CommitteeController < ActionController::Base
    layout "committee"
    
    # by Tony
    # if user tries to access the committee through uri, should redirect to the sign_in page if not signed in
    def index
        if !user_signed_in?
            flash[:message] = "Access not granted. Please sign in again."
            redirect_to("/users/sign_in")
        end
    end
end
