class ChangeColumnOntologyIdToProjectOntologies < ActiveRecord::Migration
  def change
  	change_column :project_ontologies, :ontology_id, :string
  	add_column :project_ontologies, :taxonomies, :string, limit: 2000
  end
end
