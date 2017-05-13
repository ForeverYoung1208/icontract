class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  ::SUPERUSERS = ['ForeverYoung','admin']  
  
end
