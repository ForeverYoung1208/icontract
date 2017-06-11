class CreateRolesUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :roles_users, id: false do |t|
      t.integer :role_id, index: true
      t.integer :user_id, index: true

      t.timestamps
    end
  end
end
