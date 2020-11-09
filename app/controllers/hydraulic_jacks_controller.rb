class HydraulicJacksController < ApplicationController
  before_action :set_hydraulic_jack, only: [:show, :edit, :update, :destroy]

  # GET /hydraulic_jacks
  # GET /hydraulic_jacks.json
  def index
    @hydraulic_jacks = HydraulicJack.all
  end

  # GET /hydraulic_jacks/1
  # GET /hydraulic_jacks/1.json
  def show
  end

  # GET /hydraulic_jacks/new
  def new
    @hydraulic_jack = HydraulicJack.new
  end

  # GET /hydraulic_jacks/1/edit
  def edit
  end

  # POST /hydraulic_jacks
  # POST /hydraulic_jacks.json
  def create
    @hydraulic_jack = HydraulicJack.new(hydraulic_jack_params)

    respond_to do |format|
      if @hydraulic_jack.save
        format.html { redirect_to hydraulic_jacks_path, notice: 'Hydraulic jack was successfully created.' }
        format.json { render :show, status: :created, location: @hydraulic_jack }
      else
        format.html { render :new }
        format.json { render json: @hydraulic_jack.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /hydraulic_jacks/1
  # PATCH/PUT /hydraulic_jacks/1.json
  def update
    respond_to do |format|
      if @hydraulic_jack.update(hydraulic_jack_params)
        format.html { redirect_to hydraulic_jacks_path, notice: 'Hydraulic jack was successfully updated.' }
        format.json { render :show, status: :ok, location: @hydraulic_jack }
      else
        format.html { render :edit }
        format.json { render json: @hydraulic_jack.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /hydraulic_jacks/1
  # DELETE /hydraulic_jacks/1.json
  def destroy
    @hydraulic_jack.destroy
    respond_to do |format|
      format.html { redirect_to hydraulic_jacks_url, notice: 'Hydraulic jack was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hydraulic_jack
      @hydraulic_jack = HydraulicJack.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def hydraulic_jack_params
      params.require(:hydraulic_jack).permit(:name, :model_part, :status)
    end
end
