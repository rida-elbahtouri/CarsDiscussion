class ThoughtsController < ApplicationController
  before_action :authenticate_user!
  def show
    @thought = Thought.find(params[:id])
  end

  def index
    @thought = Thought.new
    @thoughts = current_user.followedthought
  end

  def new
    @thought = Thought.new
  end

  def create
    @thought = current_user.thoughts.build(thoughts_params)
    if @thought.save
      redirect_to root_path
      flash[:notice] = 'your news has been published'
    else
      render :new
      flash[:alert] = 'something went wrong'
    end
  end

  private

  def thoughts_params
    params.require(:thought).permit(:text)
  end
end
