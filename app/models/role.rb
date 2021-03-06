class Role < ApplicationRecord

  # has_many :roles_users
  # has_many :users, through: :roles_users
	has_and_belongs_to_many :users

	scope :active, ->{ where("deleted_at IS NULL")}
	# default_scope ->{ where("deleted_at IS NULL")}

	def bind_to_users!(users_ids)
		users_ids.each do |user_id|
			unless RolesUser.where(role_id: id, user_id: user_id).any?
				RolesUser.create!(role_id: id, user_id: user_id)
			end			
		end
	end
end
