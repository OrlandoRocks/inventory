class TrailersController < ApplicationController
  before_action :set_trailer, only: [:show, :edit, :update, :destroy, :get_category_subcategory]

  # GET /trailers
  # GET /trailers.json
  def index
    @search_trailers  = policy_scope(Trailer).ransack(params[:q])

    @trailers = @search_trailers.result.paginate(page: params[:page], per_page: 20)
    # @trailers = Trailer.all
  end

  # GET /trailers/1
  # GET /trailers/1.json
  def show
  end

  # GET /trailers/new
  def new
    @trailer = Trailer.new
    @categories = Category.all
  end

  # GET /trailers/1/edit
  def edit
  end

  # POST /trailers
  # POST /trailers.json
  def create
    @trailer = Trailer.new(trailer_params)

    respond_to do |format|
      if @trailer.save
        format.html { redirect_to trailers_path, notice: 'Trailer ha sido creado correctamente.' }
        format.json { render :show, status: :created, location: @trailer }
      else
        format.html { render :new }
        format.json { render json: @trailer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /trailers/1
  # PATCH/PUT /trailers/1.json
  def update
    respond_to do |format|
      if @trailer.update(trailer_params)
        format.html { redirect_to trailers_path, notice: 'Trailer was successfully updated.' }
        format.json { render :show, status: :ok, location: @trailer }
      else
        format.html { render :edit }
        format.json { render json: @trailer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /trailers/1
  # DELETE /trailers/1.json
  def destroy
    @trailer.destroy
    respond_to do |format|
      format.html { redirect_to trailers_url, notice: 'Trailer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def get_category_subcategory

    @sub_category = SubCategory.find(@trailer.sub_category_id)


  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_trailer
      @trailer = Trailer.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def trailer_params
      params.require(:trailer).permit(:name, :model, :photo, :image, :category_id, :sub_category_id, :trailer_type_id, :status, :trailer_length_id,
                                      :trailer_height_id, :ramp_type_id, :redila_type_id, :trailer_type_id, :floor_type_id, :capacity_id,
                                      :trailer_width_id, :brake_type_id, :color_id, :divition_type_id, :fender_type_id, :hydraulic_jack_id,
                                      :pull_type_id, :reinforcement_type_id, :roof_type_di, :suspension_type_id, :turn_type_id, :brand_id)
    end
end
