class CoursesController < ApplicationController
  before_action :load_course, :load_subjects, only: %i(show destroy)

  def index
    @courses = Course.order_by_date.paginate page: params[:page],
      per_page: Settings.per_page
  end

  def new
    @course = Course.new
    @course.course_subjects.build
    @subjects = Subject.all
  end

  def show
    load_trainers_trainees @course
    @all_subjects = Subject.find_subjects_not_in_course @course
    @subjects = @course.subjects
  end

  def create
    subject_ids = params[:subject][:subject_ids]
    @course = Course.new course_params
    if @course.save
      flash[:success] = t "flash.success_create_course"
      subject_ids.each do |subject_id|
        @course_subjects = @course.course_subjects.new
        @course_subjects.subject_id = subject_id
        @course_subjects.save
      end
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

  def load_subjects
    @subjects = @course.subjects.paginate page: params[:page], per_page: Settings.per_page
    @course_subjects = @course.course_subjects.paginate page: params[:page], per_page: Settings.per_page
  end

  def load_course
    @course = Course.find_by id: params[:id]
    return if @course
    flash[:danger] = t "flash.danger1"
    redirect_to courses_path
  end

  def course_params
    params.require(:course).permit(:name_course, :info_detail,
      course_subjects_attributes: [:id, :subject_id])
  end
end
