class CreateReminders < ActiveRecord::Migration[5.1]
  def change
    create_table :reminders do |t|
      t.references :type, foreign_key: true
      t.decimal :dd
      t.decimal :mm
      t.decimal :yyyy
      t.decimal :dofw
      t.decimal :moq
      t.date :begins
      t.date :ends
      t.boolean :is_active

      t.timestamps
    end
  end
end
