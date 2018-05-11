class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]

  def create
    @task = Task.find(comment_params[:task_id])
    @comment = Comment.new(comment_params)
    @comments = @task.comments
    
    if params[:comment][:files]
      @comment.files.attach(params[:comment][:files])
    end

    if params[:comment][:ancestry].present?
      @comment.ancestry = params[:comment][:ancestry]
    end

    if @comment.save
      flash[:success] = 'Your comment was successfully added!'
    else
      flash[:error] = 'Your comment was not added!'
    end

    redirect_to request.referer
  end

  def destroy
    @comment_id = @comment.id
    
    if @comment.destroy
      if @comment.files.attached?
        @comment.files.find(params[:id]).purge
      end
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
