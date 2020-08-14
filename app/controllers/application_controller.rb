class ApplicationController < ActionController::Base
    def check_user
        session[:current_user]
    end
    def check_user!
        if !session[:current_user]
            redirect_to new_user_path
        end
    end
end
