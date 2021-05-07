class FenderTypesController < ApplicationController
  before_action :set_fender_type, only: [:show, :edit, :update, :destroy]

  # GET /fender_types
  # GET /fender_types.json
  def index
    @fender_types = FenderType.all
  end

  # GET /fender_types/1
  # GET /fender_types/1.json
  def show
  end

  # GET /fender_types/new
  def new
    @fender_type = FenderType.new
  end

  # GET /fender_types/1/edit
  def edit
  end

  # POST /fender_types
  # POST /fender_types.json
  def create
    @fender_type = FenderType.new(fender_type_params)

    respond_to do |format|
      if @fender_type.save
        format.html { redirect_to fender_types_path, notice: 'Fender type was successfully created.' }
        format.json { render :show, status: :created, location: @fender_type }
      else
        format.html { render :new }
        format.json { render json: @fender_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /fender_types/1
  # PATCH/PUT /fender_types/1.json
  def update
    respond_to do |format|
      if @fender_type.update(fender_type_params)
        format.html { redirect_to fender_types_path, notice: 'Fender type was successfully updated.' }
        format.json { render :show, status: :ok, location: @fender_type }
      else
        format.html { render :edit }
        format.json { render json: @fender_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fender_types/1
  # DELETE /fender_types/1.json
  def destroy
    @fender_type.destroy
    respond_to do |format|
      format.html { redirect_to fender_types_url, notice: 'Fender type was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fender_type
      @fender_type = FenderType.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def fender_type_params
      params.require(:fender_type).permit(:name, :us_name, :model_part, :status)
    end
end
