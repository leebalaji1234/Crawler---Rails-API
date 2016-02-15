class SourceWeb < ActiveRecord::Base
  belongs_to :scheduler_type
  belongs_to :project
  scope :websources, -> {where(project_id: project_id)}
   

  def self.websources(project_id)
  	if project_id.present?
      where(project_id: project_id)
    else
      all
    end
  end
end
