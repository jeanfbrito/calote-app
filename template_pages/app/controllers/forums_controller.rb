class ForumsController < ApplicationController
  before_action :set_forum, only: [:show, :edit, :update, :destroy]

  def index
    @forums = Forum.all
  end

  def show
  end

  def new
    @forum = Forum.new
  end

  def edit
  end

  def create
    @forum = Forum.create(forum_params)
    respond_with @forum, location: forums_path
  end

  def update
    @forum.update(forum_params)
    respond_with @forum, location: forums_path
  end

  def destroy
    @forum.destroy
    respond_with @forum
  end

  private
    def set_forum
      @forum = Forum.find(params[:id])
    end

    def forum_params
      params.require(:forum).permit(:name)
    end
end
