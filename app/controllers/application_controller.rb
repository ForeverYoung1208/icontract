class ApplicationController < ActionController::Base

	force_ssl unless: -> { Rails.env.in? ['development', 'test'] }

  include Auth

  protect_from_forgery with: :exception
  before_action :get_current_user




  
end
