class UsersController < ApplicationController
  before_action :find_user, except: %i(create new index)
  before_action :logged_in_user, only: %i(edit update create)
  before_action :correct_user, only: %i(edit update)
  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      log_in @user
      flash[:success] = t "flash.signup_success"
      redirect_to @user
    else
      render :new
    end
  end

  def show; end

  def edit; end

  def update
    if @user.update_attributes(user_params)
      flash[:success] = t "flash.updated"
      redirect_to @user
    else
      render :edit
    end
  end

  private

  def correct_user
    @user = User.find_by id: params[:id]
    redirect_to root_url unless @user == current_user
  end

  def find_user
    @user = User.find_by id: params[:id]
    return if @user
    flash[:danger] = t "flash.danger"
    redirect_to signup_path
  end

  def logged_in_user
    return if logged_in?
    store_location
    flash[:danger] = t "flash.please"
    redirect_to signin_url
  end

  def user_params
    params.require(:user).permit(:avatar, :username, :password,
      :password_confirmation, :fullname, :role, :university)
  end
end
