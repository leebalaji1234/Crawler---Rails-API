class CreateProjectDomains < ActiveRecord::Migration
  def change
    create_table :project_domains do |t|
      t.integer :domain_id
      t.references :project, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
