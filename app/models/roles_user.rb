class RolesUser < ApplicationRecord
  validates :user_id, :uniqueness => { :scope => :role_id }
end
