class ChangeContracts < ActiveRecord::Migration[5.1]
  def change
    change_table :contracts do |t|
      t.references :type, foreign_key: true

      t.references :payer, index: true, foreign_key: { to_table: :companies }
      t.references :recipient, index: true, foreign_key: { to_table: :companies }

      t.bigint :responsible_user_id, index: true
      t.string :responsible_user_name
      t.bigint :creator_user_id
      t.string :creator_user_name

      t.text :preferences
      
    end
  end

end
