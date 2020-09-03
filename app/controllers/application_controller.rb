class ApplicationController < ActionController::Base
   
    helper_method :current_user
    helper_method :logged_in?
    helper_method :is_admin?

    def current_user
        User.find_by(id: session[:user_id])
    end 
    
    def is_admin?
        current_user.admin?
    end    
    def logged_in?
        !current_user.nil?
    end 

    def require_login
        unless logged_in?
          flash[:error] = "You must be logged in to access this section"
          redirect_to '/index' 
        end
    end
end
