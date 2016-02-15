json.array!(@process_statuses) do |process_status|
  json.extract! process_status, :id, :process_status
  json.url process_status_url(process_status, format: :json)
end
