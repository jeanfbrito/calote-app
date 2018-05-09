class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  def index
    @tasks = Task.roots.all
  end

  def show
  end

  def new
    @task = Task.new
  end

  def edit
  end

  def create
    @task = Task.new(task_params)
    @task.save
    render :edit
  end

  def update
    @task.update(task_params)
    redirect_to tasks_path
  end

  def destroy
    @task.destroy
    redirect_to tasks_path
  end

  private
    def set_task
      @task = Task.find(params[:id])
    end

    def task_params
      params.require(:task).permit(
        :title, :description, :status, 
        :priority, :delivery_date, :manager_id,
        user_ids: [],
        subtasks_attributes: [:id, :title, :description, :status, :priority, :delivery_date, user_ids: [] ])
    end
end
