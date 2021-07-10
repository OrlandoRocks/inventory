class SubCategoriesController < ApplicationController
  before_action :set_sub_category, only: [:show, :edit, :update, :destroy]

  # GET /sub_categories
  # GET /sub_categories.json
  def index
    # @search_sub_categories = policy_scope(SubCategory).ransack(params[:q])
    @sub_categories = SubCategory.all
  end

  # GET /sub_categories/1
  # GET /sub_categories/1.json
  def show
  end

  # GET /sub_categories/new
  def new
    @sub_category = SubCategory.new
  end

  # GET /sub_categories/1/edit
  def edit
  end

  # POST /sub_categories
  # POST /sub_categories.json
  def create
    @sub_category = SubCategory.new(sub_category_params)

    respond_to do |format|
      if @sub_category.save
        format.html { redirect_to sub_categories_path, notice: 'La Subcategoría se almaceno correctamente.' }
        format.json { render :show, status: :created, location: @sub_category }
      else
        format.html { render :new }
        format.json { render json: @sub_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sub_categories/1
  # PATCH/PUT /sub_categories/1.json
  def update
    respond_to do |format|
      if @sub_category.update(sub_category_params)
        format.html { redirect_to sub_categories_path, notice: 'La Subcategoría se actualizó correctamente.' }
        format.json { render :show, status: :ok, location: @sub_category }
      else
        format.html { render :edit }
        format.json { render json: @sub_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sub_categories/1
  # DELETE /sub_categories/1.json
  def destroy
    @sub_category.destroy
    respond_to do |format|
      format.html { redirect_to sub_categories_url, notice: 'La Subcategoría se eliminó.' }
      format.json { head :no_content }
    end
  end

  def get_subcategory_by_category
    @sub_category = SubCategory.where(category_id: params[:id])
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sub_category
      @sub_category = SubCategory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sub_category_params
      params.require(:sub_category).permit(:name, :description, :status, :category_id)
    end
end
