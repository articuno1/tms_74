class CreateCourses < ActiveRecord::Migration[5.1]
  def change
    create_table :courses do |t|
      t.string :name_course
      t.text :info_detail
      t.date :begin_day
      t.date :end_day
      t.boolean :status_course

      t.timestamps
    end
    add_index :courses, :name_course
  end
end
