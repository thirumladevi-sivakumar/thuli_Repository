class CustomersController < ApplicationController
  def index
    @customers = Customer.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @customers }
    end
  end
    
    
  # GET /customers/findId
  # GET /customers/findId.json
  def findId
     username=params[:username]
     password=params[:password]
     @customer = Customer.find{ |x| x.name == username && x.password == password }
     if @customer.present?
         redirect_to :controller=>'bookings', :action=>'new' , id: @customer.id 
     else
         redirect_to action: "index"
     end
  end
    
    
  # GET /customers/1
  # GET /customers/1.json
  def show
    @customer = Customer.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @customer }
    end
  end

    
  # GET /customers/new
  # GET /customers/new.json
  def new
    @customer = Customer.new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @customer }
    end
  end


  # POST /customers
  # POST /customers.json
  def create
    @customer = Customer.new(params[:customer])
    pincode=@customer.zone
    zone=0 
    zone=@customer.find_zone(pincode)
    @customer.zone=zone   
      respond_to do |format|
      if @customer.save
        format.html { redirect_to action:'show',id: @customer.id }
        format.json { render json: @customer, status: :created, location: 'show' }
      else
        format.html { render action: "new" }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end

end
