json.array!(@nlp_configs) do |nlp_config|
  json.extract! nlp_config, :id, :language, :lod, :general_annotations, :entities_extract, :opendata, :spotting_method, :linking_method, :disambiguation, :project_id
  json.url nlp_config_url(nlp_config, format: :json)
end
