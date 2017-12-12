class AddIndexToCourseSubjects < ActiveRecord::Migration[5.1]
  def change
    add_index :course_subjects, [:course_id, :subject_id], unique: true
  end
end
