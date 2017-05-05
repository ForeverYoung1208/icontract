class CreateContracts < ActiveRecord::Migration[5.1]
  def change
    create_table :contracts do |t|
#      t.references :type, foreign_key: true
      t.string :name
      t.string :number
      t.decimal :sum, precision: 17, scale: 2
      t.date :from_date
      t.date :to_date
      t.string :till
#      t.references :payer, foreign_key: true
#      t.references :recipient, foreign_key: true
      t.boolean :is_signed
      t.boolean :is_active
      t.boolean :is_deleted
#      t.references :responsible_user, foreign_key: true
#      t.references :creator_user, foreign_key: true
      t.string :acts_schedule
      t.string :payments_schedule
      t.string :scan_path
      t.string :text_path

      t.timestamps
    end
  end
end
