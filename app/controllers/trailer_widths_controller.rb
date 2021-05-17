class TrailerWidthsController < ApplicationController
  before_action :set_trailer_width, only: [:show, :edit, :update, :destroy]

  # GET /trailer_widths
  # GET /trailer_widths.json
  def index
    @trailer_widths = TrailerWidth.all
  end

  # GET /trailer_widths/1
  # GET /trailer_widths/1.json
  def show
  end

  # GET /trailer_widths/new
  def new
    @trailer_width = TrailerWidth.new
  end

  # GET /trailer_widths/1/edit
  def edit
  end

  # POST /trailer_widths
  # POST /trailer_widths.json
  def create
    @trailer_width = TrailerWidth.new(trailer_width_params)

    respond_to do |format|
      if @trailer_width.save
        format.html { redirect_to trailer_widths_path, notice: 'Trailer width was successfully created.' }
        format.json { render :show, status: :created, location: @trailer_width }
      else
        format.html { render :new }
        format.json { render json: @trailer_width.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /trailer_widths/1
  # PATCH/PUT /trailer_widths/1.json
  def update
    respond_to do |format|
      if @trailer_width.update(trailer_width_params)
        format.html { redirect_to trailer_widths_path, notice: 'Trailer width was successfully updated.' }
        format.json { render :show, status: :ok, location: @trailer_width }
      else
        format.html { render :edit }
        format.json { render json: @trailer_width.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /trailer_widths/1
  # DELETE /trailer_widths/1.json
  def destroy
    @trailer_width.destroy
    respond_to do |format|
      format.html { redirect_to trailer_widths_url, notice: 'Trailer width was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_trailer_width
      @trailer_width = TrailerWidth.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def trailer_width_params
      params.require(:trailer_width).permit(:name, :us_name, :model_part, :status)
    end
end
