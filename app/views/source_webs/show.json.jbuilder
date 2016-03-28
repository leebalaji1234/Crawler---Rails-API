json.extract! @source_web, :id, :url_collection_name, :url_collection, :scheduler_type_id, :project_id, :created_at, :updated_at
json.status @source_web.statuscall(@source_social.id)
