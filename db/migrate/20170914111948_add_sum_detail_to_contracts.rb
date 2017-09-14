class AddSumDetailToContracts < ActiveRecord::Migration[5.1]
  def change
  	add_column :contracts, :sum_detail, :string
  end
end
