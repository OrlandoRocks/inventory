class TurnTypesController < ApplicationController
  before_action :set_turn_type, only: [:show, :edit, :update, :destroy]

  # GET /turn_types
  # GET /turn_types.json
  def index
    @turn_types = TurnType.all
  end

  # GET /turn_types/1
  # GET /turn_types/1.json
  def show
  end

  # GET /turn_types/new
  def new
    @turn_type = TurnType.new
  end

  # GET /turn_types/1/edit
  def edit
  end

  # POST /turn_types
  # POST /turn_types.json
  def create
    @turn_type = TurnType.new(turn_type_params)

    respond_to do |format|
      if @turn_type.save
        format.html { redirect_to turn_types_path, notice: 'Turn type was successfully created.' }
        format.json { render :show, status: :created, location: @turn_type }
      else
        format.html { render :new }
        format.json { render json: @turn_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /turn_types/1
  # PATCH/PUT /turn_types/1.json
  def update
    respond_to do |format|
      if @turn_type.update(turn_type_params)
        format.html { redirect_to turn_types_path, notice: 'Turn type was successfully updated.' }
        format.json { render :show, status: :ok, location: @turn_type }
      else
        format.html { render :edit }
        format.json { render json: @turn_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /turn_types/1
  # DELETE /turn_types/1.json
  def destroy
    @turn_type.destroy
    respond_to do |format|
      format.html { redirect_to turn_types_url, notice: 'Turn type was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_turn_type
      @turn_type = TurnType.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def turn_type_params
      params.require(:turn_type).permit(:name, :us_name, :model_part, :status)
    end
end
