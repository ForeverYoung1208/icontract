class UsersController < ApplicationController
  def index
  	@users = User.all

    respond_to do |format|
    	format.html do
		  	@roles = Role.all
    	end
    	format.json do
    		render json: @users.map{ |u| {id: u.id, email: u.email, name: u.name, roles: u.roles.active.map{|r| r.id} } }, staus: :ok
    	end

    end  	
  end

  def show
  	@user = User.find( params[:id] )
  end

  def update_roles
    # logger.debug('=========================================================================')
    # logger.debug( params["_json"][0][:name] )
    # logger.debug('=========================================================================')

    all_roles = {}
    params["_json"].each do |u|
      u[:roles].each do |r|
        all_roles[r] ||= []
        all_roles[r] << u[:id]
      end
    end

    RolesUser.update_all( deleted_at: DateTime.now)
    all_roles.each do |role_id, users_ids|
      role = Role.find(role_id)
      role.bind_to_users!(users_ids)
    end

    render json: :none, staus: :ok

  end

end
