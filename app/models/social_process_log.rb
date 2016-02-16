class SocialProcessLog < ActiveRecord::Base
  belongs_to :project
  belongs_to :user
  belongs_to :source_social
  belongs_to :process_status  
   
  scope :getstatus, -> {where(source_social_id: source_social_id)} 

  def self.getstatus(source_social_id)
  	if source_social_id.present?
      @stack = self.where(source_social_id: source_social_id).first 
      @stackMsg = ProcessStatus.find(@stack.process_status_id).process_status
    else
      all
    end
  end 


end
