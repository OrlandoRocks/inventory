class RedilaTypesController < ApplicationController
  before_action :set_redila_type, only: [:show, :edit, :update, :destroy]

  # GET /redila_types
  # GET /redila_types.json
  def index
    @redila_types = RedilaType.all
  end

  # GET /redila_types/1
  # GET /redila_types/1.json
  def show
  end

  # GET /redila_types/new
  def new
    @redila_type = RedilaType.new
  end

  # GET /redila_types/1/edit
  def edit
  end

  # POST /redila_types
  # POST /redila_types.json
  def create
    @redila_type = RedilaType.new(redila_type_params)

    respond_to do |format|
      if @redila_type.save
        format.html { redirect_to redila_types_path, notice: 'Redila type was successfully created.' }
        format.json { render :show, status: :created, location: @redila_type }
      else
        format.html { render :new }
        format.json { render json: @redila_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /redila_types/1
  # PATCH/PUT /redila_types/1.json
  def update
    respond_to do |format|
      if @redila_type.update(redila_type_params)
        format.html { redirect_to redila_types_path, notice: 'Redila type was successfully updated.' }
        format.json { render :show, status: :ok, location: @redila_type }
      else
        format.html { render :edit }
        format.json { render json: @redila_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /redila_types/1
  # DELETE /redila_types/1.json
  def destroy
    @redila_type.destroy
    respond_to do |format|
      format.html { redirect_to redila_types_url, notice: 'Redila type was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_redila_type
      @redila_type = RedilaType.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def redila_type_params
      params.require(:redila_type).permit(:name, :model_part, :status)
    end
end
