class UsersController < ApplicationController
  def index
  	@users = User.all
  	@roles = Role.all
  end

  def show
  	@user = User.find( params[:id] )
  end
end
