class CreateCourseSubjects < ActiveRecord::Migration[5.1]
  def change
    create_table :course_subjects do |t|
      t.references :course, foreign_key: true
      t.references :subject, foreign_key: true
      t.boolean :status_subject
      t.date :begin_day
      t.date :end_day

      t.timestamps
    end
  end
end
