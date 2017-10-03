class AddSumDetailToAkts < ActiveRecord::Migration[5.1]
  def change
  	add_column :akts, :sum_detail, :string
  end
end
