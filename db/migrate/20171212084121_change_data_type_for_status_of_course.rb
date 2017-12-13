class ChangeDataTypeForStatusOfCourse < ActiveRecord::Migration[5.1]
  def change
    change_table :courses do |t|
      t.change :status_course, :integer, default: 0
    end
  end
end
