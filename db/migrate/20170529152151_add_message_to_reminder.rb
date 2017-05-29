class AddMessageToReminder < ActiveRecord::Migration[5.1]
  def change
    add_column :reminders, :message, :string
  end
end
