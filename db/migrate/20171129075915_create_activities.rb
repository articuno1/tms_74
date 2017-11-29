class CreateActivities < ActiveRecord::Migration[5.1]
  def change
    create_table :activities do |t|
      t.references :user, foreign_key: true
      t.integer :target_id
      t.string :type_object
      t.integer :action

      t.timestamps
    end
  end
end
