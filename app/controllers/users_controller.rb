class UsersController < ApplicationController
  before_action :correct_user,   only: :show

  def show
    @user = User.find(params[:id])
    @projects = @user.projects
    @project = current_user.projects.build if signed_in?
    @tasks = {}
    @projects.each { |p| 
      @tasks[p.id]=p.tasks
    }
    @task = @user.tasks.build
  end

  def new
  	@user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      sign_in @user
      redirect_to root_path
    else
      render 'new'
    end
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end
  
end
