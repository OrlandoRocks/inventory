class FloorTypesController < ApplicationController
  before_action :set_floor_type, only: [:show, :edit, :update, :destroy]

  # GET /floor_types
  # GET /floor_types.json
  def index
    @floor_types = FloorType.all
  end

  # GET /floor_types/1
  # GET /floor_types/1.json
  def show
  end

  # GET /floor_types/new
  def new
    @floor_type = FloorType.new
  end

  # GET /floor_types/1/edit
  def edit
  end

  # POST /floor_types
  # POST /floor_types.json
  def create
    @floor_type = FloorType.new(floor_type_params)

    respond_to do |format|
      if @floor_type.save
        format.html { redirect_to floor_types_path, notice: 'Se creo el Tipo de Piso Correctamente' }
        format.json { render :index, status: :created, location: @floor_type }
      else
        format.html { render :new }
        format.json { render json: @floor_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /floor_types/1
  # PATCH/PUT /floor_types/1.json
  def update
    respond_to do |format|
      if @floor_type.update(floor_type_params)
        format.html { redirect_to floor_types_path, notice: 'Se actualizó el Tipo de Piso Correctamente.' }
        format.json { render :index, status: :ok, location: @floor_type }
      else
        format.html { render :edit }
        format.json { render json: @floor_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /floor_types/1
  # DELETE /floor_types/1.json
  def destroy
    @floor_type.destroy
    respond_to do |format|
      format.html { redirect_to floor_types_url, notice: 'Floor type was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_floor_type
      @floor_type = FloorType.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def floor_type_params
      params.require(:floor_type).permit(:name, :us_name,:model_part, :status)
    end
end
