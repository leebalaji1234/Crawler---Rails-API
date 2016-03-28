class WebProcessLog < ActiveRecord::Base
  belongs_to :source_web
  belongs_to :process_status
  belongs_to :project
  belongs_to :user


  def self.getstatus(source_social_id)
  	if source_social_id.present?
      stack = self.find_by_source_social_id(source_social_id) 
    if stack.blank?
      "100"
    else  
      @stackMsg = ProcessStatus.find(stack.process_status_id).process_status
    end
    end
  end 
end
