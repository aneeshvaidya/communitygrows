class AdminController < ApplicationController
  
    # by Tony
    # if user tries to access the admin through uri, should redirect to the sign_in page if not signed in.
    # is_admin IS NOT IMPLEMENTED yet. Admin page needs is_admin checked.
    def index
        if !user_signed_in?
            flash[:message] = "Access not granted. Please sign in again."
            redirect_to("/users/sign_in")
        end
    end
end
