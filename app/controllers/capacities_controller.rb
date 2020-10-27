class CapacitiesController < ApplicationController
  before_action :set_capacity, only: [:show, :edit, :update, :destroy]

  # GET /capacities
  # GET /capacities.json
  def index
    @capacities = Capacity.all
  end

  # GET /capacities/1
  # GET /capacities/1.json
  def show
  end

  # GET /capacities/new
  def new
    @capacity = Capacity.new
  end

  # GET /capacities/1/edit
  def edit
  end

  # POST /capacities
  # POST /capacities.json
  def create
    @capacity = Capacity.new(capacity_params)

    respond_to do |format|
      if @capacity.save
        format.html { redirect_to capacities_path, notice: 'Se creo una nueva Capacidad Correctamente' }
        format.json { render :show, status: :created, location: @capacity }
      else
        format.html { render :new }
        format.json { render json: @capacity.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /capacities/1
  # PATCH/PUT /capacities/1.json
  def update
    respond_to do |format|
      if @capacity.update(capacity_params)
        format.html { redirect_to capacities_path, notice: 'Se modifico la Capacidad Correctamente' }
        format.json { render :show, status: :ok, location: @capacity }
      else
        format.html { render :edit }
        format.json { render json: @capacity.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /capacities/1
  # DELETE /capacities/1.json
  def destroy
    @capacity.destroy
    respond_to do |format|
      format.html { redirect_to capacities_url, notice: 'Capacity was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_capacity
      @capacity = Capacity.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def capacity_params
      params.require(:capacity).permit(:name, :model_part, :status)
    end
end
