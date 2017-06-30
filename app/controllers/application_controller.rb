class ApplicationController < ActionController::Base

  include Auth

  protect_from_forgery with: :exception
  before_action :get_current_user




  ::SUPERUSERS = ['ForeverYoung','admin']  

  ::ADMIN_ROLLE_ID = 1
  ::USER_ROLE_ID = 2
  ::ACCOUNTANT_ROLE_ID = 3

  
end
