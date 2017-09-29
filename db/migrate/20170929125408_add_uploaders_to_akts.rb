class AddUploadersToAkts < ActiveRecord::Migration[5.1]
  def up
    change_table :akts do |t|
      t.remove :scan_path
      t.remove :text_path

      t.text :scanfiles
      t.text :textfiles

    end  	
  end

  def down
    change_table :akts do |t|
      t.string :scan_path
      t.string :text_path

      t.remove :scanfiles
      t.remove :textfiles
    end
  end
end
