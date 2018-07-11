class Booking < ActiveRecord::Base
  attr_accessible :brandId, :brandName, :customer_id, :otp, :price, :vendor_id
  belongs_to:customer
  BRANDS=["Metro Water","Bisleri","Kenley","TATA","Vendor brand"]
end
