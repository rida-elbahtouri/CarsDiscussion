class UsersController < ApplicationController
  def index
    @results = if params[:term] == ''
                 User.all
               else
                 User.all.where('lower(username)  LIKE :search OR lower(fullname)  LIKE :search', search: params[:term])
               end
  end
end
