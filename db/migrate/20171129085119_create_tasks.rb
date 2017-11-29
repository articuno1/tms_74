class CreateTasks < ActiveRecord::Migration[5.1]
  def change
    create_table :tasks do |t|
      t.string :name_task
      t.text :detail
      t.references :subject, foreign_key: true

      t.timestamps
    end
    add_index :tasks, :name_task
  end
end
