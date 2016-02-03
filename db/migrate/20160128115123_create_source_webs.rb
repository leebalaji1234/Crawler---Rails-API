class CreateSourceWebs < ActiveRecord::Migration
  def change
    create_table :source_webs do |t|
      t.string :url_collection_name, limit: 45
      t.string :url_collection, limit: 2000
      t.references :scheduler_type, index: true, foreign_key: true
      t.references :project, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
