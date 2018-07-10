class VendorsWardsController < ApplicationController
  # GET /vendors_wards
  # GET /vendors_wards.json
  def index
    @vendors_wards = VendorsWard.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @vendors_wards }
    end
  end

  # GET /vendors_wards/1
  # GET /vendors_wards/1.json
  def show
    @vendors_ward = VendorsWard.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @vendors_ward }
    end
  end

  # GET /vendors_wards/new
  # GET /vendors_wards/new.json
  def new
    @vendors_ward = VendorsWard.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @vendors_ward }
    end
  end

  # GET /vendors_wards/1/edit
  def edit
    @vendors_ward = VendorsWard.find(params[:id])
  end

  # POST /vendors_wards
  # POST /vendors_wards.json
  def create
    @vendors_ward = VendorsWard.new(params[:vendors_ward])

    respond_to do |format|
      if @vendors_ward.save
        format.html { redirect_to @vendors_ward, notice: 'Vendors ward was successfully created.' }
        format.json { render json: @vendors_ward, status: :created, location: @vendors_ward }
      else
        format.html { render action: "new" }
        format.json { render json: @vendors_ward.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /vendors_wards/1
  # PUT /vendors_wards/1.json
  def update
    @vendors_ward = VendorsWard.find(params[:id])

    respond_to do |format|
      if @vendors_ward.update_attributes(params[:vendors_ward])
        format.html { redirect_to @vendors_ward, notice: 'Vendors ward was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @vendors_ward.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vendors_wards/1
  # DELETE /vendors_wards/1.json
  def destroy
    @vendors_ward = VendorsWard.find(params[:id])
    @vendors_ward.destroy

    respond_to do |format|
      format.html { redirect_to vendors_wards_url }
      format.json { head :no_content }
    end
  end
end
