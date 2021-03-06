class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :password
      t.string :first_name
      t.string :last_name
      t.integer :is_active, limit: 1
      t.integer :is_delete_account, limit: 1
      t.references :company, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
