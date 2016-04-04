json.array!(@project_ontologies) do |project_ontology|
  json.extract! project_ontology, :id, :ontology_id, :project_id, :user_id,:taxonomies
  json.url project_ontology_url(project_ontology, format: :json)
end
