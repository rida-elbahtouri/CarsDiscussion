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

    def destroy
        user=User.find(params[:user_id])
        following=Following.find_by(followed_id:params[:user_id],follower_id:check_user)
        if following.destroy
            redirect_to root_path
            flash[:notice] = "you unfollowed #{user.fullname}"
        else
            render :new
            flash[:alert] = "something went wrong"
        end
    end
end