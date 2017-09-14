class AddNumberToAkts < ActiveRecord::Migration[5.1]
  def change
  	add_column :akts, :number, :string
  end
end
