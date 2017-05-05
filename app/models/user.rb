class User < ApplicationRecord
	db_config = YAML.load_file('config/database.yml')
	establish_connection( db_config['users_'+ Rails.env.downcase] ) 

end
