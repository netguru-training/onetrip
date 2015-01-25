class TasksController < ApplicationController
  expose(:task, attributes: :task_params)
  expose(:tasks)
  
  def create
    if task.save
      redirect_to task, notice: 'Task was successfully created.'
    else
      render :new
    end
  end

  def update
    if task.save
      redirect_to task, notice: 'Task was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    task.destroy
    redirect_to tasks_url, notice: 'Task was successfully destroyed.'
  end

  private
  
  def task_params
    params.require(:task).permit(:content)
  end
  
end
