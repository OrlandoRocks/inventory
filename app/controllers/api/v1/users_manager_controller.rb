
class Api::V1::UsersManagerController < ActionController::Base

  protect_from_forgery with: :null_session


  def login_user
    user_email = User.find_by(employee_number: params[:employee_number]).try(:email)
    resource = User.find_for_database_authentication(email: user_email)

    if resource
      if resource.valid_password?(params[:password])
        sign_in("user", resource)
        render :json=> {status: 200,success: true, auth_token: resource.authenticatable_salt, email: resource.email,
                        name:"#{resource.first_name} #{resource.last_name}", role: resource.role_name, user_id: resource.id,
                        department_name: resource.try(:department).try(:name), branch_name: resource.try(:branch).try(:name),
                        department_id: resource.try(:department_id), branch_id: resource.try(:branch_id),
                        token: resource.try(:token) }
        return
      else
        render json: {status: 400,success: false, message: 'User or password are incorrect'}
      end
    else
      render json: {status: 400, success:false ,message: 'User or password are incorrect'}
    end

  end


  def save_token


    user = User.find(params[:id])

    # status_item_id          =    StatusItem.find_by_key('no_vendido').try(:id)  #params[:status_item_id]
    # status_shipping_id      =    params[:department_id] == 1 ? StatusShipping.find_by_key('recibido').try(:id) :  StatusShipping.find_by_key('enviado').try(:id)  # params[:status_shipping_id]




    user_params = Hash.new

    user_params[:token]       =    params[:token]       if params[:token]



    if user.update_without_password(user_params)
      p 'se actualizo!'
      render json: {status:200, success: true, message:'se actualizo el Token correctamente!'}
    else
      p 'algo valio shit'
      render json: {status:400, success: false, error:user.errors.as_json}

    end
  end


end