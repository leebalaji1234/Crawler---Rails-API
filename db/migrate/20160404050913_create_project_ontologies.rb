class CreateProjectOntologies < ActiveRecord::Migration
  def change
    create_table :project_ontologies do |t|
      t.integer :ontology_id
      t.references :project, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
