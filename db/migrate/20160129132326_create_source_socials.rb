class CreateSourceSocials < ActiveRecord::Migration
  def change
    create_table :source_socials do |t|
      t.string :collection_name, limit: 45
      t.string :fb_like_page_id, limit: 400
      t.string :access_token, limit: 400
      t.integer :fb_feed_limit
      t.string :consumer_key, limit: 400
      t.string :consumer_secret, limit: 400
      t.string :access_secret, limit: 400
      t.string :geo_lat, limit: 45
      t.string :geo_lon, limit: 45
      t.string :twitter_hastags, limit: 2000
      t.integer :instagram_start_time
      t.integer :instagram_end_time
      t.string :instagram_tags, limit: 2000
      t.references :project, index: true, foreign_key: true
      t.references :channel, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
