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
    @transactions = @vendor.transactions

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @vendor }
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
  def create
    @vendor = Vendor.new(params[:vendor])

    respond_to do |format|
      if @vendor.save
        format.html { redirect_to @vendor, notice: 'Vendor was successfully created.' }
        format.json { render json: @vendor, status: :created, location: @vendor }
      else
        format.html { render action: "new" }
        format.json { render json: @vendor.errors, status: :unprocessable_entity }
      end
    end
  end

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
  def destroy
    @vendor = Vendor.find(params[:id])
    @vendor.destroy

    respond_to do |format|
      format.html { redirect_to vendors_url }
      format.json { head :no_content }
    end
  end

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
    @transactions = @vendor.transactions
    respond_to do |format|
      format.html
      format.json { render json: @transactions}
    end
  end

  def accept
     @transaction = Booking.find(params[:id])
     @transaction.cccepted = true
     @transaction.save
  end

  def decline


  end

  def submit_otp
    new_otp = params[:otp]
    transaction = Booking.find(params[:id])
    if(transaction.otp == new_otp)
      Booking.find(params[:id]).destroy
    end 
    redirect_to :back
  end

end
