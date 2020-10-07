class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy, :create_maintenance, :create_file, :change_maintenance_done, :edit_order]
  helper_method :sort_column, :sort_direction
  # GET /items
  # GET /items.json
  def index
    @search_items = policy_scope(Item).ransack(params[:q])
    @items = @search_items.result.paginate(page: params[:page], per_page: 20)
  end

  def next_maintenances
    Item.set_without_maintenance
    @search_items = policy_scope(Item).next_maintenances.ransack(params[:q])
    @items = @search_items.result.order('maintenance_date').paginate(page: params[:page], per_page: 20)
    #@items_electric = Item.where(sub_category: SubCategory.where(category_id: 2).ids)
    @items_electric = policy_scope(Item).next_maintenances.where(sub_category: SubCategory.where(category_id: 2).ids)
  end

  def orders
    @search_items = Item.where(status_item_id: StatusItem.find_by_key('pendiente').id).ransack(params[:q])
    @items = @search_items.result.paginate(page: params[:page], per_page: 20)
  end

  def edit_order

    @users = User.all
    @item_id = @item.try(:id)

  end

  def new_order
    @item = Item.new
    @users = User.all
    @trailers = Trailer.all

  end

  # GET /items/1
  # GET /items/1.json
  def show
    @status_pendiente << StatusItem.find_by_key('vendido')
    @status_pendiente << StatusItem.find_by_key('pendiente_factura')
    audits = @item.audits + @item.associated_audits
    @audits = audits.sort_by { |a| a.created_at }

  end

  # GET /items/new
  def new
      @item = Item.new
      @users = Company.where(id: current_user.current_company)
      @branches =  Branch.all  #current_user.current_company.eql?(0) ? policy_scope(Branch).order(:name) : policy_scope(Branch).where(company_id: @current_company.try(:id)).order(:name)
      @categories = Category.all

  end

  # GET /items/1/edit
  def edit
    if current_user.current_company.eql? 0
      @users = Company.all
    else
      @users = Company.where(id: current_user.current_company)
    end
    @branches = current_user.current_company.eql?(0) ? policy_scope(Branch).order(:name) : policy_scope(Branch).where(company_id: @current_company.try(:id)).order(:name)
    @categories = Category.all
  end

  # POST /items
  # POST /items.json
  def create

    @users = Company.where(id: current_user.current_company)


    @branches = current_user.current_company.eql?(0) ? policy_scope(Branch).order(:name) : policy_scope(Branch).where(company_id: @current_company.try(:id)).order(:name);

    new_params = item_params
    if item_params[:user_id].eql?('')
      new_params[:user_id] = params[:boss_id]
    end


    @item = Item.new(new_params)

    respond_to do |format|
      if @item.save

        format.html { redirect_to @item, notice: 'Se creo el artículo correctamente.' }
        format.json { render :show, status: :created, location: @item }
      else
        format.html { render :new }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end


  # PATCH/PUT /items/1
  # PATCH/PUT /items/1.json
  def update
    if current_user.current_company.eql? 0
      @users = Company.all
    else
      @users = Company.where(id: current_user.current_company)
    end

    @branches = current_user.current_company.eql?(0) ? policy_scope(Branch).order(:name) : policy_scope(Branch).where(company_id: @current_company.try(:id)).order(:name);

    new_params = item_params

    if item_params[:user_id].eql?('')

      if params[:boss_id].eql?("null")
        @role_admin = Role.where(key: "admin").last.id
        @boss = User.where(role_id: @role_admin).first
        new_params[:user_id] = @boss.id
      else
        new_params[:user_id] = params[:boss_id]
      end

    end

    respond_to do |format|
      if @item.update(new_params)

        Department.find(@item.department_id).update(last_code: @item.code) if @item.department_id
        format.html { redirect_to @item, notice: 'Se actualizo el artículo correctamente.' }
        format.json { render :show, status: :ok, location: @item }
      else
        format.html { render :edit }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # POST /items
  # POST /items.json
  def create_file

    # @item_file = ItemFile.new(item_file_params)
    @item_file = @item.item_files.create!(item_file_params)

    respond_to do |format|
      if @item_file.save
        format.html { redirect_to :back, notice: 'Se actualizo el artículo correctamente.' }

        format.json { render :json => {"se_armo" => "el guiso"} }
      else
        render authenticated_root_path
      end
    end
  end

  # POST /items
  # POST /items.json
  def create_maintenance
    # @item_maintenance = ItemsMaintenance.new(item_maintenance_params)
    @item_maintenance = @item.items_maintenances.create!(item_maintenance_params)
    respond_to do |format|

      if @item_maintenance.save
        format.html { redirect_to :back, notice: 'Se actualizo el artículo correctamente.' }
        format.json { render :json => {"se_armo" => "el guiso"} }
      else
        render authenticated_root_path
      end
    end
  end


  # DELETE /items/1
  # DELETE /items/1.json
  def destroy
    respond_to do |format|
      if @item.destroy
        format.html { redirect_to items_url, notice: 'Item was successfully destroyed.' }
        format.json { render json: true  }
      else
        format.json { render json: false  }
      end
    end
  end


  def get_maintenances
    @item_maintenances = ItemsMaintenance.where(item_id: params[:id])
  end

  def get_files
    @item_files = ItemFile.where(item_id: params[:id])
  end

  def change_maintenance_done
    @item.update_attribute('maintenance_done', params[:value] == 'true')

    render json: @item.to_json, status: :ok
  end


  def items_excel
    @search_items = policy_scope(Item).ransack(params[:q])
    @items = @search_items.result

    respond_to do |format|
      format.xlsx { render xlsx: 'items_excel', filename: "items_excel.xlsx" }
    end
  end

  def reporter

    begin
      @search_save = params[:q]
      start_date = params[:start_date].to_date
      end_date = params[:end_date].to_date
      if start_date.nil? or end_date.nil?
        @search_items = policy_scope(Item).ransack(params[:q])
      else
        @search_items = policy_scope(Item).where(maintenance_date: start_date..end_date).ransack(params[:q])
      end
    rescue
      @search_items = policy_scope(Item).ransack(params[:q])
    end

    # @search_items = policy_scope(Item).where(maintenance_date: params[:start_date]..params[:end_date]).ransack(params[:q])
    @total_price_items = @search_items.result.sum(:price)


    #@search_items.sorts = 'branches.name'
    #@items = @search_items.result.paginate(page: params[:page], per_page: 50)
    if params[:column].eql? "Responsable"
      @items = @search_items.result.eager_load(:user).order('users.last_name asc').paginate(page: params[:page], per_page: 20) #if @search_items.sorts.empty?
    elsif params[:column].eql? "branch"
      @items = @search_items.result.eager_load(user: [:branch, {departments: :branch}]).order('branches.name asc, branches_departments.name asc').paginate(page: params[:page], per_page: 20)
    elsif params[:column].eql? "department"
      @items = @search_items.result.eager_load(user: [:department, :departments]).order("departments.name #{sort_direction}, departments_users #{sort_direction}").paginate(page: params[:page], per_page: 20)
    elsif params[:column].eql? "brand"
      @items = @search_items.result.eager_load(:brand).order("brands.name #{sort_direction}").paginate(page: params[:page], per_page: 20)
    elsif params[:column].eql?("category")
      @items = @search_items.result.eager_load(:category).order("categories.name #{sort_direction}").paginate(page: params[:page], per_page: 20)
    elsif params[:column].eql? "sub_category"
      @items = @search_items.result.eager_load(:sub_category).order("sub_categories.name #{sort_direction}").paginate(page: params[:page], per_page: 20)
    elsif params[:column].eql? "NumEmpleado"
      @items = @search_items.result.eager_load(:user).order("users.employee_number #{sort_direction}").paginate(page: params[:page], per_page: 20)
    else
      @items = @search_items.result.order("#{sort_column.downcase} #{sort_direction}").paginate(page: params[:page], per_page: 20)

      #@items = @search_items.result.eager_load(:user).order('users.last_name asc').paginate(page: params[:page], per_page: 20) #if @search_items.sorts.empty?
    end
    #   @branches = current_user.current_company.eql?(0) ? policy_scope(Branch).order(:name) : policy_scope(Branch).where(company_id: @current_company.try(:id)).order(:name);


    # Estaba anteriormente....
    # @items = @search_items.result.order(:code,:branch_id,:department_id).paginate(page: params[:page], per_page: 20)
    # @search_items.sorts = 'branches.name'
    # @items = @search_items.result.paginate(page: params[:page], per_page: 50)

    respond_to do |format|
      format.html
      format.js
    end
  end


  def items_imports
    #@items = Item.all
    @items = Item.none
  end


  def import
    Item.import(params[:file])
    redirect_to items_import_path, notice: 'Artículos actualizados correctamente.'
  end


  private

  def sortable_columns
    ["branch", "department", "category", "code", "model", "Responsable", "name", "description", "price", "brand", "sub_category"]
  end

  def sort_column
    sortable_columns.include?(params[:column]) ? params[:column] : "code"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_item
    @item = Item.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def item_params
    params.require(:item).permit(:name, :code, :description, :image, :model, :serial_number, :purchased_date,
                                 :in_service_date, :time_unit_service, :time_quantity_service, :price, :category_id,
                                 :time_unit_depreciation, :time_quantity_depreciation, :sub_category_id, :provider_id,
                                 :department_id, :user_id, :brand_id, :status_item_id,:status_shipping_id, :maintenance_date,
                                 :maintenance_done, :branch_id, :accessory, :remission,
                                 :trailer_id, :client_id, :advance_payment,
                                 :fiscal_voucher_id, :payment_type, :sale_price)
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def item_file_params
    params.require(:item_file).permit(:item_id, :file, :file_type, :description)
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def item_maintenance_params
    params.require(:item_maintenance).permit(:item_id, :file, :maintenance_id, :description, :price, :provider)
  end
end
