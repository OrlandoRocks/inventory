class Users::RegistrationsController < Devise::RegistrationsController
  layout 'application', except: [:new, :create]
  layout 'out_system', only: [:new, :create]
  # add_breadcrumb proc { I18n.t('breadcrumbs.users') }, :user_registrations_path

  before_action :set_user, only: [:show, :edit_user, :update_user, :destroy, :change_password, :save_password,
                                  :get_user_image, :assign_work_articles, :search_work_articles, :add_work_article]
  before_action :set_current_user, only: [:edit, :update, :update_profile, :update_password]
  before_action :get_roles, only: [:new_user, :create_user, :edit_user, :update_user]
  skip_before_action :is_authorized, only: [:edit, :update, :new, :create]

  # before_filter :configure_sign_up_params, only: [:create]
  # before_filter :configure_account_update_params, only: [:update]

  # GET /users
  def index
    @search_users = policy_scope(User).ransack(params[:q])
    @users = @search_users.result.order(:role_id, :employee_number, :id).paginate(page: params[:page], per_page: 30).order(:id)

  end

  # GET /users/1
  # GET /users/1.json
  def show
    add_breadcrumb @user.full_name, :user_path
    @role_admin = Role.find_by_key("admin").id
    @role_accessless = Role.find_by_key("empleado_sin_acceso").id

    if @user.role_id.eql? @role_accessless
      #@user_department = Department.where(id:@user.department_id)
      #@user_branch = Branch.where(id: @user_department.try(:first).try(:branch_id))
      #@boss = @user_department.manager
      #@boss = User.find(@user.id).try(:department).try(:manager).try(:full_name).try(:upcase)
      #@search_items_user = Item.where(department_id: @user_department.try(:first).try(:id)).ransack(params[:q])
      #@boss_items = @search_items_user.result
      #@items = @employee.items
      #@boss_items = @user.unassigned_items

      @search_items_user = @user.unassigned_items.ransack(params[:q])
      @user_branch = @user.department.branch
      @boss_items = @search_items_user.result.paginate(page: params[:page], per_page: 20)

    elsif @user.admin_branch?
      @user_branch = Branch.where(manager_id: @user.id)
      @boss = @user_branch.try(:first).try(:company).try(:user)
      @search_items_user = Item.where(branch_id: @user_branch.pluck(:id)).ransack(params[:q])
      @boss_items = @search_items_user.result.where.not(id: @user.items.pluck(:id)).paginate(page: params[:page], per_page: 20)
      #@boss_items = @search_items_user.result.paginate(page: params[:page], per_page: 20)
    elsif @user.admin? or @user.god?
      @search_items_user = Item.ransack(params[:q])
      @boss_items = @search_items_user.result.paginate(page: params[:page], per_page: 20)
    end


    #@items = @user.items

    @search_items = @user.items.ransack(params[:log_search])

    @items = @search_items.result.paginate(page: params[:page], per_page: 20)


    @unassigned_items = @boss_items

    # @unassigned_items.paginate(page: params[:page], per_page: 20)


    respond_to do |format|
      format.html
      format.js
      format.json { render json: @user }
    end
  end

  # GET /resource/sign_up
  def new
    @user = User.new
    @role_accessless = Role.find_by_key("empleado_sin_acceso").id
  end


  # GET /users/new_user
  def new_user
    add_breadcrumb t('helpers.new'), :new_user_path
    @user = User.new(department_id: params[:department_id])
    @role_accessless = Role.find_by_key("empleado_sin_acceso").id
  end

  def new_employee
    add_breadcrumb t('helpers.new'), :new_user_path
    @user = User.new(department_id: params[:department_id])
    @companies = policy_scope(Company)
    @roles = Role.where(key: %w(empleado_sin_acceso))
    @role_accessless = Role.find_by_key("empleado_sin_acceso").id
  end


  # GET /users/new_user
  def new_employee_department
    #add_breadcrumb proc { I18n.t('breadcrumbs.departments') }, :new_employee_department_path
    #add_breadcrumb t('helpers.new'), :new_employee_department_path
    @user = User.new(department_id: params[:department_id])
    @role_accessless = Role.find_by_key("empleado_sin_acceso").id
    @roles = Role.where(key: %w(empleado_sin_acceso))
    @boss_name = Department.find(params[:department_id])

    if @boss_name.manager.present?
      @boss = @boss_name.try(:manager).try(:full_name)
    else
      @boss = "SIN ASIGNAR#{}"
    end

  end

  # GET /resource/edit
  def edit
    add_breadcrumb current_user.full_name, :edit_profile_path
    super
  end

  # GET /roles/1/edit
  def edit_user
    add_breadcrumb t('helpers.edit'), :edit_user_path
    @role_accessless = Role.find_by_key("empleado_sin_acceso").id
    @manegment = Hash.new()

    if @user.role_id.eql? @role_accessless
      @user_department = Department.where(id: @user.department_id).order(:updated_at).last
      @user_branch = nil
      @user_company = Company.first
    else
      @user_department = Department.where(manager_id: @user.id).order(:updated_at).last
      @user_branch = @user.branch
      @user_company = Company.first
    end


    if !@user_department.nil?
      @department = @user_department
      @branch = @department.branch
      @company = Company.first
    elsif !@user_branch.nil?
      @department = nil
      @branch = @user_branch
      @company = Company.first
    elsif !@user_company.nil?
      @department = nil
      @branch = nil
      @company = @user_company
    end


  end

  # POST /resource
  # def create
  # super
  # end

  # POST /users
  # POST /users.json
  def create_user
    @user = User.new(sign_up_params)
    @user.current_company = current_user.current_company

    respond_to do |format|
      if @user.save


        # key_user = Role.find(@user.role_id).key
        #
        # case key_user
        # when 'admin_empresa'
        #   Company.find(params[:current_company]).update(user_id: @user.id) unless params[:user]['current_company'].eql? ''
        # when 'admin_sucursal'
        #   Branch.find(params[:branch]).update(manager_id: @user.id) unless params[:user]['branch'].eql? ''
        # when 'admin_departamento'
        #   Department.find(params[:department]).update(manager_id: @user.id) unless params[:user]['department'].eql? ''
        # else
        #   p 'Hola'
        # end
        format.html { redirect_to @user.department || user_registrations_path, notice: t('notifications_masc.success.resource.created',
                                                                                         resource: t('users.registrations.new_user.resource')) }
        format.json { render :show, status: :created, location: @user }
      else
        @role_accessless = Role.find_by_key("empleado_sin_acceso").id
        format.html { render :edit_user }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /resource
  def update
    super
  end

  def get_user_image
    if params[:user]
      respond_to do |format|
        if @user.update_attributes(update_avatar)
          format.html { redirect_to edit_profile_path, notice: t('notifications_fem.success.resource.updated',
                                                                 resource: t('users.registrations.edit.profile_image')) }
        end
      end
    else
      redirect_to edit_profile_path
      flash[:notice] = t('users.registrations.edit.need_image')
    end
  end

  # PATCH/PUT /roles/1
  # PATCH/PUT /roles/1.json
  def update_user
    # prev_unconfirmed_email = @user.unconfirmed_email if @user.respond_to?(:unconfirmed_email)
    #
    # if @user.update(account_update_params)
    #   if is_flashing_format?
    #     flash_key = update_needs_confirmation?(resource, prev_unconfirmed_email) ? :update_needs_confirmation : :updated
    #     set_flash_message :notice, flash_key
    #   end
    #   set_flash_message :notice, :updated
    #   flash.now[:notice] = t('notifications_masc.success.resource.destroyed',
    #                          resource: t('users.registrations.new_user.resource'))
    #   redirect_to user_registrations_path
    # else
    #   render 'edit_user'
    # end
    #
    params[:user].delete(:password)
    params[:user].delete(:password_confirmation)
    @user.current_company = current_user.current_company


    respond_to do |format|
      if @user.update(sign_up_params)

        # key_user = Role.find(@user.role_id).key
        # case key_user
        # when 'admin_empresa'
        #   Company.find(@user.current_company).update(user_id: @user.id) unless @user.current_company.eql? nil
        # when 'admin_sucursal'
        #   Branch.find(params[:user]['branch']).update(manager_id: @user.id) unless params[:user]['branch'].eql? ''
        # when 'admin_departamento'
        #   Department.find(params[:user]['department']).update(manager_id: @user.id) unless params[:user]['department'].eql? ''
        # else
        #   p 'Hola'
        # end
        # format.html { redirect_to @user.department || user_registrations_path, notice: t('notifications_masc.success.resource.created', resource: t('users.registrations.new_user.resource')) }
        format.html { redirect_to @user.department || user_registrations_path, notice: 'El usuario se guardo correctamente' }


        format.json { render :show, status: :created, location: @user }
      else
        @role_accessless = Role.find_by_key("empleado_sin_acceso").id
        format.html { render :edit_user }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end

  end

  def update_profile
    if @user.update_without_password(account_update_params)
      redirect_to edit_profile_path
    else
      render 'edit'
    end
  end

  def update_password
    if @user.update_with_password(password_update_params)
      # Sign in the user by passing validation in case their password changed
      sign_in @user, bypass: true
      redirect_to edit_profile_path, notice: t('helpers.success.update_fem',
                                               resource: t('users.registrations.edit.resource_password'))
    else
      render 'edit'
    end
  end

  # DELETE /resource
  def destroy
    #@role_accessless = Role.find_by_key("empleado_sin_acceso").id
    #@role_admin = Role.find_by_key("admin").id
    @role_accessless = Role.where(key: "empleado_sin_acceso").last.id
    @role_admin = Role.where(key: "admin").last.id

    items = []

    @user.items.each do |item|

      items << "Código: #{item.code} Artículo: #{item.name}"

      if @user.role_id.eql? @role_accessless
        @user_department = Department.where(id: @user.department_id).first
        item.update(user_id: @user_department.manager_id, to_assing: true)
        @boss = @user_department.manager
      elsif @user.admin_department?
        @user_department = Department.where(manager_id: @user.id).first
        item.update(user_id: @user_department.branch.manager_id, to_assing: true)
        @boss = @user_department.manager
      elsif @user.admin_branch?
        @user_branch = Branch.where(manager_id: @user.id).first
        item.update(user_id: @user_branch.company.user_id, to_assing: true)
        @boss = @user_branch.user
      elsif @user.admin_company?
        #@boss = User.where(role_id: @role_admin).first
        item.update(user_id: User.where(role_id: @role_admin).first.id)
        @boss = User.where(role_id: @role_admin).last
      end
    end


    if @boss.present?
      EmployeeMailer.department_employee_destroy(@boss, @user, items).deliver_later
    end


    respond_to do |format|
      if @user.destroy
        format.html { redirect_to user_registrations_url }
        format.json { render json: true }
      else
        format.json { render json: false }

      end
    end
  end

  # GET /users/change_password
  def change_password
    add_breadcrumb t('breadcrumbs.change_password', username: @user.username), :change_password_path
  end

  # Saves a user's password
  def save_password
    flag = true if @user.eql? current_user
    user = @user

    respond_to do |format|
      if @user.update(account_update_params)
        # Sign in the user by passing validation in case their password changed
        sign_in user, bypass: true if flag
        format.html { redirect_to user_registrations_path,
                                  notice: t('notifications_fem.success.resource.updated',
                                            resource: t('helpers.password')) }
        format.json { head :no_content }
      else
        format.html { render :change_password }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def employees_index
    @search_users = policy_scope(User).where(role_id: Role.where(key: %w(empleado_sin_acceso)).pluck(:id)).ransack(params[:q])
    @users = @search_users.result.paginate(page: params[:page], per_page: 20)
  end

  def assign_work_articles
    @search_users_work_articles = policy_scope(UsersWorkArticle).ransack(params[:q])
    @search_work_articles = policy_scope(WorkArticle).ransack(params[:q])
  end

  def add_work_article
    @users_work_article = @user.users_work_articles.new(users_work_article_params)

    if @users_work_article.save
      render json: @users_work_article, status: :ok
    else
      render json: @users_work_article.errors.full_messages, status: :unprocessable_entity
    end
  end

  def remove_work_article
    @users_work_article = UsersWorkArticle.find(params[:id])

    if @users_work_article.update_attributes(users_work_article_params)
      render json: @users_work_article, status: :ok
    else
      render json: @users_work_article.errors.full_messages, status: :unprocessable_entity
    end
  end

  def search_work_articles
    if params[:search_type] == 'assigned'
      @search_users_work_articles = policy_scope(@user.users_work_articles_assigned.includes(:work_article)).ransack(params[:q])
      @users_work_articles = @search_users_work_articles.result.joins(:work_article).paginate(page: params[:page], per_page: 5).order('work_articles.name')
      render partial: 'users/registrations/work_articles_assigned_table'
    else
      @search_work_articles = policy_scope(WorkArticle.not_assigned_to_user(@user)).ransack(params[:q])
      @work_articles = @search_work_articles.result.paginate(page: params[:page], per_page: 5).order(:name)
      render partial: 'users/registrations/work_articles_table'
    end
  end

  def update_work_articles
    @users_work_article = UsersWorkArticle.find(params[:users_work_article_id])

    if @users_work_article.update(users_work_article_params)
      render json: @users_work_article, status: :ok
    else
      render json: @users_work_article.errors.full_messages, status: :unprocessable_entity
    end
  end

  def unassign_item
    @item = Item.find(params[:id])
    @user = User.find(@item.user_id)
    @role_accessless = Role.find_by_key("empleado_sin_acceso").id
    @role_admin = Role.find_by_key("admin").id

    if @user.role_id.eql? @role_accessless
      @user_department = Department.where(id: @user.department_id).first

      if @item.update(user_id: @user_department.manager_id, status_item_id: params[:item][:status_item_id])
        render json: @item, status: :ok
      else
        render json: @item.errors.full_messages, status: :unprocessable_entity
      end

    elsif @user.admin_department?
      @user_department = Department.where(manager_id: @user.id).first
      if @item.update(user_id: @user_department.branch.manager_id, status_item_id: params[:item][:status_item_id])
        render json: @item, status: :ok
      else
        render json: @item.errors.full_messages, status: :unprocessable_entity
      end
    elsif @user.admin_branch?
      @user_branch = Branch.where(manager_id: @user.id).first
      if @item.update(user_id: @user_branch.company.user_id, status_item_id: params[:item][:status_item_id])
        render json: @item, status: :ok
      else
        render json: @item.errors.full_messages, status: :unprocessable_entity
      end
    elsif @user.admin_company?

      if @item.update(user_id: User.where(role_id: @role_admin).first.id, status_item_id: params[:item][:status_item_id])
        render json: @item, status: :ok
      else
        render json: @item.errors.full_messages, status: :unprocessable_entity
      end
    end


  end

  def assign_item
    @item = Item.find(params[:id])

    if @item.update(item_params)
      render json: @item, status: :ok
    else
      render json: @item.errors.full_messages, status: :unprocessable_entity
    end
  end


  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.for(:sign_up) << :attribute
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.for(:account_update) << :attribute
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_current_user
    @user = current_user
  end

  def sign_up_params
    params.require(:user).permit(:email, :password, :password_confirmation, :username, :first_name, :last_name,
                                 :maiden_name, :role_id, :department_id, :employee_number, :received_file, :avatar, :token)
  end

  def account_update_params
    params.require(:user).permit(:email, :password, :password_confirmation, :username, :first_name, :last_name,
                                 :maiden_name, :role_id, :department_id, :employee_number, :received_file, :avatar, :current_company, :token)
  end

  def profile_update_params
    params.require(:user).permit(:email, :password, :password_confirmation, :current_password, :avatar)
  end

  def update_avatar
    params.require(:user).permit(:avatar)
  end

  def password_update_params
    params.require(:user).permit(:password, :password_confirmation, :current_password)
  end

  def users_work_article_params
    params.require(:users_work_article).permit(:work_article_id, :reception_status, :delivery_status)
  end

  def item_params
    params.require(:item).permit(:status_item_id, :user_id)
  end

  def get_roles
    params_condition = params[:user].nil? ? (params[:department_id]) : (params[:department_id] or params[:user][:department_id])

    # if params_condition && params_condition!=''
    #   @roles = Role.where(key: %w(empleado_sin_acceso))
    #   @companies = policy_scope(Company)
    #   @employe_department = true
    # else
    #   @companies = policy_scope(Company)
    #   #@roles = Role.where.not(key: %w(empleado empleado_sin_acceso))
    #   @roles = policy_scope(Role)
    #   @employe_department = false
    # end


    @companies = policy_scope(Company)
    #@roles = Role.where.not(key: %w(empleado empleado_sin_acceso))
    @roles = policy_scope(Role)
    @employe_department = false


  end

  def get_roles_for_user
    if @user.department_id.present?
      @roles = Role.where(key: %w(empleado_sin_acceso))
    else
      @roles = Role.where.not(key: %w(empleado_sin_acceso))
    end
  end
end
