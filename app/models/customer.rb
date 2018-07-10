class Customer < ActiveRecord::Base
  attr_accessible :address, :email, :name, :password, :ward
    has_many :bookings
    
end
