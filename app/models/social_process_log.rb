class SocialProcessLog < ActiveRecord::Base
  belongs_to :project
  belongs_to :user
  belongs_to :source_social
  belongs_to :process_status

  
end
