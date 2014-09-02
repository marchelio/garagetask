class TasksController < ApplicationController
  before_action :signed_in_user

  def create
    @task = current_user.tasks.build(task_params)
    @task.priority=@task.project.tasks.count+1
    respond_to do |format|
      format.html { 
        @task.save
        redirect_to root_path 
      }
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
    tasks = @task.destroy.project.tasks.order(:priority)
    i = 0;
    tasks.each { |t| t.update(priority: i+=1) }
    respond_to do |format|
      format.html { redirect_to root_path }
      format.js
    end
  end

  def up
    @task1 = Task.find(params[:task_id])
    @thistasks = @task1.project.tasks
    if @task1.priority<@thistasks.count
      @task2 = @thistasks.find_by(priority: @task1.priority+=1)
      @task2.priority-=1
      @task1.save
      @task2.save
    end
    respond_to do |format|
      format.html { 
        redirect_to root_path 
      }
      format.js
    end
  end

  def down
    @task1 = Task.find(params[:task_id])
    @thistasks = @task1.project.tasks
    if @task1.priority>1
      @task2 = @thistasks.find_by(priority: @task1.priority-=1)
      @task2.priority+=1
      @task1.save
      @task2.save
    end
    respond_to do |format|
      format.html { 
        redirect_to root_path 
      }
      format.js
    end
  end

  private

    def task_params
      params.require(:task).permit(:content,:project_id,:done,:deadline)
    end

end