class Customer < ActiveRecord::Base
  attr_accessible :address, :email, :name, :password, :zone
  has_many :bookings
end
