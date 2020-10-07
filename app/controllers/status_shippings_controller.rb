class StatusShippingsController < ApplicationController
  before_action :set_status_shipping, only: [:show, :edit, :update, :destroy]

  # GET /status_shippings
  # GET /status_shippings.json
  def index
    @status_shippings = StatusShipping.all
  end

  # GET /status_shippings/1
  # GET /status_shippings/1.json
  def show
  end

  # GET /status_shippings/new
  def new
    @status_shipping = StatusShipping.new
  end

  # GET /status_shippings/1/edit
  def edit
  end

  # POST /status_shippings
  # POST /status_shippings.json
  def create
    @status_shipping = StatusShipping.new(status_shipping_params)

    respond_to do |format|
      if @status_shipping.save
        format.html { redirect_to @status_shipping, notice: 'Status shipping was successfully created.' }
        format.json { render :show, status: :created, location: @status_shipping }
      else
        format.html { render :new }
        format.json { render json: @status_shipping.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /status_shippings/1
  # PATCH/PUT /status_shippings/1.json
  def update
    respond_to do |format|
      if @status_shipping.update(status_shipping_params)
        format.html { redirect_to @status_shipping, notice: 'Status shipping was successfully updated.' }
        format.json { render :show, status: :ok, location: @status_shipping }
      else
        format.html { render :edit }
        format.json { render json: @status_shipping.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /status_shippings/1
  # DELETE /status_shippings/1.json
  def destroy
    @status_shipping.destroy
    respond_to do |format|
      format.html { redirect_to status_shippings_url, notice: 'Status shipping was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_status_shipping
      @status_shipping = StatusShipping.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def status_shipping_params
      params.fetch(:status_shipping, {})
    end
end
