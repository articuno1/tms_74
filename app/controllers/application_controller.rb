class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionHelper
  def load_user
    @user = User.find_by id: params[:id]
    return if @user
    flash[:warning] = t "flash.load_user"
    redirect_to users_path
  end
end
