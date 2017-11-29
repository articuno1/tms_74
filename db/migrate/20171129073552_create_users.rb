class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :fullname
      t.string :username
      t.string :password_digest
      t.boolean :gender
      t.integer :role
      t.string :avatar
      t.string :university

      t.timestamps
    end
    add_index :users , :username, unique: true
  end
end
