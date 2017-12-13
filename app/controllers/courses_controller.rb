class CoursesController < ApplicationController
  before_action :load_course, only: %i(show destroy)

  def index
    @courses = Course.order_by_date.paginate page: params[:page], per_page: Settings.per_page
  end

  def new
    @course = Course.new
    @subjects = Subject.all
  end

  def show
    load_subjects @course
    load_trainers_trainees @course
  end

  def create
    @course = Course.new course_params
    if @course.save
      flash[:success] = t "flash.success_create_course"
      redirect_to courses_path
    else
      render :new
    end
  end

  def destroy
    if @course.init?
      if @course.destroy
        flash[:success] = t "flash.success_destroy_course"
      else
        flash[:danger] = t "flash.danger_destroy_course"
      end
    else
      flash[:danger] = t "flash.in_progress"
    end
    redirect_to courses_path
  end

  def load_trainers_trainees course
    @trainers = course.users.with_trainerOrtrainee(:trainer).alphabet_name.paginate page: params[:page],
      per_page: Settings.trainer.per_page
    @trainees = course.users.with_trainerOrtrainee(:trainee).alphabet_name.paginate page: params[:page],
      per_page: Settings.trainer.per_page
  end

  private

  def load_subjects course
    @subjects = @course.subjects.paginate page: params[:page], per_page: Settings.per_page
  end

  def load_course
    @course = Course.find_by id: params[:id]
    return if @course
    flash[:danger] = t "flash.danger1"
    redirect_to courses_path
  end

  def course_params
    params.require(:course).permit(:name_course, :info_detail)
  end
end
