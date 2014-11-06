class SessionsController < ApplicationController

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      sign_in user
    else
      flash[:error] = 'Invalid email/password combination'
    end
    redirect_to root_path
  end

  def destroy
    sign_out
    redirect_to root_url
  end

end
