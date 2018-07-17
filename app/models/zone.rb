class Zone < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible :name
    has_one :customer
  	has_and_belongs_to_many :vendors
end
