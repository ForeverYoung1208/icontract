class CreateAkts < ActiveRecord::Migration[5.1]
  def change
    create_table :akts do |t|
      t.references :contract, foreign_key: true
      t.date :from_date
      t.decimal :sum, precision: 17, scale: 2
      t.string :scan_path
      t.string :text_path
      t.boolean :is_signed
      t.boolean :is_deleted
      t.boolean :is_taken_as_original

      t.timestamps
    end
  end
end
