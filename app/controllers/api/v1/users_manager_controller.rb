
class Api::V1::UsersManagerController < ActionController::Base

  protect_from_forgery with: :null_session
  

  def login_user
    user = User.find_for_database_authentication(employee_number: params[:employee_number])
    if user && user.valid_password?(params[:password]) 
      render :json=> payload(user) 
    else
      render json: {status: 400, success:false ,message: 'User or password are incorrect'}
    end
  end

  
  def sign_up_guest
    begin

    num_last_guest = User.where(role_id: Role.where(key:'guest').first.id).last.try(:employee_number)

      user_params = Hash.new

      user_params[:email]       =    params[:email]       if params[:email]
      user_params[:role_id]    =    Role.where(key:'guest').first.id
      user_params[:first_name]      =    params[:first_name]      if params[:first_name]
      user_params[:last_name]     =    params[:last_name]     if params[:last_name]
      user_params[:password]     =    params[:password]     if params[:password]
      user_params[:password_confirmation]     =    params[:password_confirmation]     if params[:password_confirmation]
      user_params[:current_company]   =    Company.first.id
      user_params[:employee_number]   = num_last_guest.nil? ? 9000 : num_last_guest+1


      @new_user = User.new(user_params)

      if @new_user.save
        p 'se salvo'
        render json: {status:200, success: true, message:'se creo el usuario correctamente!', user: @new_user}
      else
        p 'algo valio shit'
        render json: {status:400, success: false, error:@new_user.errors.as_json}

      end

    rescue => error
      p 'error--------'
      p error
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
  private
  def payload(user)
    return nil unless user and user.id
    { 
      status: 200,
      success: true, 
      # auth_token: user.authenticatable_salt, 
      token: JsonWebToken.encode({user_id: user.id}), 
      email: user.email,
      name:"#{user.first_name} #{user.last_name}", 
      role: user.try(:role).try(:key), 
      user_id: user.id,
      department_name: user.try(:department).try(:name),
      branch_name: user.try(:branch).try(:name),
      department_id: user.try(:department_id),
      branch_id: user.try(:branch).try(:id)
    }
  end

end