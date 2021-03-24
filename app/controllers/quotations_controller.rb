class QuotationsController < ApplicationController
  before_action :set_quotation, only: [:show, :edit, :update, :destroy]
  helper_method :sort_column_quotation, :sort_direction

  # GET /quotations
  # GET /quotations.json
  def index
    if current_user.god? or current_user.admin?
      @search_quotations = Quotation.all.ransack(params[:q])
    elsif current_user.admin_branch?
      @search_quotations = Quotation.all.ransack(params[:q])
    elsif current_user.user_employee?
      @search_quotations = Quotation.all.ransack(params[:q])
    end

    @quotations = @search_quotations.result.order(sort_column_quotation + " " + sort_direction).paginate(page: params[:page], per_page: 20)

    @all_models = policy_scope(TrailerType).pluck(:model_part)

    @all_clients = policy_scope(Client)

    @all_departments = Department.all

  end

  # GET /quotations/1
  # GET /quotations/1.json
  def show
  end

  # GET /quotations/new
  def new
    @quotation = Quotation.new
    @users = User.all
  end

  # GET /quotations/1/edit
  def edit
    @users = User.all
  end

  # POST /quotations
  # POST /quotations.json
  def create
    @quotation = Quotation.new(quotation_params)

    respond_to do |format|
      if @quotation.save
        format.html { redirect_to quotations_path, notice: 'Cotización creada correctamente.' }
        format.json { render :show, status: :created, location: @quotation }
      else
        format.html { render :new }
        format.json { render json: @quotation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /quotations/1
  # PATCH/PUT /quotations/1.json
  def update
    respond_to do |format|
      if @quotation.update(quotation_params)
        format.html { redirect_to quotations_path, notice: 'Cotización actualizada correctamente.' }
        format.json { render :show, status: :ok, location: @quotation }
      else
        format.html { render :edit }
        format.json { render json: @quotation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /quotations/1
  # DELETE /quotations/1.json
  def destroy
    @quotation.destroy
    respond_to do |format|
      format.html { redirect_to quotations_url, notice: 'Quotation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def report_quotation
    titulo_reporte = 'Trailers Vendidos'
    nombre_reporte = 'trailers_vendidos'

    @quotation = Quotation.find(params[:id])
    @today = DateTime.now

    @number_string = @quotation.price.a_letras

    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "Cotización" # Excluding ".pdf" extension.
      end
    end

  end

  private

  def sortable_columns_quotation
    ['branches.name', 'model', 'categories_description', 'departments.name', 'price', 'trailer_types.name',
     'clients.name, clients.last_name', 'users.first_name, users.last_name']
  end

  def sort_column_quotation

    if params[:sort] === 'Sucursal'
      sort = 'branches.name'
    elsif params[:sort] === 'Modelo'
      sort = 'model'
    elsif params[:sort] === 'Descripcion'
      sort = 'categories_description'
    elsif params[:sort] === 'Punto de Venta'
      sort = 'departments.name'
    elsif params[:sort] === 'Precio de Cotización'
      sort = 'price'
    elsif params[:sort] === 'Nombre del trailer'
      sort = 'trailer_types.name'
    elsif params[:sort] === 'Cliente'
      sort = 'clients.name, clients.last_name'
    elsif params[:sort] === 'Vendedor'
      sort = 'users.first_name, users.last_name'
    else
      sort = params[:sort]
    end
    sortable_columns_quotation.include?(sort) ? sort : "price"

  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_quotation
    @quotation = Quotation.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def quotation_params
    params.require(:quotation).permit(:model, :price, :department_id, :user_id, :branch_id, :accessory, :color,
                                      :client_id, :ramp_type_id, :redila_type_id, :trailer_type_id, :floor_type_id,
                                      :capacity_id, :brake_type_id, :color_id, :divition_type_id, :fender_type_id,
                                      :hydraulic_jack_id, :pull_type_id, :roof_type_id, :suspension_type_id,
                                      :turn_type_id, :trailer_width_id, :categories_description, :catalog, :brand_id,
                                      :trailer_length_id)
  end
end
