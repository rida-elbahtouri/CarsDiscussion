class ThoughtsController < ApplicationController
    before_action :check_user!
    def show
        @thought = Thought.find(params[:id])
    end
    def index
        user=User.find(check_user)
        @thought=Thought.new
        @thoughts= followedthought(user)
    end
    def new
        @thought = Thought.new
    end
    
    def create
        user=User.find(check_user)
        @thought=user.thoughts.build(thoughts_params)
        if @thought.save
            redirect_to root_path
            flash[:notice] = "your news has been published"
        else
            render :new
            flash[:alert] = "something went wrong"
        end
    end

    private
    def thoughts_params
        params.require(:thought).permit(:text)
    end

    def followedthought(user)
        followeds = user.followers.pluck(:followed_id).push(check_user)
        thought = Thought.where(author_id: followeds).ordered_by_most_recent
    end

    
end