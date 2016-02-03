json.array!(@source_webs) do |source_web|
  json.extract! source_web, :id, :url_collection_name, :url_collection, :scheduler_type_id, :project_id, :created_at
  json.url source_web_url(source_web, format: :json)
end
