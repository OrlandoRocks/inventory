
class Api::V1::UsersManagerController < ActionController::Base

  protect_from_forgery with: :null_session


  def login_user
    user_email = User.find_by(employee_number: params[:employee_number]).try(:email)
    resource = User.find_for_database_authentication(email: user_email)

    if resource
      if resource.valid_password?(params[:password])
        sign_in("user", resource)
        render :json=> {status: 200,success: true, auth_token: resource.authenticatable_salt, email: resource.email,
                        name:"#{resource.first_name} #{resource.last_name}", role: resource.role_name, user_id: resource.id}
        return
      else
        render json: {status: 400,success: false, message: 'User or password are incorrect'}
      end
    else
      render json: {status: 400, success:false ,message: 'User or password are incorrect2'}
    end

  end


end