class BranchesController < ApplicationController
  before_action :set_branch, only: [:show, :edit, :update, :destroy]

  # GET /branches
  # GET /branches.json
  def index
    @search_branches = policy_scope(Branch).ransack(params[:q])
    @branches = @search_branches.result.paginate(page: params[:page], per_page: 20)
  end

  # GET /branches/1
  # GET /branches/1.json
  def show
  end

  # GET /branches/new
  def new
    @branch = Branch.new
  end

  # GET /branches/1/edit
  def edit
  end

  # POST /branches
  # POST /branches.json
  def create
    @branch = Branch.new(branch_params)

    respond_to do |format|
      if @branch.save
        format.html { redirect_to branches_path, notice: 'La sucursal se creó correctamente.' }
        format.json { render :show, status: :created, location: @branch }
      else
        format.html { render :new }
        format.json { render json: @branch.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /branches/1
  # PATCH/PUT /branches/1.json
  def update
    respond_to do |format|
      if @branch.update(branch_params)
        format.html { redirect_to branches_path, notice: 'La sucursal se actualizó correctamente.' }
        format.json { render :show, status: :ok, location: @branch }
      else
        format.html { render :edit }
        format.json { render json: @branch.errors, status: :unprocessable_entity }
      end
    end
  end

  def departments
    @branches = policy_scope(Branch).find(params[:branch_ids])


    render json: @branches.to_json(include: :departments), status: :ok
  end

  def departments_for_select
    @departments = policy_scope(Department).where(branch_id: params[:id])

    render json: @departments.to_json(include: [:employees, :manager, branch: {include: [user: {methods: :full_name}]}]), status: :ok
  end

  # DELETE /branches/1
  # DELETE /branches/1.json
  def destroy
    respond_to do |format|
      if @branch.destroy
        format.html { redirect_to branches_url, notice: 'La sucursal fue eliminada.' }
        format.json { render json: true }
      else
        format.json { render json: false }

      end
    end
  end

  def cities
    @cities = City.where(state_id: params[:id]).order(:name)
    render json: @cities.to_json
  end


  def next_code
    @branch = Branch.find(params[:branch_id])
    last_code = @branch.last_code + 1
    value = "#{@branch.code}-#{last_code.to_s}"
    render json: value.to_json
  end

  def get_branch_user
    @user = User.find(params[:id])
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_branch
    @branch = Branch.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def branch_params
    params.require(:branch).permit(:name, :description, :company_id, :manager_id, :city_id, :state_id, :code, :fleet_cost)
  end
end
