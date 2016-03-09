require 'rest-client'
class SourceWeb < ActiveRecord::Base
  belongs_to :scheduler_type
  belongs_to :project
  after_create :serviceApiCall
  scope :websources, -> {where(project_id: project_id)}
   

  def self.websources(project_id)
  	if project_id.present?
      where(project_id: project_id)
    else
      all
    end
  end
  def serviceApiCall
        # self.url_collection_name
        # self.url_collection
# http://52.76.26.24:8000/admin/addcoll?required=1&addcoll=balaji20151234&defaultValue=1&format=json
          begin
          collectionname = "#{self.url_collection_name}_#{self.id}_#{self.project_id}"
           @ApiResponse = RestClient.get "http://52.76.26.24:8000/admin/addcoll?required=1&addcoll="+collectionname+"&defaultValue=1&format=json"
           if @ApiResponse.resonse.statusCode == 0 && statusMsg == 'Success' 
             return true        
           else
             return false
           end
        rescue
           puts "service call not working propery .gigablast server may be down !"
          # logger_sp2 = ProcessStatus.find_by_process_status('400') 
          # sociallog.process_status_id = logger_sp2.id 
          # sociallog.save
        end 

  end
end
