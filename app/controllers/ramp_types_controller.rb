class RampTypesController < ApplicationController
  before_action :set_ramp_type, only: [:show, :edit, :update, :destroy]

  # GET /ramp_types
  # GET /ramp_types.json
  def index
    @ramp_types = RampType.all
  end

  # GET /ramp_types/1
  # GET /ramp_types/1.json
  def show
  end

  # GET /ramp_types/new
  def new
    @ramp_type = RampType.new
  end

  # GET /ramp_types/1/edit
  def edit
  end

  # POST /ramp_types
  # POST /ramp_types.json
  def create
    @ramp_type = RampType.new(ramp_type_params)

    respond_to do |format|
      if @ramp_type.save
        format.html { redirect_to ramp_types_path, notice: 'Se creo el Tipo de Rampa Correctamente.' }
        format.json { render :show, status: :created, location: @ramp_type }
      else
        format.html { render :new }
        format.json { render json: @ramp_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ramp_types/1
  # PATCH/PUT /ramp_types/1.json
  def update
    respond_to do |format|
      if @ramp_type.update(ramp_type_params)
        format.html { redirect_to ramp_types_path, notice: 'Ramp type was successfully updated.' }
        format.json { render :show, status: :ok, location: @ramp_type }
      else
        format.html { render :edit }
        format.json { render json: @ramp_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ramp_types/1
  # DELETE /ramp_types/1.json
  def destroy
    @ramp_type.destroy
    respond_to do |format|
      format.html { redirect_to ramp_types_url, notice: 'Ramp type was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ramp_type
      @ramp_type = RampType.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def ramp_type_params
      params.require(:ramp_type).permit(:name, :model_part, :status)
    end
end
