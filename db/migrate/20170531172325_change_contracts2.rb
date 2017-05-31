class ChangeContracts2 < ActiveRecord::Migration[5.1]
  def up
    change_table :contracts do |t|
      t.remove :acts_schedule
      t.remove :payments_schedule
      t.remove :scan_path
      t.remove :text_path

      t.text :scanfiles
      t.text :textfiles

    end  	
  end

  def down
    change_table :contracts do |t|
      t.string :acts_schedule
      t.string :payments_schedule
      t.string :scan_path
      t.string :text_path


      t.remove :scanfiles
      t.remove :textfiles
    end

  end

end
