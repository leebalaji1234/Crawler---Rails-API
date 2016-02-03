json.array!(@projects) do |project|
  json.extract! project, :id, :project_name, :project_description, :user_id
  json.url project_url(project, format: :json)
end
