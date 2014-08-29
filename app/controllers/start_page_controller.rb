class StartPageController < ApplicationController

  def home
  	if signed_in?
      @user = User.find(current_user.id)
      @projects = @user.projects
      @tasks = {}
      @projects.each { |p| 
        @tasks[p.id]=p.tasks
      }
	  end
  end

end
