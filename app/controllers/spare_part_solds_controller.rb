class SparePartSoldsController < ApplicationController
  before_action :set_spare_part_sold, only: %i[ show edit update destroy ]
  skip_before_action :verify_authenticity_token

  # GET /spare_part_solds or /spare_part_solds.json
  def index
    @spare_part_solds = SparePartSold.all
  end

  # GET /spare_part_solds/1 or /spare_part_solds/1.json
  def show
  end

  # GET /spare_part_solds/new
  def new
    @spare_part_sold = SparePartSold.new
  end

  # GET /spare_part_solds/1/edit
  def edit
  end

  # POST /spare_part_solds or /spare_part_solds.json
  def create
    @spare_part_sold = SparePartSold.new(spare_part_sold_params)


    respond_to do |format|
      if @spare_part_sold.save
        format.html { redirect_to @spare_part_sold, notice: "Spare part sold was successfully created." }
        format.json { render :show, status: :created, location: @spare_part_sold }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @spare_part_sold.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /spare_part_solds/1 or /spare_part_solds/1.json
  def update
    respond_to do |format|
      if @spare_part_sold.update(spare_part_sold_params)
        format.html { redirect_to @spare_part_sold, notice: "Spare part sold was successfully updated." }
        format.json { render :show, status: :ok, location: @spare_part_sold }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @spare_part_sold.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /spare_part_solds/1 or /spare_part_solds/1.json
  def destroy
    @spare_part_sold.destroy
    respond_to do |format|
      format.html { redirect_to spare_part_solds_url, notice: "Spare part sold was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_spare_part_sold
      @spare_part_sold = SparePartSold.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def spare_part_sold_params
      params.require(:spare_part_sold).permit(:client_id, :user_id, :spare_part_id, :quantity, :unit_sale_price, :payment_type, :fiscal_voucher_id, :advance_payment)
    end
end
