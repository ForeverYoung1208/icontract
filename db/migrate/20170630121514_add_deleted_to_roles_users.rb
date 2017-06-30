class AddDeletedToRolesUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :roles_users, :deleted_at, :datetime
  end
end
