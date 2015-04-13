class IdeasController < ApplicationController
  before_action :authenticate_user! , except: [:index, :show]

  def index
    @ideas = Idea.all
  end

  def show
    find_idea
    @comment = Comment.new
  end

  def new
    @idea = Idea.new
  end

  def create
    @idea = current_user.ideas.new(require_params)

    if @idea.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    find_idea
  end

  def update
    find_idea
    if @idea.update(require_params)
      redirect_to @idea , notice: "Idea Successfully Updated"
    else
      render :edit
    end
  end

  def destroy
    find_idea
    @idea.destroy
    redirect_to root_path
  end

  private

  def require_params
    params.require(:idea).permit(:title, :body)
  end

  def find_idea
    @idea = Idea.find params[:id]
  end

end
