class CreateBooings < ActiveRecord::Migration
  def up
  	create_table :bookings do |t|
  	  t.integer :customer_id
      t.integer :vendor_id
      t.integer :otp
      t.string :brandName
      t.integer :brandId
      t.integer :price

      t.timestamps
    end
  end

  def down
  end
end
