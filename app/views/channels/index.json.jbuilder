json.array!(@channels) do |channel|
  json.extract! channel, :id, :channel_name
  json.url channel_url(channel, format: :json)
end
