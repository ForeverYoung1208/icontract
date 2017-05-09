class User < ApplicationRecord
  db_config = YAML.load_file('config/database.yml')
  establish_connection( db_config['users_'+ Rails.env.downcase] )

  before_destroy { |record| raise "ReadOnlyRecord" }

#  has_many :contracts, foreign_key:

  has_many :contracts_creator, class_name: :Contract, foreign_key: :creator_user_id
  has_many :contracts_responsible, class_name: :Contract, foreign_key: :responsible_user_id


  def readonly?
    true
  end

  # attr_readonly :email, :name, :password_hash, :password_salt, :userlevel_id, :created_at, :updated_at, :company_id, :is_ip_controlled, :ip_address


end
