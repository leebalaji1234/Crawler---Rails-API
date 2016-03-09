class CreateNlpConfigs < ActiveRecord::Migration
  def change
    create_table :nlp_configs do |t|
      t.integer :language, limit: 1
      t.string :lod
      t.string :general_annotations
      t.string :entities_extract
      t.string :opendata
      t.string :spotting_method
      t.string :linking_method
      t.string :disambiguation
      t.references :project, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
