require 'rest-client'
require 'json'
require 'uri'
class SourceWeb < ActiveRecord::Base
  belongs_to :scheduler_type
  belongs_to :project
  has_one :web_process_log, dependent: :destroy

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

#password
#ref=7&c=main&pwd=123456

       weblog = WebProcessLog.new
       weblog.project_id = self.project_id
       weblog.user_id = self.project.user_id
       weblog.source_web_id = self.id
       logger_sp1 = ProcessStatus.find_by_process_status('100') 
       weblog.process_status_id = logger_sp1.id 
       if weblog.save
           
          # raise @collectionname.inspect 
          begin
            cname = self.url_collection_name
         @collectionname = "#{cname}_#{self.id}_#{self.project_id}"
           # @ApiResponse = RestClient.get "http://52.76.26.24:8000/admin/addcoll?required=1&addcoll=#{self.url_collection_name}_#{self.id}_#{self.project_id}&defaultValue=1&format=json"
           # # raise @ApiResponse.inspect
           # if @ApiResponse.resonse.statusCode == 0 && statusMsg == 'Success' 
           #      @ApiResponse1 = RestClient.get "http://52.76.26.24:8000/admin/addcoll?required=1&addcoll=#{self.url_collection_name}_#{self.id}_#{self.project_id}&defaultValue=1&format=json"     
           #      if @ApiResponse1.resonse.statusCode == 0 && statusMsg == 'Success'
           #       #{"Collectionname":"Khivraj","inputkeywords":"Khivraj+chennai","keywordtype":"CSV","RAKE":"rakeInstance","pid":"1","lid":"3","sid":"3","uid":"2","parsing_msg":"parsing in progress","page":"page no","post":"post no"} 
           #         @ApiResponse2 = RestClient.post "http://52.74.57.176:8080/product-1.0.0-BUILD-SNAPSHOT/web/",{"lid": '#{sociallog.id}',"sid": '#{self.id}',"pid": '#{self.project_id}',"uid": '#{self.project.user_id}',"AccessToken": self.access_token,"ConsumerKey": self.consumer_key,"ConsumerSecret": self.consumer_secret,"AccessTokenSecret": self.access_secret,"isHashTag":true,"Hash_tagName": self.twitter_hashtags}.to_json, :content_type => :json, :accept => :json
           #      end
           # else
           #   return false
           # end
           @ApiResponse = RestClient.get "http://52.76.26.24:8000/admin/addcoll?required=1&addcoll=#{@collectionname}&defaultValue=1&format=json"
           logger.info "gigablast collection processing --> http://52.76.26.24:8000/admin/addcoll?required=1&addcoll=#{@collectionname}&defaultValue=1&format=json"
           parsedResponse = JSON.parse(@ApiResponse)
           hash = {}
           hash = parsedResponse 
           logger.info "Gigablast collection api response for [#{@collectionname}] " + parsedResponse.to_json

           if hash["response"]["statusCode"] == 0 && hash["response"]["statusMsg"] == 'Success' 
#               string = <<EOD

#   ',. whatever <"",'
logger.info "gigablast urllist processing--for [#{@collectionname}]-->"
# EOD
@urls = <<EOD 
#{self.url_collection}
EOD
            @ApiResponse1 = RestClient.post "http://52.76.26.24:8000/admin/settings",{:c => @collectionname, 'sitelist' => @urls,'action'=>'Submit'}{ |response, request, result, &block|
  case response.code
  when 200
    logger.info "gigablast processed and response back--to [#{@collectionname}]-->"
    logger.info "-------------------------------->"
    logger.info "-------------------------------->" 
    logger.info "java service initiated"
    logger.info "-------------------------------->" 
    logger.info "java service processing=>#{self.project_id}--------->" 
    if self.project_id.present?
      logger.info "project ontology initiated"
      logger.info "-------------------------------->" 
      @ontologyList = ProjectOntology.projectOntologies(self.project_id)
      # raise @ontologyList.inspect
      logger.info "project ontology lists are::=> #{@ontologyList[0].ontology_id}"
      if @ontologyList[0].taxonomies.present?
        # RestClient.post "http://192.168.1.53:8080/product-1.0.0-BUILD-SNAPSHOT/web/",{"Collectionname": @collectionname,"inputkeywords": @ontologyList.taxonomies,"keywordtype":"CSV","RAKE":"rakeInstance","lid": weblog.id,"sid": self.id,"pid": self.project_id ,"uid":  self.project.user_id}.to_json, :content_type => :json, :accept => :json
      end
      if @ontologyList[0].ontology_id.present?
        logger.info "project ontology before proceeding::=> #{@ontologyList[0].ontology_id}"
        @masterOnlist = (@ontologyList[0].ontology_id).split(',')
        logger.info "master ontology lists are :::#{@masterOnlist}"
        @objOnList = Ontology.ontologylists(@masterOnlist)
        logger.info "ontology lists are :::#{@objOnList}"
        # RestClient.post "http://192.168.1.53:8080/product-1.0.0-BUILD-SNAPSHOT/web/",{"Collectionname": @collectionname,"inputkeywords": @ontologyList.taxonomies,"keywordtype":"OWL","RAKE":"rakeInstance","lid": weblog.id,"sid": self.id,"pid": self.project_id ,"uid":  self.project.user_id}.to_json, :content_type => :json, :accept => :json
      end
    end
    
  else
    response.return!(request, result, &block)
  end
}

#debug on local
# RestClient.post "http://localhost/debug.php",{:c => @collectionname, 'sitelist' =>"http://www.google.com",'action'=>'Submit'}



           end

           # RestClient.post "http://192.168.1.53:8080/product-1.0.0-BUILD-SNAPSHOT/web/",{"Collectionname": @collectionname,"inputkeywords":"Khivraj+chennai","keywordtype":"CSV","RAKE":"rakeInstance","lid": weblog.id,"sid": self.id,"pid": self.project_id ,"uid":  self.project.user_id}.to_json, :content_type => :json, :accept => :json

        rescue => e
        # raise e.inspect  
           # puts "service call not working propery .gigablast server may be down #{e}!"
          logger_sp2 = ProcessStatus.find_by_process_status('200') 
          weblog.process_status_id = logger_sp2.id 
          weblog.save
        end 
      end 

  end
  def statuscall(id)
    if id.present?
      WebProcessLog.getstatus(id) 
    end
  end
end
