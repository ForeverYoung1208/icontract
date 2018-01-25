class AddKindToAkts < ActiveRecord::Migration[5.1]
  def change
    add_column :akts, :kind, :string
  end
end
