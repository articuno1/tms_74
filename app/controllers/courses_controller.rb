class CoursesController < ApplicationController
  before_action :load_course, only: :show

  def index
    @courses = Course.order_by_date.paginate page: params[:page], per_page: Settings.per_page
  end

  def show
    @subjects = @course.subjects.paginate page: params[:page], per_page: Settings.per_page
  end

  private

  def load_course
    @course = Course.find_by id: params[:id]
    return if @course
    flash[:danger] = t "flash.danger1"
    redirect_to courses_path
  end
end
