class PullTypesController < ApplicationController
  before_action :set_pull_type, only: [:show, :edit, :update, :destroy]

  # GET /pull_types
  # GET /pull_types.json
  def index
    @pull_types = PullType.all
  end

  # GET /pull_types/1
  # GET /pull_types/1.json
  def show
  end

  # GET /pull_types/new
  def new
    @pull_type = PullType.new
  end

  # GET /pull_types/1/edit
  def edit
  end

  # POST /pull_types
  # POST /pull_types.json
  def create
    @pull_type = PullType.new(pull_type_params)

    respond_to do |format|
      if @pull_type.save
        format.html { redirect_to pull_types_path, notice: 'Pull type was successfully created.' }
        format.json { render :show, status: :created, location: @pull_type }
      else
        format.html { render :new }
        format.json { render json: @pull_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pull_types/1
  # PATCH/PUT /pull_types/1.json
  def update
    respond_to do |format|
      if @pull_type.update(pull_type_params)
        format.html { redirect_to pull_types_path, notice: 'Pull type was successfully updated.' }
        format.json { render :show, status: :ok, location: @pull_type }
      else
        format.html { render :edit }
        format.json { render json: @pull_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pull_types/1
  # DELETE /pull_types/1.json
  def destroy
    @pull_type.destroy
    respond_to do |format|
      format.html { redirect_to pull_types_url, notice: 'Pull type was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pull_type
      @pull_type = PullType.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def pull_type_params
      params.require(:pull_type).permit(:name, :us_name, :model_part, :status)
    end
end
