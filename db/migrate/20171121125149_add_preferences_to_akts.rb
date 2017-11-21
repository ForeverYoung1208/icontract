class AddPreferencesToAkts < ActiveRecord::Migration[5.1]
  def change
    add_column :akts, :preferences, :text
  end
end
