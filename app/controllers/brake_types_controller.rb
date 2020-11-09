class BrakeTypesController < ApplicationController
  before_action :set_brake_type, only: [:show, :edit, :update, :destroy]

  # GET /brake_types
  # GET /brake_types.json
  def index
    @brake_types = BrakeType.all
  end

  # GET /brake_types/1
  # GET /brake_types/1.json
  def show
  end

  # GET /brake_types/new
  def new
    @brake_type = BrakeType.new
  end

  # GET /brake_types/1/edit
  def edit
  end

  # POST /brake_types
  # POST /brake_types.json
  def create
    @brake_type = BrakeType.new(brake_type_params)

    respond_to do |format|
      if @brake_type.save
        format.html { redirect_to brake_types_path, notice: 'Brake type was successfully created.' }
        format.json { render :show, status: :created, location: @brake_type }
      else
        format.html { render :new }
        format.json { render json: @brake_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /brake_types/1
  # PATCH/PUT /brake_types/1.json
  def update
    respond_to do |format|
      if @brake_type.update(brake_type_params)
        format.html { redirect_to brake_types_path, notice: 'Brake type was successfully updated.' }
        format.json { render :show, status: :ok, location: @brake_type }
      else
        format.html { render :edit }
        format.json { render json: @brake_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /brake_types/1
  # DELETE /brake_types/1.json
  def destroy
    @brake_type.destroy
    respond_to do |format|
      format.html { redirect_to brake_types_url, notice: 'Brake type was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_brake_type
      @brake_type = BrakeType.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def brake_type_params
      params.require(:brake_type).permit(:name, :model_part, :status)
    end
end
