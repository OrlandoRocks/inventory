class HomeController < ApplicationController
  helper_method :sort_column, :sort_direction

  def index

    unless current_user.nil?
      if current_user.current_company.nil?
        @current_company_state = false
      else

        @current_company_state = true
      end
    end


    @search_departments = policy_scope(Department).ransack(params[:q])
    @departments = @search_departments.result


    @items_count = policy_scope(Item).count
    #@work_articles = WorkArticle.count
    @users = User.all  #policy_scope(User).count

    @users_count = policy_scope(User).count

    @branches_count = policy_scope(Branch).count
    @departments_count = policy_scope(Department).count

    @search_items = policy_scope(Item).ransack(params[:q])

    @total_price_items = @search_items.result.sum(:price)

    @all_models = Trailer.all.pluck(:model)

    @all_remissions = Item.all.pluck(:remission)


    if  params[:column].eql? "Responsable"
      @items = @search_items.result.eager_load(:user).order('users.last_name asc').paginate(page: params[:page], per_page: 20) #if @search_items.sorts.empty?
    elsif params[:column].eql? "branch"
      @items = @search_items.result.eager_load(user: [:branch, {departments: :branch}]).order('branches.name asc, branches_departments.name asc').paginate(page: params[:page], per_page: 20)
    elsif params[:column].eql? "department"
      @items = @search_items.result.eager_load(user: [:department, :departments ]).order("departments.name #{sort_direction}, departments_users #{sort_direction}").paginate(page: params[:page], per_page: 20)
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


    #@search_items.sorts = 'branches.name'
    #@items = @search_items.result.paginate(page: params[:page], per_page: 50)

    #if  params[:column].eql? "Responsable"
    #  @items = @search_items.result.eager_load(:user).order('users.last_name asc').paginate(page: params[:page], per_page: 20) #if @search_items.sorts.empty?
    # elsif params[:column].eql? "branch"
    #   @items = @search_items.result.eager_load(:branch).order("branches.name #{sort_direction}").paginate(page: params[:page], per_page: 20)
    #   #@items = @search_items.order("branches.name #{sort_direction}").paginate(page: params[:page], per_page: 20)
    # elsif params[:column].eql? "department"
    #   @items = @search_items.result.eager_load(:department).order("departments.name #{sort_direction}").paginate(page: params[:page], per_page: 20)
    # elsif params[:column].eql? ("brand") || params[:q][:hola] == '1'
    #   sort_column("brand")
    #   @items = @search_items.result.eager_load(:brand).order("brands.name #{sort_direction}").paginate(page: params[:page], per_page: 20)
    # elsif params[:column].eql?("category")
    #   @items = @search_items.result.eager_load(:category).order("categories.name #{sort_direction}").paginate(page: params[:page], per_page: 20)
    # elsif params[:column].eql? "sub_category"
    #   @items = @search_items.result.eager_load(:sub_category).order("sub_categories.name #{sort_direction}").paginate(page: params[:page], per_page: 20)
    #  else
    #    #@items = @search_items.result.order("#{sort_column.downcase} #{sort_direction}").paginate(page: params[:page], per_page: 20)
    #    #@search_items.sorts = 'items.name'
    #    @items = @search_items.result.eager_load(:user).order('users.last_name asc').paginate(page: params[:page], per_page: 20) #if @search_items.sorts.empty?
    #  end

    #@branches = current_user.current_company.eql?(0) ? policy_scope(Branch).order(:name) : policy_scope(Branch).where(company_id: @current_company.try(:id)).order(:name);


    respond_to do |format|
      format.html
      format.js
    end
  end

  private

  def sortable_columns
    ["branch", "department", "category","code", "model", "Responsable", "name", "description", "price", "brand", "sub_category", "NumEmpleado"]
  end

  def sort_column(column=nil)
    if column
      sortable_columns.include?(column) ? column : "code"
    else
      sortable_columns.include?(params[:column]) ? params[:column] : "code"
    end

  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end


end
