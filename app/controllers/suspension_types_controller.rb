class SuspensionTypesController < ApplicationController
  before_action :set_suspension_type, only: [:show, :edit, :update, :destroy]

  # GET /suspension_types
  # GET /suspension_types.json
  def index
    @suspension_types = SuspensionType.all
  end

  # GET /suspension_types/1
  # GET /suspension_types/1.json
  def show
  end

  # GET /suspension_types/new
  def new
    @suspension_type = SuspensionType.new
  end

  # GET /suspension_types/1/edit
  def edit
  end

  # POST /suspension_types
  # POST /suspension_types.json
  def create
    @suspension_type = SuspensionType.new(suspension_type_params)

    respond_to do |format|
      if @suspension_type.save
        format.html { redirect_to suspension_types_path, notice: 'Suspension type was successfully created.' }
        format.json { render :show, status: :created, location: @suspension_type }
      else
        format.html { render :new }
        format.json { render json: @suspension_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /suspension_types/1
  # PATCH/PUT /suspension_types/1.json
  def update
    respond_to do |format|
      if @suspension_type.update(suspension_type_params)
        format.html { redirect_to suspension_types_path, notice: 'Suspension type was successfully updated.' }
        format.json { render :show, status: :ok, location: @suspension_type }
      else
        format.html { render :edit }
        format.json { render json: @suspension_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /suspension_types/1
  # DELETE /suspension_types/1.json
  def destroy
    @suspension_type.destroy
    respond_to do |format|
      format.html { redirect_to suspension_types_url, notice: 'Suspension type was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_suspension_type
      @suspension_type = SuspensionType.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def suspension_type_params
      params.require(:suspension_type).permit(:name, :model_part, :status)
    end
end
