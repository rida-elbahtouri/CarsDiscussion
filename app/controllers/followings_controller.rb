class FollowingsController < ApplicationController
  before_action :authenticate_user!
  
  def create
    user = User.find(params[:user_id])
    @followings = Following.new(follower_id: current_user.id, followed_id: params[:user_id])
    if @followings.save
      redirect_back fallback_location: root_path
      flash[:notice] = "you followed #{user.fullname}"
    else
      render :new
      flash[:alert] = 'something went wrong'
    end
  end

  def destroy
    user = User.find(params[:id])
    following = Following.find_by(followed_id: params[:id], follower_id: current_user.id)
    if following.destroy
      redirect_back fallback_location: root_path
      flash[:notice] = "you unfollowed #{user.fullname}"
    else
      render :new
      flash[:alert] = 'something went wrong'
    end
  end
end
