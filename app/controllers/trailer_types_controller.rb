class TrailerTypesController < ApplicationController
  before_action :set_trailer_type, only: [:show, :edit, :update, :destroy]

  # GET /trailer_types
  # GET /trailer_types.json
  def index
    @trailer_types = TrailerType.all
  end

  # GET /trailer_types/1
  # GET /trailer_types/1.json
  def show
  end

  # GET /trailer_types/new
  def new
    @trailer_type = TrailerType.new
  end

  # GET /trailer_types/1/edit
  def edit
  end

  # POST /trailer_types
  # POST /trailer_types.json
  def create
    @trailer_type = TrailerType.new(trailer_type_params)

    respond_to do |format|
      if @trailer_type.save
        format.html { redirect_to trailer_types_url, notice: 'Trailer type was successfully created.' }
        format.json { render :show, status: :created, location: @trailer_type }
      else
        format.html { render :new }
        format.json { render json: @trailer_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /trailer_types/1
  # PATCH/PUT /trailer_types/1.json
  def update
    respond_to do |format|
      if @trailer_type.update(trailer_type_params)
        format.html { redirect_to trailer_types_url, notice: 'Trailer type was successfully updated.' }
        format.json { render :show, status: :ok, location: @trailer_type }
      else
        format.html { render :edit }
        format.json { render json: @trailer_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /trailer_types/1
  # DELETE /trailer_types/1.json
  def destroy
    @trailer_type.destroy
    respond_to do |format|
      format.html { redirect_to trailer_types_url, notice: 'Trailer type was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_trailer_type
      @trailer_type = TrailerType.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def trailer_type_params
      params.require(:trailer_type).permit(:name, :image, :model_part, :status, trailer_category_attributes: [:id,:trailer_id,:trailer_length_id, :trailer_height_id, :ramp_type_id, :redila_type_id, :trailer_type_id, :floor_type_id, :capacity_id, :trailer_width_id,
                                                                                                              :color_id, :hydraulic_jack_id, :pull_type_id, :brake_type_id, :reinforcement_type_id, :fender_type_id, :turn_type_id, :divition_type_id, :suspension_type_id,
                                                                                                              :roof_type_id, :brand_id, :key])
    end
end
