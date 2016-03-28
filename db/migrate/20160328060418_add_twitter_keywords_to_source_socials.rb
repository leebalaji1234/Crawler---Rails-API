class AddTwitterKeywordsToSourceSocials < ActiveRecord::Migration
  def change
  	add_column :source_socials, :twitter_keywords, :string, limit: 2000
  end
end
