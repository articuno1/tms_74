class AddIndexToUsersCourse < ActiveRecord::Migration[5.1]
  def change
    add_index :user_courses, [:user_id, :course_id], unique: true
  end
end
