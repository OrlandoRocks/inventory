class Users::SessionsController < Devise::SessionsController
  layout 'out_system'
# before_filter :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  def create

    self.resource = warden.authenticate!(auth_options)
    set_flash_message(:notice, :signed_in)
    sign_in(resource_name, resource)
    yield resource if block_given?


    if current_user.god? or current_user.admin?
      respond_with resource, location: after_sign_in_path_for(resource)
    else
      if current_user.current_company.to_s.eql? params[:user][:current_company].to_s
        respond_with resource, location: after_sign_in_path_for(resource)
      else
        Devise.sign_out_all_scopes ? sign_out : sign_out(resource_name)
        set_flash_message(:notice, :no_company )
        respond_to_on_destroy
      end
    end







  end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.for(:sign_in) << :attribute
  # end
end
