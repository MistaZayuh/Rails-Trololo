class TasksController < ApplicationController
  before_action :set_list
  before_action :set_task, only: [:show, :edit, :update, :destroy]
  def show
  end

  def new
    @task = @list.tasks.new
  end

  def create
    Task.create_task(task_params, @list.id)
    redirect_to 
  end

  def edit
  end

  def update
    Task.update_task(@task.id, task_params)
    redirect_to list_task_path(@list, @task)
  end

  def destroy
    Task.delete_task(@task.id)
    redirect_to list_path(@list)
  end

  private
  def set_list
    @list = List.find(params[:list_id])
  end

  def set_task
    @task = Task.find(params[:id])
  end

  def task_params
    params.require(:task).permit(:name, :description)
  end
end
