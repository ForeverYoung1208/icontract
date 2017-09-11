class AddDeletedAtToReminders < ActiveRecord::Migration[5.1]
  def change
    add_column :reminders, :deleted_at, :datetime  	
  end
end
