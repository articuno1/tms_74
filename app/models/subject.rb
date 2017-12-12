class Subject < ApplicationRecord
  has_many :user_subjects, dependent: :destroy
  has_many :course_subjects, dependent: :destroy
  has_many :tasks, dependent: :destroy
  has_many :courses, through: :course_subjects

  scope :find_subjects_not_in_course, ->(course){where("id NOT IN(?)", course.subject_ids) if course.subject_ids.present?}
  scope :subject, ->(subject_ids){where "id in (?)",subject_ids}
end
