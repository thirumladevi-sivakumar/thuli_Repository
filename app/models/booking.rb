class Booking < ActiveRecord::Base
  attr_accessible :bookingTime, :brandId, :brandName, :customerId, :otp, :price, :vendorId
    belongs_to:customer
    BRANDS=["Bisleri","Kenley","TATA","Vendor brand"]
end
