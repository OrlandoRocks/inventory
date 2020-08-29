class PermissionsController < ApplicationController
  before_action :set_permission, only: [:show, :edit, :update, :destroy]
  # add_breadcrumb proc { I18n.t('breadcrumbs.permissions') }, :permissions_path

  # GET /permissions
  # GET /permissions.json
  def index
    @search_permissions = Permission.ransack(params[:q])
    @permissions = @search_permissions.result.paginate(page: params[:page], per_page: 20)
  end

  # GET /permissions/1
  # GET /permissions/1.json
  def show
    add_breadcrumb @permission.name, :permission_path
  end
  # GET /permissions/new#
  # GET /permissions/new
  def new
    add_breadcrumb t('helpers.new'), :new_permission_path
    @permission = Permission.new
    @actions = []
    @controllers = get_controllers
  end

  # GET /permissions/1/edit
  def edit
    add_breadcrumb t('helpers.edit'), :edit_permission_path
    @controllers = get_controllers
    @actions = Controller.new(params[:resource]).actions
  end

  # POST /permissions
  # POST /permissions.json
  def create
    @permission = Permission.new(permission_params)
    respond_to do |format|
      if @permission.save
        format.html { redirect_to permissions_url, notice: t('notifications_masc.success.resource.created',
                                                             resource: t('permissions.form.resource')) }
        format.json { render :show, status: :created, location: @permission }
      else
        # The values are obtained again in case of errors since the values are lost on the request.
        @controllers = get_controllers
        controller = params[:permission][:controller].split('Controller').first.to_s
        @actions = Controller.new(controller).actions

        format.html { render :new }
        format.json { render json: @permission.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /permissions/1
  # PATCH/PUT /permissions/1.json
  def update
    respond_to do |format|
      if @permission.update(permission_params)
        format.html { redirect_to permissions_url, notice: t('notifications_masc.success.resource.updated',
                                                             resource: t('permissions.form.resource')) }
        format.json { render :show, status: :ok, location: @permission }
      else
        # The values are obtained again in case of errors since the values are lost on the request.
        @controllers = get_controllers
        controller = params[:permission][:controller].split('Controller').first.to_s
        @actions = Controller.new(controller).actions

        format.html { render :edit }
        format.json { render json: @permission.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /permissions/1
  # DELETE /permissions/1.json
  def destroy
    @permission.destroy
    respond_to do |format|
      format.html { redirect_to permissions_url }
      format.json { head :no_content }
    end
  end

  # Returns all the possible actions from given controller (resource) by request.
  def get_controller_actions
    @actions = Controller.new(params[:resource]).actions

    respond_to do |format|
      format.js
    end
  end

  # Generate the seeds of the permissions.
  def generate_seeds
    respond_to do |format|
      if system('rake db:seed:dump MODELS=Permission FILE=db/seeds/permissions.Items_csv.rb') &&
          system('rake db:seed:dump MODELS=PermissionRole FILE=db/seeds/permissions_roles.Items_csv.rb')
        format.json { render :index, status: :ok }
      else
        format.html { render :index }
        format.json { render status: :unprocessable_entity }
      end
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_permission
    @permission = Permission.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def permission_params
    params.require(:permission).permit(:name, :description, :action, :controller, role_ids: [])
  end

  # Get a list of all application controllers.
  def get_controllers
    @controllers = Controller.all
  end

  class Controller
    attr_reader :name

    def initialize(name)
      @name = name
    end

    def actions
      return [] if name.nil? or name.blank?
      begin
        exceptions = %w()
        (name + 'Controller').constantize.instance_methods(false).sort.map { |action| action.to_s } - exceptions
      rescue
        return []
      end
    end

    def self.all
      generic_controllers = Dir[Rails.root.join('app/controllers/*_controller.rb')]
                                .map { |path| (path.match(/(\w+)_controller.rb/); $1.capitalize).camelize }

      devise_controllers = Dir[Rails.root.join('app/controllers/users/*_controller.rb')]
                               .map { |path| 'Users::' + (path.match(/(\w+)_controller.rb/); $1.capitalize).camelize }

      generic_controllers + devise_controllers - ['Application']
    end
  end
end
