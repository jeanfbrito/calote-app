class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]

  def create
    @task = Task.find(comment_params[:task_id])
    @comment = Comment.new(comment_params)
    @comments = @task.comments

    if @comment.save
      flash[:success] = 'Your comment was successfully added!'
      redirect_to request.referer
    else
      render 'new'
    end
  end

  def destroy
    @comment_id = @comment.id

    if @comment.destroy
      @response = 'success'
    end
  end

  private

    def comment_params
      params.require(:comment).permit(:user_id, :task_id, :body)
    end

    def set_comment
      @comment = Comment.find(params[:id])
    end
end
