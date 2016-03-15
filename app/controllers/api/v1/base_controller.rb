 
class Api::V1::BaseController < ApplicationController

	protect_from_forgery with: :null_session 

    before_action :destroy_session, :authenticate_app!
     
	 
	def destroy_session
		request.session_options[:skip] = true
	end

	def authenticate_app!
		# authenticate_with_http_token do |token, options|
  #         # service ticket verification 
  #       end
			xauth = request.headers["x-auth"];
			begin
			@ApiResponse =  RestClient.get 'http://192.168.1.75:7777/casserviceValidate', {:params => {:ticket => xauth, 'service' => 'http://52.74.156.37/btinfoactivweb/home.html'}}
			statusCode =  JSON.parse(@ApiResponse)
			 if statusCode["msg"]=='failure'
			  render :json => statusCode
			 end
			rescue => e
			  puts "ERROR: #{e}"
			end
	end
end
