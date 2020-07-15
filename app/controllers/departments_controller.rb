class DepartmentsController < ApplicationController
  before_action :set_department, only: [:show, :edit, :update, :destroy, :employee_items]

  # GET /departments
  # GET /departments.json
  def index
    @search_departments = policy_scope(Department).ransack(params[:q])
    @departments = @search_departments.result.paginate(page: params[:page], per_page: 20)
  end

  # GET /departments/1
  # GET /departments/1.json
  def show
    @employees = @department.employees
  end

  # GET /departments/new
  def new
    @department = Department.new
  end

  # GET /departments/1/edit
  def edit
  end

  # POST /departments
  # POST /departments.json
  def create
    @department = Department.new(department_params)

    respond_to do |format|
      if @department.save
        format.html { redirect_to departments_path, notice: 'El departamento se creó correctamente.' }
        format.json { render :show, status: :created, location: @department }
      else
        format.html { render :new }
        format.json { render json: @department.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /departments/1
  # PATCH/PUT /departments/1.json
  def update


    new_params = department_params
    new_params[:last_code] = sprintf('%04d', department_params[:sequence])

    respond_to do |format|
      if @department.update(new_params)
        format.html { redirect_to departments_path, notice: 'El departamento se actualizó.' }
        format.json { render :show, status: :ok, location: @department }
      else
        format.html { render :edit }
        format.json { render json: @department.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /departments/1
  # DELETE /departments/1.json
  def destroy
    @department.destroy
    respond_to do |format|
      format.html { redirect_to departments_url, notice: 'El departamento fue eliminado.' }
      format.json { head :no_content }
    end
  end


  def destroy_employee

    @department = Department.find(params[:department_id])
    @employee = @department.employees.find(params[:id])

    @role_accessless = Role.find_by_key("empleado_sin_acceso").id
    @role_admin = Role.find_by_key("admin").id

    @employee.items.each do |item|
      if @employee.role_id.eql? @role_accessless
        @user_department = Department.where(id:@user.department_id).first
        item.update(user_id: @user_department.manager_id, to_assing:true)

      elsif @employee.admin_department?
        @user_department = Department.where(manager_id:@user.id).first
        item.update(user_id: @user_department.branch.manager_id, to_assing:true)

      end
    end

    EmployeeMailer.department_employee_destroy(@department.manager,@employee).deliver_later



    @employee.destroy

    redirect_to department_path(@department)


  end

  def employee_items
    @employee = User.find(params[:employee_id])
    @items = @employee.items
    @unassigned_items = @employee.unassigned_items
    @search_users_work_articles = policy_scope(UsersWorkArticle).ransack(params[:employee_id])
    @search_work_articles = policy_scope(WorkArticle).ransack(params[:employee_id])

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_department
      @department = Department.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def department_params
      params.require(:department).permit(:name, :description, :branch_id, :manager_id, :code, :sequence, :last_code)
    end
end
