class FollowingsController < ApplicationController
    before_action :check_user!
    def create
        user=User.find(params[:user_id])
        @followings = Following.new(follower_id:check_user,followed_id:params[:user_id])
        if @followings.save
            redirect_to root_path
            flash[:notice] = "you followed #{user.fullname}"
        else
            render :new
            flash[:alert] = "something went wrong"
        end
    end
end