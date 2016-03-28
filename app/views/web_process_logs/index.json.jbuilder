json.array!(@web_process_logs) do |web_process_log|
  json.extract! web_process_log, :id, :source_web_id, :process_status_id, :project_id, :user_id
  json.url web_process_log_url(web_process_log, format: :json)
end
