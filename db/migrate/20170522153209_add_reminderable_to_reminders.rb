class AddReminderableToReminders < ActiveRecord::Migration[5.1]
  def change
  	change_table :reminders do |t|
  		t.references :reminderable, polymorphic: true

      # t.integer :reminderable_id
      # t.string  :reminderable_type
	  end	
  end
end
