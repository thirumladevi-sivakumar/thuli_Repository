class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.integer :customerId
      t.integer :vendorId
      t.datetime :bookingTime
      t.integer :otp
      t.string :brandName
      t.integer :brandId
      t.integer :price

      t.timestamps
    end
  end
end
