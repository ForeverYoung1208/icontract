class AddReminderableToReminders < ActiveRecord::Migration[5.1]
  def change
    add_column :reminders, :reminderable_id, :bigint
    add_index :reminders, [:reminderable_id]
  end
end
