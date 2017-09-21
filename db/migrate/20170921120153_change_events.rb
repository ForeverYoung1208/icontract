class ChangeEvents < ActiveRecord::Migration[5.1]

  def up
    change_table :events do |t|
      t.remove :is_sent

      t.integer :sent_times
      t.string :done_by

    end  	
  end

  def down
    change_table :events do |t|
      t.boolean :is_sent

      t.remove :sent_times
      t.remove :done_by
    end

  end

end
