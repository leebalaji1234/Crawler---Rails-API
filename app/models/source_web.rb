class SourceWeb < ActiveRecord::Base
  belongs_to :scheduler_type
  belongs_to :project
end
