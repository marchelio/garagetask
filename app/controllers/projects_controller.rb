class ProjectsController < ApplicationController
  before_action :signed_in_user

  def create
  	@project = current_user.projects.build
    respond_to do |format|
      format.html { 
        redirect_to root_path 
        @project.save
      }
      format.js
    end
  end

  def update
    @project = Project.find(params[:id])
    @project.update(project_params)
    respond_to do |format|
      format.html { redirect_to root_path }
      format.js
    end
  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy
    respond_to do |format|
      format.html { redirect_to root_path }
      format.js
    end
  end

  private

    def project_params
      params.require(:project).permit(:title)
    end

end