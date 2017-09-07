class ApplicationController < ActionController::API
  include DeviseTokenAuth::Concerns::SetUserByToken
  
  before_filter :ensure_json_request
  before_action :authenticate_user!
  skip_before_filter :authenticate_user!, if: :devise_controller?

  def ensure_json_request
    unless request.headers["Accept"] =~ /json/
      render :nothing => true, :status => 406
    end
    unless request.get?
      return if request.headers["Content-Type"] =~ /json/
      render :nothing => true, :status => 415
    end
  end
end
