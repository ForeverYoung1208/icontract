class AddHistoryToContractsAkts < ActiveRecord::Migration[5.1]
  def change
    add_column :contracts, :history, :text
    add_column :akts, :history, :text
  end    	
end
