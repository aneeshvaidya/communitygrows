class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  layout "application"
  
  def login
    if user_signed_in?
      render text: "successfully signed in"
    else
      
    end
  end
end
