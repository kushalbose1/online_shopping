
class SessionsController < ApplicationController

  def new
  end
    skip_before_action :login_require, only: [:new, :create]


  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      params[:session][:remember_me] == '1' ? remember(user) : forget(user)
      remember user
      redirect_to user
    else
      flash.now[:alert] = "Invalid login/password combination"
      render :action => 'new'
    end
  end
  def destroy
    log_out if logged_in?
    session[:user_id] = nil 
    redirect_to root_path, notice: 'logged out'
  end  
end
