class VendorsZones < ActiveRecord::Base
	attr_accessible :vendor_id, :zone_id, :numberOfOrders
	belongs_to :vendor
	belongs_to :zone
  # attr_accessible :title, :body
end
