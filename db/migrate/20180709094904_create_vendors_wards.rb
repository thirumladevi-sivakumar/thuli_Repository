class CreateVendorsWards < ActiveRecord::Migration
  def change
    create_table :vendors_wards do |t|
      t.integer :vendor_id
      t.integer :ward
      t.integer :numberOfOrders

      t.timestamps
    end
  end
end
