class ApplicationController < ActionController::Base

	force_ssl if: -> { ENV["ICONTRACT_PROTOCOL"] =='HTTPS'}

  include Auth

  protect_from_forgery with: :exception
  before_action :get_current_user


  
end
