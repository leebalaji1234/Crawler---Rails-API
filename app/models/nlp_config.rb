class NlpConfig < ActiveRecord::Base
  belongs_to :project 
  scope :projectNlpConfigs, -> {where(project_id: project_id)}

   def self.projectNlpConfigs(project_id)
  	if project_id.present?
      where(project_id: project_id)
    else
      all
    end
   end

    


end
