class DivitionTypesController < ApplicationController
  before_action :set_divition_type, only: [:show, :edit, :update, :destroy]

  # GET /divition_types
  # GET /divition_types.json
  def index
    @divition_types = DivitionType.all
  end

  # GET /divition_types/1
  # GET /divition_types/1.json
  def show
  end

  # GET /divition_types/new
  def new
    @divition_type = DivitionType.new
  end

  # GET /divition_types/1/edit
  def edit
  end

  # POST /divition_types
  # POST /divition_types.json
  def create
    @divition_type = DivitionType.new(divition_type_params)

    respond_to do |format|
      if @divition_type.save
        format.html { redirect_to divition_types_path, notice: 'Divition type was successfully created.' }
        format.json { render :show, status: :created, location: @divition_type }
      else
        format.html { render :new }
        format.json { render json: @divition_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /divition_types/1
  # PATCH/PUT /divition_types/1.json
  def update
    respond_to do |format|
      if @divition_type.update(divition_type_params)
        format.html { redirect_to divition_types_path, notice: 'Divition type was successfully updated.' }
        format.json { render :show, status: :ok, location: @divition_type }
      else
        format.html { render :edit }
        format.json { render json: @divition_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /divition_types/1
  # DELETE /divition_types/1.json
  def destroy
    @divition_type.destroy
    respond_to do |format|
      format.html { redirect_to divition_types_url, notice: 'Divition type was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_divition_type
      @divition_type = DivitionType.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def divition_type_params
      params.require(:divition_type).permit(:name, :model_part, :status)
    end
end
