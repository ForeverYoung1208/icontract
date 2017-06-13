class UsersController < ApplicationController
  def index
  	@users = User.all

    respond_to do |format|
    	format.html do
		  	@roles = Role.all
    	end
    	format.json do
    		render json: @users
    	end

    end  	
  end

  def show
  	@user = User.find( params[:id] )
  end
end
