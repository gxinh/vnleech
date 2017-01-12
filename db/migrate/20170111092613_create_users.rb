class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.integer :role_id
      t.string :password_digest
      t.boolean :delete_flag
      
      t.timestamps null: false
    end
  end
end
