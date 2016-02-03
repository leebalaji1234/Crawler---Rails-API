json.array!(@scheduler_types) do |scheduler_type|
  json.extract! scheduler_type, :id, :scheduler_name
  json.url scheduler_type_url(scheduler_type, format: :json)
end
