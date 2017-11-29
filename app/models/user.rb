class User < ApplicationRecord
  has_many :activities, dependent: :destroy
  has_many :user_courses, dependent: :destroy
  has_many :user_tasks, dependent: :destroy
  has_many :user_subjects, dependent: :destroy
end
