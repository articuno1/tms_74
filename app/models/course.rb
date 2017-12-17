class Course < ApplicationRecord
  has_many :user_courses, dependent: :destroy
  has_many :course_subjects, dependent: :destroy
  accepts_nested_attributes_for :course_subjects
  has_many :subjects, through: :course_subjects
  has_many :users, through: :user_courses
  has_many :having, through: :course_subjects, source: :subject

  scope :order_by_date, ->{order created_at: :desc}

  enum status_course: {init: 0, in_progess: 1, finish: 2}
  validates :name_course, presence: true
  def have subject
    having << subject
  end

  def unhave subject
    having.delete subject
  end
end
