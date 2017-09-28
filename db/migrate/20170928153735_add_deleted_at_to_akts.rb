class AddDeletedAtToAkts < ActiveRecord::Migration[5.1]
  def change
    add_column :akts, :deleted_at, :datetime  	
    remove_column :akts, :is_deleted
  end  
end
