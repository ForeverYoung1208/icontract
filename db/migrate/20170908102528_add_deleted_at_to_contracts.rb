class AddDeletedAtToContracts < ActiveRecord::Migration[5.1]
  def change
    add_column :contracts, :deleted_at, :datetime  	
    remove_column :contracts, :is_deleted
  end  
end
