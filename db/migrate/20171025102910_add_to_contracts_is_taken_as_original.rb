class AddToContractsIsTakenAsOriginal < ActiveRecord::Migration[5.1]
  def change
  	add_column :contracts, :is_taken_as_original, :boolean
  end
end
