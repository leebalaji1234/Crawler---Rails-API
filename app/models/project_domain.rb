class ProjectDomain < ActiveRecord::Base
  belongs_to :project
  belongs_to :user

  scope :projectDomains, -> {where(project_id: project_id)}
  
  def self.projectDomains(project_id)
	  	if project_id.present?
	      where(project_id: project_id)
	    else
	      all
	    end
   end
end
