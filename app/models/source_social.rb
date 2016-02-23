require 'rest-client'
class SourceSocial < ActiveRecord::Base
  belongs_to :project
  belongs_to :channel
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
        
        if(self.channel_id == 1) 
          # http://52.74.57.176:8080/SpringRestfulWebServicesWithJSONExample/
           sociallog = SocialProcessLog.new
           sociallog.project_id = self.project_id
           sociallog.user_id = self.project.user_id
           sociallog.source_social_id = self.id
           logger_sp1 = ProcessStatus.find_by_process_status('100') 
           sociallog.process_status_id = logger_sp1.id 
           if sociallog.save 
            begin
            @ApiResponse = RestClient.post "http://52.74.57.176:8080/SpringRestfulWebServicesWithJSONExample/",{"lid": sociallog.id,"sid": self.id,"pid": self.project_id,"uid": self.project.user_id,"feed_limit": self.fb_feed_limit,"access_token": self.access_token,"like_page_id": self.fb_like_page_id}.to_json, :content_type => :json, :accept => :json
            statusCode = @ApiResponse.code
            rescue
              logger_sp2 = ProcessStatus.find_by_process_status('400') 
              sociallog.process_status_id = logger_sp2.id 
              sociallog.save
            end  
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
