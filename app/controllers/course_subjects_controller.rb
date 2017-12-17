class CourseSubjectsController < ApplicationController
  before_action :check_params, only: :create

  def create
    @course.have @subject
    redirect_to @course
  end

  def destroy
    @course_subject = CourseSubject.find_by subject_id: params[:subject_id], course_id: params[:id]
    if @course_subject.destroy
      redirect_to @course_subject.course
    else
      redirect_to course_subjects_path
    end
  end

  def check_params
    @subject = Subject.find_by id: params[:subject_id]
    @course = Course.find_by id: params[:course_id]
    unless @course || @subject
      flash[:danger] = t "flash.danger2"
      redirect_to course_subjects_path
    end
  end
end
