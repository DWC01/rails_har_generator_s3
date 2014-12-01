# TEST URL
# curl -d '{"url":"http://www.google.com", "user_id": "2", "model_name":"ad_tag_validation", "model_id":"01", "id":"01"}' http://localhost:3000/api/test_url/ --header "Accept: application/json" --header "Content-Type: application/json"
module Api
  class FirefoxController < ApplicationController
    protect_from_forgery with: :null_session
    respond_to :json

    def test_url
      url = params[:url]
      puts export_params
      har = HarFile.new(export_params)
      Firefox.export_har(url, har.export_path)
      save_to_s3(har.export_path, har.unique_path, har.file_name)
      render json: har.file_name
    end  

    private

    def save_to_s3(export_path, unique_path, file_name)
      s3 = S3.new(export_path, unique_path, file_name)
      s3.save_har_file
    end

    def export_params
     params.permit(:user_id, :model_name, :model_id, :id)
    end
 
  end
end