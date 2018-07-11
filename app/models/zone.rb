class Zone < ActiveRecord::Base
  # attr_accessible :title, :body
    has_one :customer
  	has_and_belongs_to_many :vendors
end
