class TasksController < ApplicationController
  before_action :signed_in_user

  def create
    @task = current_user.tasks.build(task_params)
    respond_to do |format|
      format.html { redirect_to root_path }
      format.js
    end
  end

  def update
    @task = Task.find(params[:id])
    @task.update(task_params)
    respond_to do |format|
      format.html { redirect_to root_path }
      format.js
    end
  end

  def destroy
  	@task = Task.find(params[:id])
    @task.destroy
    respond_to do |format|
      format.html { redirect_to root_path }
      format.js
    end
  end

  private

    def task_params
      params.require(:task).permit(:content,:project_id,:done,:deadline)
    end

end