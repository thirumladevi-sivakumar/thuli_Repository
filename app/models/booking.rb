class Booking < ActiveRecord::Base
  #validates :brandId, :brandName, :customer_id, :otp, :price, :vendor_id, :accepted, :presence => true
 
   
    
  attr_accessible :brandId, :brandName, :customer_id, :otp, :price, :vendor_id, :accepted
  belongs_to :customer
    
    
  BRANDS={
          "Metro Water" => {price:650 ,index:0},
          "Bisleri" => {price:200 ,index:1},
          "Kenley" => {price:208 ,index:2},
          "TATA" => {price: 210,index:3},
          "Vendor brand" => {price:200 ,index:4}
         }
     
    
    def find_id(brand_name)
      BRANDS[brand_name] [:index] 
    end
    
    def find_price(brand_name)
      BRANDS[brand_name] [:price] 
    end
end
