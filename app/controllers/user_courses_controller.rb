class UserCoursesController < ApplicationController
  before_action :check_params, only: :create

  def create
    @course.have_user @user
    redirect_to edit_course_path(@course)
  end

  def destroy
    @user_course = UserCourse.find_by user_id: params[:user_id], course_id: params[:id]
    if @user_course.destroy
      redirect_to edit_course_path(@user_course.course)
    else
      redirect_to user_course_path
    end
  end

  def check_params
    @user = User.find_by id: params[:user_id]
    @course = Course.find_by id: params[:course_id]
    unless @course || @user
      flash[:danger] = t "flash.danger2"
      redirect_to user_courses_path
    end
  end
end
