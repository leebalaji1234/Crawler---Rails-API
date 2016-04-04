json.array!(@project_domains) do |project_domain|
  json.extract! project_domain, :id, :domain_id, :project_id, :user_id
  json.url project_domain_url(project_domain, format: :json)
end
