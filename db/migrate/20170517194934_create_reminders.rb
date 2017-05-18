class CreateReminders < ActiveRecord::Migration[5.1]

  def change
    create_table :reminder_types do |t|
      t.string :name
      t.text :description

      t.timestamps
    end

    create_table :reminders do |t|
      t.references :reminder_type, foreign_key: true
      t.decimal :dd, precision: 2, scale: 0
      t.decimal :mm, precision: 2, scale: 0
      t.decimal :yyyy, precision: 4, scale: 0
      t.decimal :dofw, precision: 2, scale: 0
      t.decimal :moq, precision: 1, scale: 0
      t.date :begins
      t.date :ends
      t.boolean :is_active

      t.timestamps
    end
  end
end
