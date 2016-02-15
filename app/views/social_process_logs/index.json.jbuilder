json.array!(@social_process_logs) do |social_process_log|
  json.extract! social_process_log, :id, :project_id, :user_id, :source_social_id, :process_status_id
  json.url social_process_log_url(social_process_log, format: :json)
end
