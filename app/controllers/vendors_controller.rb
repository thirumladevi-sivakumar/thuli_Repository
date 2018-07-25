class VendorsController < ApplicationController
  # GET /vendors
  # GET /vendors.json
  def index
    @vendors = Vendor.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @vendors }
    end
  end

  # GET /vendors/1
  # GET /vendors/1.json
  def show
    @vendor = Vendor.find(params[:id])
    @transactions = []
    @vendor.bookings.each do |temp|
      if temp.accepted == true
        @transactions.push(temp)
      end
    end
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @transactions }
    end
  end

  # GET /vendors/new
  # GET /vendors/new.json
  def new
    @vendor = Vendor.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @vendor }
    end
  end

  # GET /vendors/1/edit
  def edit
    @vendor = Vendor.find(params[:id])
  end

  # POST /vendors
  # POST /vendors.json
  #def create
   # @vendor = Vendor.new(params[:vendor])

    #respond_to do |format|
     # if @vendor.save
      #  format.html { redirect_to @vendor, notice: 'Vendor was successfully created.' }
       # format.json { render json: @vendor, status: :created, location: @vendor }
      #else
       # format.html { render action: "new" }
        #format.json { render json: @vendor.errors, status: :unprocessable_entity }
      #end
    #end
  #end

  # PUT /vendors/1
  # PUT /vendors/1.json
  def update
    @vendor = Vendor.find(params[:id])

    respond_to do |format|
      if @vendor.update_attributes(params[:vendor])
        format.html { redirect_to @vendor, notice: 'Vendor was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @vendor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vendors/1
  # DELETE /vendors/1.json
  #def destroy
   # @vendor = Vendor.find(params[:id])
    #@vendor.destroy

    #respond_to do |format|
     # format.html { redirect_to vendors_url }
      #format.json { head :no_content }
  #  end
 # end

  def login
    @vendor = Vendor.new
  end

  def login_check
    @vend = Vendor.find{|temp| temp.name == params[:name] && temp.password == params[:password]}
    if @vend.present?
      redirect_to action: "new_booking" , id: @vend.id
    else
      redirect_to action: "index" 
    end
  end

  def new_booking
    @vendor = Vendor.find(params[:id])
    @transactions = @vendor.bookings
    respond_to do |format|
      format.html
      format.json { render json: @transactions}
    end
  end
  def finish_transaction
    @booking = Booking.find(params[:id])
  end

  def accept
     @transaction = Booking.find(params[:id])
     @transaction.accepted = true
     @transaction.save
  end

  def decline
    transaction_to_change = Booking.find(params[:id])
    vendor_who_cancel = Vendor.find(params[:vendor_id])
    @vendors_two=VendorsZones.where(zone_id: Customer.find(transaction_to_change.customer_id).zone ).order('numberOfOrders ASC').first(2)
    vendor_zone = (vendor_who_cancel.id == @vendors_two[0].vendor_id ? @vendors_two[1] : @vendors_two[0])
    vendor_zone.numberOfOrders = vendor_zone.numberOfOrders.to_i + 1 
    vendor_zone.save
    vendor_cancel_zone = VendorsZones.find(vendor_who_cancel.id)
    vendor_cancel_zone.numberOfOrders = vendor_cancel_zone.numberOfOrders.to_i - 1
    vendor_cancel_zone.save
    transaction_to_change.vendor_id = Vendor.find(vendor_zone.vendor_id).id
    transaction_to_change.save

  end

  def registration

  end

  def create
    @vendor = Vendor.new
    @vendor.name = params[:name]
    @vendor.password = params[:password]
    @vendor.address = params[:address]
    @vendor.vend_type = params[:vend_type]
    @vendor.save
    params[:locations].each do |loc|
      VendorsZones.create(vendor_id: @vendor.id, zone_id: Zone.find_by_name(loc).id, numberOfOrders: 0)
    end
  end

  def submit_otp
    @new_otp = params[:otp]
    @transaction = Booking.find(params[:booking_id])
    if @transaction.otp == @new_otp.to_i
      @transaction.destroy #Booking.find(@transaction.id).destroy , Booking.destroy(@transaction.id)
    end 
    redirect_to :back
  end

end
