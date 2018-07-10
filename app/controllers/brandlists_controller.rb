class BrandlistsController < ApplicationController
  # GET /brandlists
  # GET /brandlists.json
  def index
    @brandlists = Brandlist.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @brandlists }
    end
  end

  # GET /brandlists/1
  # GET /brandlists/1.json
  def show
    @brandlist = Brandlist.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @brandlist }
    end
  end

  # GET /brandlists/new
  # GET /brandlists/new.json
  def new
    @brandlist = Brandlist.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @brandlist }
    end
  end

  # GET /brandlists/1/edit
  def edit
    @brandlist = Brandlist.find(params[:id])
  end

  # POST /brandlists
  # POST /brandlists.json
  def create
    @brandlist = Brandlist.new(params[:brandlist])

    respond_to do |format|
      if @brandlist.save
        format.html { redirect_to @brandlist, notice: 'Brandlist was successfully created.' }
        format.json { render json: @brandlist, status: :created, location: @brandlist }
      else
        format.html { render action: "new" }
        format.json { render json: @brandlist.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /brandlists/1
  # PUT /brandlists/1.json
  def update
    @brandlist = Brandlist.find(params[:id])

    respond_to do |format|
      if @brandlist.update_attributes(params[:brandlist])
        format.html { redirect_to @brandlist, notice: 'Brandlist was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @brandlist.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /brandlists/1
  # DELETE /brandlists/1.json
  def destroy
    @brandlist = Brandlist.find(params[:id])
    @brandlist.destroy

    respond_to do |format|
      format.html { redirect_to brandlists_url }
      format.json { head :no_content }
    end
  end
end
