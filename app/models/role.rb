class Role < ApplicationRecord
	has_and_belongs_to_many :users

	def bind_to_users!(users_ids)
		users_ids.each do |user_id|
			unless RolesUser.where(role_id: id, user_id: user_id).any?
				RolesUser.create!(role_id: id, user_id: user_id)
			end			
		end
	end
end
