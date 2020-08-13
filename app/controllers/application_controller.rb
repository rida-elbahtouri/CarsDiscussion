class ApplicationController < ActionController::Base
    def check_user
        session[:current_user]
    end
end
