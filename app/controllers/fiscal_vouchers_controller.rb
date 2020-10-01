class FiscalVouchersController < ApplicationController
  before_action :set_fiscal_voucher, only: [:show, :edit, :update, :destroy]

  # GET /fiscal_vouchers
  # GET /fiscal_vouchers.json
  def index
    @fiscal_vouchers = FiscalVoucher.all
  end

  # GET /fiscal_vouchers/1
  # GET /fiscal_vouchers/1.json
  def show
  end

  # GET /fiscal_vouchers/new
  def new
    @fiscal_voucher = FiscalVoucher.new
  end

  # GET /fiscal_vouchers/1/edit
  def edit
  end

  # POST /fiscal_vouchers
  # POST /fiscal_vouchers.json
  def create
    @fiscal_voucher = FiscalVoucher.new(fiscal_voucher_params)

    respond_to do |format|
      if @fiscal_voucher.save
        format.html { redirect_to @fiscal_voucher, notice: 'Fiscal voucher was successfully created.' }
        format.json { render :show, status: :created, location: @fiscal_voucher }
      else
        format.html { render :new }
        format.json { render json: @fiscal_voucher.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /fiscal_vouchers/1
  # PATCH/PUT /fiscal_vouchers/1.json
  def update
    respond_to do |format|
      if @fiscal_voucher.update(fiscal_voucher_params)
        format.html { redirect_to @fiscal_voucher, notice: 'Fiscal voucher was successfully updated.' }
        format.json { render :show, status: :ok, location: @fiscal_voucher }
      else
        format.html { render :edit }
        format.json { render json: @fiscal_voucher.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fiscal_vouchers/1
  # DELETE /fiscal_vouchers/1.json
  def destroy
    @fiscal_voucher.destroy
    respond_to do |format|
      format.html { redirect_to fiscal_vouchers_url, notice: 'Fiscal voucher was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fiscal_voucher
      @fiscal_voucher = FiscalVoucher.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def fiscal_voucher_params
      params.require(:fiscal_voucher).permit(:name, :status)
    end
end
