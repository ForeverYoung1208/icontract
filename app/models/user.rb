class User < ApplicationRecord
  
  db_config = YAML.load( ERB.new( File.read('config/database.yml')).result )
  establish_connection( db_config['users_'+ Rails.env.downcase] )

  before_destroy { |record| raise "ReadOnlyRecord" }

  has_many :contracts_creator, class_name: :Contract, foreign_key: :creator_user_id
  has_many :contracts_responsible, class_name: :Contract, foreign_key: :responsible_user_id

  has_many :reminders
  has_many :events

  # has_many :roles_users
  # has_many :roles, through: :roles_users
  has_and_belongs_to_many :roles

  
  attr_accessor :password



  def self.authenticate(name, password)
   	user = find_by_name(name)
   	if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
   		user
   	else
   		nil
   	end
  end

  def ip_check(remote_ip)
    !self.is_ip_controlled || self.ip_address == remote_ip || ::SUPERUSERS.include?(self.name)
  end


  def readonly?
    true
  end

  def encrypt_password
		if password.present?
			self.password_salt = BCrypt::Engine.generate_salt
			self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
		end
  end

  def allowed_users_ids
    if self.is_admin
      res = User.all.pluck(:id) 
    else
      res = self.id
    end
    res
  end

  def is_admin
    # self.roles.active.pluck(:id).include?( ::ADMIN_ROLE_ID )
    self.roles.active.where(id: ::ADMIN_ROLE_ID).count >= 1
  end

  def self.all_with_any_role
    uids = RolesUser.all.pluck(:user_id)

    self.where(id: uids)

  end

#================
  def can_access_contracts?
    true
  end

  def can_access_akts?
    true
  end

  def can_access_events?
    true
  end

  def can_delete_events?
    is_admin
  end

  def can_access_reminders?
    true
  end

  def can_access_companies?
    true
  end

  def can_access_users?
    true
  end  

  def can_edit_users?
    is_admin
  end  

  def can_access_roles?
    is_admin
  end    

  def can_access_types?
    true
  end    

  def can_access_reminder_types?
    is_admin
  end

  def can_see_all_akts?
    self.roles.active.where(id: ::ACCOUNTANT_ROLE_ID).count >= 1
  end

  def can_take_documents?
    self.roles.active.where(id: ::ACCOUNTANT_ROLE_ID).count >= 1
  end

  def can_check_reminders?
    is_admin
  end

  def can_send_events?
    is_admin
  end


#===========

  # attr_readonly :email, :name, :password_hash, :password_salt, :userlevel_id, :created_at, :updated_at, :company_id, :is_ip_controlled, :ip_address


end
