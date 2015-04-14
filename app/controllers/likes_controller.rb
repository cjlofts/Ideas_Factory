class LikesController < ApplicationController
  before_action :authenticate_user!

  def create
    idea = Idea.find params[:idea_id]
    join = current_user.likes.new
    join.idea = idea
    if join.save
      redirect_to root_path, notice: "Liked!"
    else
      redirect_to root_path, notice: "Not Liked"
    end
  end

  def destroy
    join = current_user.likes.find params[:id]
    join.destroy
    redirect_to root_path, notice: "No Longer Liked"
  end
end
