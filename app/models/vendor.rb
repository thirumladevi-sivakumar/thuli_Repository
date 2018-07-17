class Vendor < ActiveRecord::Base
  attr_accessible :address, :name, :password, :vend_type
  has_many :bookings
  has_and_belongs_to_many :zones 
  # attr_accessible :title, :body

end
