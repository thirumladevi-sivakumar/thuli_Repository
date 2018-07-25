class DestroyZone < ActiveRecord::Migration
  def up
  	drop_table :zones
  end

  def down
  	create_table :zones do |t|
  	  t.string :name

      t.timestamps
    end
  end
end
