class ReinforcementTypesController < ApplicationController
  before_action :set_reinforcement_type, only: [:show, :edit, :update, :destroy]

  # GET /reinforcement_types
  # GET /reinforcement_types.json
  def index
    @reinforcement_types = ReinforcementType.all
  end

  # GET /reinforcement_types/1
  # GET /reinforcement_types/1.json
  def show
  end

  # GET /reinforcement_types/new
  def new
    @reinforcement_type = ReinforcementType.new
  end

  # GET /reinforcement_types/1/edit
  def edit
  end

  # POST /reinforcement_types
  # POST /reinforcement_types.json
  def create
    @reinforcement_type = ReinforcementType.new(reinforcement_type_params)

    respond_to do |format|
      if @reinforcement_type.save
        format.html { redirect_to reinforcement_types_path, notice: 'Reinforcement type was successfully created.' }
        format.json { render :show, status: :created, location: @reinforcement_type }
      else
        format.html { render :new }
        format.json { render json: @reinforcement_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reinforcement_types/1
  # PATCH/PUT /reinforcement_types/1.json
  def update
    respond_to do |format|
      if @reinforcement_type.update(reinforcement_type_params)
        format.html { redirect_to reinforcement_types_path, notice: 'Reinforcement type was successfully updated.' }
        format.json { render :show, status: :ok, location: @reinforcement_type }
      else
        format.html { render :edit }
        format.json { render json: @reinforcement_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reinforcement_types/1
  # DELETE /reinforcement_types/1.json
  def destroy
    @reinforcement_type.destroy
    respond_to do |format|
      format.html { redirect_to reinforcement_types_url, notice: 'Reinforcement type was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reinforcement_type
      @reinforcement_type = ReinforcementType.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def reinforcement_type_params
      params.require(:reinforcement_type).permit(:name, :model_part, :status)
    end
end
