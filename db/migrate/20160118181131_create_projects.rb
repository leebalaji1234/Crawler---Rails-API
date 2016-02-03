class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :project_name
      t.string :project_description, limit: 1000
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
