class AddUserIdToReminder < ActiveRecord::Migration[5.1]
  def change
  	add_column :reminders, :user_id, :bigint, index: true
  end
end
