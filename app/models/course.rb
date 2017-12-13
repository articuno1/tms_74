class Course < ApplicationRecord
  has_many :user_courses, dependent: :destroy
  has_many :course_subjects, dependent: :destroy
  has_many :subjects, through: :course_subjects
  has_many :users, through: :user_courses

  scope :order_by_date, ->{order created_at: :desc}

  enum status_course: {init: 0, in_progess: 1, finish: 2}
end
