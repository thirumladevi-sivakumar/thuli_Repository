class AddacceptedBookings < ActiveRecord::Migration
  def up
  	add_column :bookings , :accepted, :boolean
  end

  def down
  end
end
