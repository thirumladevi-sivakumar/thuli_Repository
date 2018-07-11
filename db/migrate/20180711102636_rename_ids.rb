class RenameIds < ActiveRecord::Migration
  def up
  	drop_table :bookings
  end
  def down
  	create_table :bookings do |t|
      t.integer :customer_id
      t.integer :vendor_id
      t.integer :brand_id
      t.integer :otp
      t.string :brandName
      t.integer :price
      t.boolean :accepted

      t.timestamps
    end
  end
end
