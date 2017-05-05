class User < ApplicationRecord
	db_config = YAML.load_file('config/database.yml')
	establish_connection( db_config['users_'+ Rails.env.downcase] )

	before_destroy { |record| raise "ReadOnlyRecord" }
	
	def readonly?
  	true
	end

	#	attr_readonly :email, :name, :password_hash, :password_salt, :userlevel_id, :created_at, :updated_at, :company_id, :is_ip_controlled, :ip_address


end
