class StatusItemsController < ApplicationController
  before_action :set_status_item, only: [:show, :edit, :update, :destroy]

  # GET /status_items
  # GET /status_items.json
  def index
    @search_status_items = policy_scope(StatusItem).ransack(params[:q])
    @status_items = @search_status_items.result.paginate(page: params[:page], per_page: 20)
  end

  # GET /status_items/1
  # GET /status_items/1.json
  def show
  end

  # GET /status_items/new
  def new
    @status_item = StatusItem.new
  end

  # GET /status_items/1/edit
  def edit
  end

  # POST /status_items
  # POST /status_items.json
  def create
    @status_item = StatusItem.new(status_item_params)

    respond_to do |format|
      if @status_item.save
        format.html { redirect_to status_items_path, notice: 'El estatus del artículo fue creado correctamente.' }
        format.json { render :show, status: :created, location: @status_item }
      else
        format.html { render :new }
        format.json { render json: @status_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /status_items/1
  # PATCH/PUT /status_items/1.json
  def update
    respond_to do |format|
      if @status_item.update(status_item_params)
        format.html { redirect_to status_item_path, notice: 'El estatus del artículo fue actualizado' }
        format.json { render :show, status: :ok, location: @status_item }
      else
        format.html { render :edit }
        format.json { render json: @status_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /status_items/1
  # DELETE /status_items/1.json
  def destroy
    @status_item.destroy
    respond_to do |format|
      format.html { redirect_to status_items_url, notice: 'El estatus del articulo fue eliminado.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_status_item
      @status_item = StatusItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def status_item_params
      params.require(:status_item).permit(:name, :description, :key, :status)
    end
end
