require 'rest-client'
class SourceSocial < ActiveRecord::Base
  belongs_to :project
  belongs_to :channel
  has_one :social_process_log, dependent: :destroy
  after_create :serviceApiCall
  scope :channels, -> {where(channel_id: channel_id)}
   
  scope :projectChannels, -> {where(project_id: project_id,channel_id: channel_id)}

  def self.channels(channel_id)
  	if channel_id.present?
      where(channel_id: channel_id)
    else
      all
    end
  end

  def self.projectChannels(project_id,channel_id)
  	if channel_id.present? && project_id.present?
  		where(project_id: project_id,channel_id: channel_id)
  	else
  		all
  	end
  end

  def serviceApiCall
        
        
          # http://52.74.57.176:8080/SpringRestfulWebServicesWithJSONExample/
           sociallog = SocialProcessLog.new
           sociallog.project_id = self.project_id
           sociallog.user_id = self.project.user_id
           sociallog.source_social_id = self.id
           logger_sp1 = ProcessStatus.find_by_process_status('100') 
           sociallog.process_status_id = logger_sp1.id 
           if sociallog.save 
            
            begin
             if(self.channel_id == 1)  
              # Facebook service api configuration
              @ApiResponse = RestClient.post "http://52.74.57.176:8080/product-1.0.0-BUILD-SNAPSHOT/keys/",{"lid": sociallog.id,"sid": self.id,"pid": self.project_id,"uid": self.project.user_id,"feed_limit": self.fb_feed_limit,"access_token": self.access_token,"like_page_id": self.fb_like_page_id}.to_json, :content_type => :json, :accept => :json
              statusCode = @ApiResponse.code
             end
             if(self.channel_id == 2)
                if((self.geo_lat.present?) && (self.geo_lon.present?))
                   RestClient.post "http://52.74.57.176:8080/TwitterStreaming-1.0.0-BUILD-SNAPSHOT/twitter/",{"lid": sociallog.id.to_s,"sid": self.id.to_s,"pid": self.project_id.to_s,"uid": self.project.user_id.to_s,"AccessToken": self.access_token,"ConsumerKey": self.consumer_key,"ConsumerSecret": self.consumer_secret,"AccessTokenSecret": self.access_secret,"Latitude": self.geo_lat,"Longitude": self.geo_lon,"keywords": self.twitter_keywords}.to_json, :content_type => :json, :accept => :json
                end
                if((self.twitter_hastags.present?))
                     RestClient.post "http://52.74.57.176:8080/TwitterStreaming-1.0.0-BUILD-SNAPSHOT/twitter/",{"lid": sociallog.id.to_s,"sid": self.id.to_s,"pid": self.project_id.to_s,"uid": self.project.user_id.to_s,"AccessToken": self.access_token,"ConsumerKey": self.consumer_key,"ConsumerSecret": self.consumer_secret,"AccessTokenSecret": self.access_secret,"isHashTag":true,"Hash_tagName": self.twitter_hastags}.to_json, :content_type => :json, :accept => :json
                end 
              end
             if(self.channel_id == 3)  

              # instagram service api configuration
              # geo - > http://52.74.57.176:8080/product-1.0.0-BUILD-SNAPSHOT/geo/
              # geo params -> {"latitude":"1.3000","longitude":"103.8000","distance":"50000","access_token":"2690601129.1fb234f.ab46ef41c8f64652b00fb6499b7914f2","pid":"1","lid":"3","sid":"1","uid":"2"}
              if((self.geo_lat.present?) && (self.geo_lon.present?))
                 RestClient.post "http://52.74.57.176:8080/product-1.0.0-BUILD-SNAPSHOT/geo/",{"lid": sociallog.id,"sid": self.id,"pid": self.project_id,"uid": self.project.user_id,"latitude": self.geo_lat,"longitude": self.geo_lon,"distance":"50000","access_token": self.access_token}.to_json, :content_type => :json, :accept => :json
              end
              # tag - > http://52.74.57.176:8080/product-1.0.0-BUILD-SNAPSHOT/tags/
              #tag params ->  {"Tags":"airasia","access_token":"2206980605.1fb234f.82cd96b751324e87942cd3f84d8957ef","pid":"1","lid":"3","sid":"1","uid":"2"}

              if((self.instagram_tags.present?))
                # raise self.instagram_tags.inspect
                 RestClient.post "http://52.74.57.176:8080/product-1.0.0-BUILD-SNAPSHOT/tags/",{"lid": sociallog.id,"sid": self.id,"pid": self.project_id,"uid": self.project.user_id,"Tags": self.instagram_tags,"access_token": self.access_token}.to_json, :content_type => :json, :accept => :json
              end
              # statusCode = @ApiResponse.code
             end
            rescue 
               
              logger_sp2 = ProcessStatus.find_by_process_status('200') 
              sociallog.process_status_id = logger_sp2.id 
              sociallog.save
            end  
           end 
        

  end

  def statuscall(id)
    if id.present?
      SocialProcessLog.getstatus(id) 
    end
  end
  # def as_json(options = {})
  #  super options.merge(methods: [:status])
  # end

   

end
