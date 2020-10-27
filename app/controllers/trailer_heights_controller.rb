class TrailerHeightsController < ApplicationController
  before_action :set_trailer_height, only: [:show, :edit, :update, :destroy]

  # GET /trailer_heights
  # GET /trailer_heights.json
  def index
    @trailer_heights = TrailerHeight.all
  end

  # GET /trailer_heights/1
  # GET /trailer_heights/1.json
  def show
  end

  # GET /trailer_heights/new
  def new
    @trailer_height = TrailerHeight.new
  end

  # GET /trailer_heights/1/edit
  def edit
  end

  # POST /trailer_heights
  # POST /trailer_heights.json
  def create
    @trailer_height = TrailerHeight.new(trailer_height_params)

    respond_to do |format|
      if @trailer_height.save
        format.html { redirect_to trailer_heights_path, notice: 'Trailer height was successfully created.' }
        format.json { render :show, status: :created, location: @trailer_height }
      else
        format.html { render :new }
        format.json { render json: @trailer_height.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /trailer_heights/1
  # PATCH/PUT /trailer_heights/1.json
  def update
    respond_to do |format|
      if @trailer_height.update(trailer_height_params)
        format.html { redirect_to trailer_heights_path, notice: 'Trailer height was successfully updated.' }
        format.json { render :show, status: :ok, location: @trailer_height }
      else
        format.html { render :edit }
        format.json { render json: @trailer_height.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /trailer_heights/1
  # DELETE /trailer_heights/1.json
  def destroy
    @trailer_height.destroy
    respond_to do |format|
      format.html { redirect_to trailer_heights_url, notice: 'Trailer height was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_trailer_height
      @trailer_height = TrailerHeight.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def trailer_height_params
      params.require(:trailer_height).permit(:name, :model_part, :status)
    end
end
