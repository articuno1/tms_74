class SessionController < ApplicationController
  def sign_in; end

  def create
    user = User.find_by username: params[:session][:username].downcase
    if user && user.authenticate(params[:session][:password])
      log_in user
      remember_params user
      flash[:success] = t "flash.login_success"
      redirect_back_or user
    else
      flash.now[:danger] = t "flash.user_invalid"
      render :sign_in
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end

  private

  def remember_params user
    params[:session][:remember_me] == Settings.remember.ischeck ? remember(user) : forget(user)
  end
end
