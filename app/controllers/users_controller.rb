class UsersController < ApplicationController
  def index
  	@users = User.all

    respond_to do |format|
    	format.html do
		  	@roles = Role.all
    	end
    	format.json do
    		render json: @users.map{ |u| {id: u.id, email: u.email, name: u.name, roles: u.roles.all } }
    	end

    end  	
  end

  def show
  	@user = User.find( params[:id] )
  end

  def update_roles
    logger.debug('---------- '+params.inspect)
    logger.debug('========== '+JSON.parse(params).inspect)
  end

end
