class SourceSocial < ActiveRecord::Base
  belongs_to :project
  belongs_to :channel
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
  def statuscall(id)
      SocialProcessLog.getstatus(id) 
  end
  # def as_json(options = {})
  #  super options.merge(methods: [:status])
  # end

   

end
