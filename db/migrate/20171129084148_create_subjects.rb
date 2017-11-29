class CreateSubjects < ActiveRecord::Migration[5.1]
  def change
    create_table :subjects do |t|
      t.string :name_subject
      t.text :info_detail

      t.timestamps
    end
    add_index :subjects, :name_subject
  end
end
