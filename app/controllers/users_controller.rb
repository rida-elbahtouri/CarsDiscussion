class UsersController < ApplicationController
    def index
        if params[:term]==''
           @results = User.all 
        else
            @results = User.all.where("lower(username)  LIKE :search OR lower(fullname)  LIKE :search", search: params[:term] )
        end
        end
    def show
        @user=User.find(params[:id])
        @followedby=@user.followers
    end
    def new
        @user=User.new
    end

    def create
        @user=User.new(user_params)
        if @user.save
            redirect_to root_path
            flash[:notice] = "user has been successfully created"
            session[:current_user] = @user.id
        else
            render :new
            flash[:alert] = "we couldn't sign you up because of this reasons:"
        end
    end

    private
    def user_params
        params.require(:user).permit(:username, :fullname,:photo,:cover_image)
    end


end