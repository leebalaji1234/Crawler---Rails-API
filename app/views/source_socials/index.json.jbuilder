json.array!(@source_socials) do |source_social|
  json.extract! source_social, :id, :collection_name, :fb_like_page_id, :access_token, :fb_feed_limit, :consumer_key, :consumer_secret, :access_secret, :geo_lat, :geo_lon, :twitter_hastags, :instagram_start_time, :instagram_end_time, :instagram_tags, :project_id, :channel_id,:created_at

  json.status source_social.statuscall(source_social.id)
   
  json.url source_social_url(source_social, format: :json)
end
