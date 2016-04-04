class ProjectOntology < ActiveRecord::Base
  belongs_to :project
  belongs_to :user

  scope :projectOntologies, -> {where(project_id: project_id)}
  
  def self.projectOntologies(project_id)

	  	if project_id.present?
	  		logger.info "project func called...#{project_id}"
	      where(project_id: project_id)
	    else
	      all
	    end
  end

end
