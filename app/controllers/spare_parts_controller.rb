class SparePartsController < ApplicationController
  before_action :set_spare_part, only: %i[ show edit update destroy ]
  skip_before_action :verify_authenticity_token

  # GET /spare_parts or /spare_parts.json
  def index
    @spare_parts = SparePart.all
  end

  # GET /spare_parts/1 or /spare_parts/1.json
  def show
  end

  # GET /spare_parts/new
  def new
    @spare_part = SparePart.new
  end

  # GET /spare_parts/1/edit
  def edit
  end

  # POST /spare_parts or /spare_parts.json
  def create
    @spare_part = SparePart.new(spare_part_params)

    respond_to do |format|
      if @spare_part.save
        format.html { redirect_to spare_parts_path notice: "Spare part was successfully created." }
        format.json { render :show, status: :created, location: @spare_part }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @spare_part.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /spare_parts/1 or /spare_parts/1.json
  def update
    respond_to do |format|
      if @spare_part.update(spare_part_params)
        format.html { redirect_to spare_parts_path, notice: "Spare part was successfully updated." }
        format.json { render :show, status: :ok, location: @spare_part }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @spare_part.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /spare_parts/1 or /spare_parts/1.json
  def destroy
    @spare_part.destroy
    respond_to do |format|
      format.html { redirect_to spare_parts_url, notice: "Spare part was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_spare_part
      @spare_part = SparePart.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def spare_part_params
      params.require(:spare_part).permit(:sub_category_id, :instock, :unit_cost, :measurement)
    end
end
