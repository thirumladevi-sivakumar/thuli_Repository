class BookingsController < ApplicationController
    $customerId=0

  # GET /bookings/1
  # GET /bookings/1.json
  def show
    @booking = Booking.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @booking }
    end
  end

  # GET /bookings/new
  # GET /bookings/new.json
  def new
    @booking = Booking.new
    $customerId=params[:id]
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @booking }
    end
  end


  # POST /bookings
  # POST /bookings.json
  def create
    @booking = Booking.new(params[:booking])
    
      @booking.customer_id=$customerId
      
      @customer=Customer.find($customerId)
      @vendors=VendorsZones.where(zone_id: @customer.zone).order('numberOfOrders ASC').first
      #########################################################################################
      @vendors.numberOfOrders=@vendors.numberOfOrders+1
      @vendors.update_attribute(:numberOfOrders, @vendors.numberOfOrders)
      @booking.vendor_id=@vendors.vendor_id
   
      @booking.otp=rand.to_s[2..6]
      @booking.accepted = false
    
      case @booking.brandName
          when "Metro Water"
            @booking.brandId=0
            @booking.price=@booking.price*650
          when "Bisleri"
            @booking.brandId=1
            @booking.price=@booking.price*200
          when "Kenley"
            @booking.brandId=2
            @booking.price=@booking.price*208
          when "TATA"
            @booking.brandId=3
            @booking.price=@booking.price*210
          when "Vendor brand"
            @booking.brandId=4
            @booking.price=@booking.price*150
      end
      
    respond_to do |format|
      if @booking.save
        format.html { redirect_to action:'show',id: @booking.id }
        format.json { render json: @booking, status: :created, location: @booking }
      else
        format.html { render action: "new" }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
    end
  end

 
end
