json.array!(@ontologies) do |ontology|
  json.extract! ontology, :id, :name, :url, :domain_id
  json.url ontology_url(ontology, format: :json)
end
