class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.references :reminder, foreign_key: true
      t.references :user, foreign_key: true
      t.boolean :is_sent
      t.boolean :to_send
      t.string :email_address
      t.text :email_text

      t.timestamps
    end
  end
end
