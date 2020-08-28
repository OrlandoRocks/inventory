class RolesController < ApplicationController
  before_action :set_role, only: [:show, :edit, :update, :destroy]
  # add_breadcrumb proc { I18n.t('breadcrumbs.roles') }, :roles_path

  # GET /roles
  # GET /roles.json
  def index
    @search_roles = Role.ransack(params[:q])
    @roles = @search_roles.result.paginate(page: params[:page], per_page: 20)
  end

  # GET /roles/1
  # GET /roles/1.json
  def show
    add_breadcrumb @role.name, :role_path
  end

  # GET /roles/new
  def new
    add_breadcrumb t('helpers.new'), :new_role_path
    @role = Role.new
  end

  # GET /roles/1/edit
  def edit
    add_breadcrumb t('helpers.edit'), :edit_role_path
  end

  # POST /roles
  # POST /roles.json
  def create
    @role = Role.new(role_params)

    respond_to do |format|
      if @role.save
        format.html { redirect_to @role, notice: 'Role was successfully created.' }
        format.json { render :show, status: :created, location: @role }
      else
        format.html { render :new }
        format.json { render json: @role.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /roles/1
  # PATCH/PUT /roles/1.json
  def update
    respond_to do |format|
      if @role.update(update_role_params)
        format.html { redirect_to @role, notice: 'Role was successfully updated.' }
        format.json { render :show, status: :ok, location: @role }
      else
        format.html { render :edit }
        format.json { render json: @role.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /roles/1
  # DELETE /roles/1.json
  def destroy
    if @role.key == 'god'
      redirect_to :back, alert: t('notifications_masc.alert.resource.destroyed',
                                  resource: t('roles.form.resource'))
    else
      if @role.users.empty?
        @role.destroy
        respond_to do |format|
          format.html { redirect_to roles_url }
          format.json { head :no_content }
        end
      else
        redirect_to :back
        flash[:notice] = t('notifications_masc.alert.resource.role_dependency', resource: @role.name)
      end
    end
  end

  # Return the role that has been selected with the existing permissions
  def role_permissions
    add_breadcrumb t('breadcrumbs.roles'), :roles_path
    @role = Role.find(params[:role_id])
    @permissions = Permission.order('controller').where.not(controller: ['WorkArticles']).group_by { |t| t.controller }
  end

  # Create the relation between the the role and the permissions selected and writes them into the database
  def assign_permissions
    @role = Role.find params[:role_id]
    @role.permissions.delete_all
    if params[:permissions_ids].respond_to? 'each'
      params[:permissions_ids].each do |permission|
        PermissionRole.create(role_id: @role.id, permission_id: permission[1])
      end
    end

    respond_to do |format|
      format.html { redirect_to roles_url, notice: t('notifications_masc.info.permissions_assigned') }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_role
    @role = Role.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def role_params
    params.require(:role).permit(:name, :key, :description, :scope, permission_ids: [])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def update_role_params
    params.require(:role).permit(:name, :description, :scope, permission_ids: [])
  end
end
