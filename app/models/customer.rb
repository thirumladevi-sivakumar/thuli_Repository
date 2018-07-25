class Customer < ActiveRecord::Base
    
  validates :address, :email, :name, :password, :zone, :presence => true
  validates :email, :format => { :with =>/^[-\w\.]+@[-\w]+\.[-\w]{2,4}$/,
    :message => "illegal email entered" }
  validates :address, :email, :uniqueness => { :case_sensitive => false }
    
#  validates :name, :password, :uniqueness => { :case_sensitive => true } 
  validate :ensure_customers_with_same_username_have_different_passwords
    
  
    
  attr_accessible :address, :email, :name, :password, :zone
    
  has_many :bookings
    
  PINCODE_TO_ZONES={
                     600019 => 1,
                     600068  => 2,
                     600060 => 3,
                     600039 => 4,
                     600021 =>5,
                     600011 =>6,
                     600037 =>7,
                     600040 =>8,
                     600018 =>9,
                     600017 =>10,
                     600116 =>11,
                     600016 =>12,
                     600020 =>13,
                     600041 =>14,
                     600119 =>15

                   }


    def find_zone(pincode)
        PINCODE_TO_ZONES[pincode] 
    end

=begin
    def name
        self[:name] 
    end
   
    def password
        customer.password 
    end
    
    def address
        customer.address 
    end
    
    def zone
        customer.zone 
    end
    
    def email
        customer.email 
    end
=end

  def ensure_customers_with_same_username_have_different_passwords 
     # errors.delete(:password)
      if Customer.where(:name=>self[:name]).exists?
          if Customer.where(:password=>self[:password]).exists?
               errors.add(:password," - Enter different password.User with same username and password already exists")
          else
               errors.delete(:password)
          end
      else
          errors.delete(:password)
      end
  end

end
