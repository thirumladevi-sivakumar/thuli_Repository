class BookingsController < ApplicationController
  # GET /bookings
  # GET /bookings.json
    $customerId=0
  def index
    @bookings = Booking.all
    $customerId=params[:id]
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @bookings }
    end
  end

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

  # GET /bookings/1/edit
  def edit
    @booking = Booking.find(params[:id])
  end

  # POST /bookings
  # POST /bookings.json
  def create
    @booking = Booking.new(params[:booking])
    
      @booking.customerId=$customerId
      
      @customer=Customer.find($customerId)
      @vendors=VendorsWard.where(ward: @customer.ward).order('numberOfOrders ASC').first
      @vendors.numberOfOrders=@vendors.numberOfOrders+1
      @vendors.update_attribute(:numberOfOrders, @vendors.numberOfOrders)
      @booking.vendorId=@vendors.vendor_id
   
   @booking.bookingTime=Time.now
      @booking.otp=rand.to_s[2..6]
    
      case @booking.brandName
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
        format.html { redirect_to @booking, notice: 'Booking was successfully created.' }
        format.json { render json: @booking, status: :created, location: @booking }
      else
        format.html { render action: "new" }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /bookings/1
  # PUT /bookings/1.json
  def update
    @booking = Booking.find(params[:id])

    respond_to do |format|
      if @booking.update_attributes(params[:booking])
        format.html { redirect_to @booking, notice: 'Booking was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @booking.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bookings/1
  # DELETE /bookings/1.json
  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy

    respond_to do |format|
      format.html { redirect_to bookings_url }
      format.json { head :no_content }
    end
  end
end