class Users::SessionsController < Devise::SessionsController
  layout 'out_system'
# before_filter :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  def new
    cookies[:company] = 'planet'
    super
  end

  def remolques_new
    cookies[:company] = 'remolques'
    self.resource = resource_class.new(sign_in_params)
    clean_up_passwords(resource)
    yield resource if block_given?

    respond_with(resource, serialize_options(resource))
  end

  # POST /resource/sign_in
  def create
    self.resource = warden.authenticate!(auth_options)
    set_flash_message(:notice, :signed_in)
    sign_in(resource_name, resource)
    yield resource if block_given?

    respond_with resource, location: after_sign_in_path_for(resource)
  end

  # DELETE /resource/sign_out
  def destroy
    cookies[:company] = current_user.remolques_current_company? ? 'remolques' : 'planet'
    super
  end

  protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.for(:sign_in) << :attribute
  # end

  def after_sign_out_path_for(resource_or_scope)
    return unauthenticated_root_url if cookies[:company].nil?
    cookies[:company].eql?('remolques') ? login_remolques_url : unauthenticated_root_url
  end
end
