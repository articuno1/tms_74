class UsersController < ApplicationController
  before_action :logged_in_user, except: :new
  before_action :find_user, except: %i(create new index)
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

  def index
    @users = User.paginate page: params[:page], per_page: Settings.per_page
  end

  def edit; end

  def update
    if @user.update_attributes(user_params)
      flash[:success] = t "flash.updated"
      redirect_to @user
    else
      render :edit
    end
  end

  def destroy
    if @user.destroy
      flash[:success] = t "flash.delete"
    else
      flash[:danger] = t "flash.undelete"
    end
    redirect_to users_path
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

  def load_user
    @user = User.find_by id: params[:id]
    return if @user
    flash[:warning] = "Please, resignin"
    redirect_to signin_path
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

  def trainer_user
    return if current_user.trainer?
    flash[:danger] = t "flash.nottrainer"
    redirect_to users_path
  end
end
