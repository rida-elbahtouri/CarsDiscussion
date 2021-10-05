class FollowingsController < ApplicationController
    before_action :authenticate_user!
    
    def new
    end

    def create
      if @photo = current_user.create_photo(photo_params)
        redirect_back fallback_location: root_path
        flash[:notice] = "your photoes were saved successfully"
      else
        redirect_back fallback_location: root_path
        flash[:alert] = 'something went wrong'
      end
    end
    
    def edit
        @photo = current_user.photo
    end

    def update
        if @photo = current_user.photo.update(photo_params)
        redirect_back fallback_location: root_path
        flash[:notice] = "your photoes were saved successfully"
      else
        redirect_back fallback_location: root_path
        flash[:alert] = 'something went wrong'
      end
    end

    def destroy
      
      if current_user.photo.destroy
        redirect_back fallback_location: root_path
        flash[:notice] = "you deleted your photoes"
      else
        redirect_back fallback_location: root_path
        flash[:alert] = 'something went wrong'
      end
    end
  end
  