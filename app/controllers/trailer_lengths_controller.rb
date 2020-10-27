class TrailerLengthsController < ApplicationController
  before_action :set_trailer_length, only: [:show, :edit, :update, :destroy]

  # GET /trailer_lengths
  # GET /trailer_lengths.json
  def index
    @trailer_lengths = TrailerLength.all
  end

  # GET /trailer_lengths/1
  # GET /trailer_lengths/1.json
  def show
  end

  # GET /trailer_lengths/new
  def new
    @trailer_length = TrailerLength.new
  end

  # GET /trailer_lengths/1/edit
  def edit
  end

  # POST /trailer_lengths
  # POST /trailer_lengths.json
  def create
    @trailer_length = TrailerLength.new(trailer_length_params)

    respond_to do |format|
      if @trailer_length.save
        format.html { redirect_to trailer_lengths_path, notice: 'Trailer length was successfully created.' }
        format.json { render :show, status: :created, location: @trailer_length }
      else
        format.html { render :new }
        format.json { render json: @trailer_length.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /trailer_lengths/1
  # PATCH/PUT /trailer_lengths/1.json
  def update
    respond_to do |format|
      if @trailer_length.update(trailer_length_params)
        format.html { redirect_to trailer_lengths_path, notice: 'Trailer length was successfully updated.' }
        format.json { render :show, status: :ok, location: @trailer_length }
      else
        format.html { render :edit }
        format.json { render json: @trailer_length.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /trailer_lengths/1
  # DELETE /trailer_lengths/1.json
  def destroy
    @trailer_length.destroy
    respond_to do |format|
      format.html { redirect_to trailer_lengths_url, notice: 'Trailer length was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_trailer_length
      @trailer_length = TrailerLength.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def trailer_length_params
      params.require(:trailer_length).permit(:name, :model_part, :status)
    end
end
