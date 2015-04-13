class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    find_idea
    @comment = current_user.comments.new(comment_params)
    @comment.idea = @idea

    if @comment.save
      redirect_to @idea, notice: "Comment Created"
    else
      render "ideas/show"
    end
  end

  def destroy
    find_idea
    find_comment
    @comment.delete
    redirect_to @idea, notice: "Comment Deleted"
  end

  def edit
    find_idea
    find_comment
  end

  def update
    find_idea
    find_comment
    if @comment.update(comment_params)
      redirect_to @idea , notice: "Comment Successfully Updated"
    else
      render :edit
    end
  end
  
  private

  def find_idea
    @idea = Idea.find params[:idea_id]
  end

  def find_comment
    @comment = Comment.find params[:id]
  end

  def comment_params
    params.require(:comment).permit(:body)
  end
end
